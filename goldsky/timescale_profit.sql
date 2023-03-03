WITH usdcFpmms as (SELECT * FROM orderbook103.fixed_product_market_maker where collateral_token = '0x2791bca1f2de4661ed88a30c99a7a9449aa84174'),
     buys as (SELECT * from orderbook103.transaction t join usdcFpmms f on t.market = f.id where t.type = 'Buy'),
     sells as (SELECT * from orderbook103.transaction t join usdcFpmms f on t.market = f.id where t.type = 'Sell'),
     liquidityAdditions as (SELECT * from orderbook103.fpmm_funding_addition fundingAdd join usdcFpmms f on fundingAdd.fpmm = f.id),
     liquidityRemovals as (SELECT * from orderbook103.fpmm_funding_removal fundingRemove join usdcFpmms f on fundingRemove.fpmm = f.id),
     splits as (SELECT * from orderbook103.split s join orderbook103.condition c on s.condition = c.id join usdcFpmms f on f.id = ANY (c.fixed_product_market_makers)),
     merges as (SELECT * FROM orderbook103.merge m join orderbook103.condition c on m.condition = c.id join usdcFpmms f on f.id = ANY (c.fixed_product_market_makers)),
     redemptions as (SELECT * FROM orderbook103.redemption r join orderbook103.condition c on r.condition = c.id join usdcFpmms f on f.id = ANY (c.fixed_product_market_makers)),
     buysByAccount as (SELECT -sum(trade_amount - fee_amount) as usdc_value, "user" as account FROM buys group by account),
     sellsByAccount as (SELECT sum(trade_amount - fee_amount) as usdc_value, "user" as account from sells group by account),
     splitsByAccount as (SELECT -sum(amount) as usdc_value, stakeholder as account from splits group by account),
     mergesByAccount as (SELECT sum(amount) as usdc_value, stakeholder as account from merges group by account),
     redemptionsByAccount as (SELECT sum(payout) as usdc_value, redeemer as account from redemptions group by account),
--     liquidityAdditionsByAccount as (),
--     liquidityRemovalsByAccount as (),
     sellsMinusBuysByAccount as (SELECT sum(usdc_value) as usdc_value, account FROM (SELECT * from buysByAccount union select * from sellsByAccount) t1 group by account),
     mergesMinusSplitsByAccount as (SELECT sum(usdc_value) as usdc_value, account FROM (SELECT * from splitsByAccount union select * from mergesByAccount) t2 group by account),
     profitWithoutLiqByAccount as (SELECT sum(usdc_value) as usdc_value, account from (
                                                                                          SELECT * FROM buysByAccount UNION SELECT * FROM sellsByAccount UNION SELECT * FROM mergesByAccount UNION SELECT * FROM splitsByAccount UNION SELECT * FROM redemptionsByAccount) t3 group by account
     )


SELECT * from profitWithoutLiqByAccount order by usdc_value desc;
