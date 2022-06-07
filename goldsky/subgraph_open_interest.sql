WITH positions_above_zero AS (
    SELECT * FROM "subgraph".market_position WHERE net_quantity > 0
),
     buys AS (SELECT * FROM subgraph.transaction WHERE type='Buy'),
     sells AS (SELECT * FROM subgraph.transaction WHERE type='Sell'),
     buy_minus_sell AS (
         SELECT sum(value)/1000000 as buy_minus_sell, market FROM
             (SELECT trade_amount as value, market FROM buys
              UNION SELECT -trade_amount as value, market from sells) t
         GROUP BY market),

     market_liq AS (SELECT scaled_liquidity_parameter, id FROM subgraph.fixed_product_market_maker WHERE scaled_liquidity_parameter > 0),
     conditions_with_fpmm AS (SELECT *, fixed_product_market_makers[1] as fpmm from subgraph.condition WHERE fixed_product_market_makers!='{}'),

     -- conditions_with_fpmm AS (SELECT id, array_agg(fixed_product_market_makers) from subgraph.condition GROUP BY id HAVING Count(fixed_product_market_makers) > 1),
     condition_join_fpmm AS (SELECT * FROM subgraph.fixed_product_market_maker f JOIN (SELECT fixed_product_market_makers[1] as fpmm, id, resolution_timestamp FROM subgraph.condition) c ON c.fpmm = f.id),
     splits AS (SELECT * FROM subgraph.split),
     merges AS (SELECT * FROM subgraph.merge),
     redemptions AS (SELECT * FROM subgraph.redemption where redeemer!='0x45373c80906b6d1d3c66de6e2dde4d30709c239b'),
     -- bs_cons AS (SELECT buy_minus_sell JOIN conditions_with_fpmm ON market = fpmm),

     -- bs_redemptions AS (
     --     SELECT * FROM (
     --         SELECT buy_minus_sell b JOIN conditions_with_fpmm c1 ON b.market = c1.fpmm) t1
     --         JOIN (
     --             SELECT -sum(payout) as value, condition FROM redemptions r
     --             JOIN conditions_with_fpmm c2 on r.condition = c2.id) t2
     --         ON t1.fpmm = t2.fpmm),
     -- redemptions AS (SELECT * FROM subgraph.redemption),
     total_splits AS (SELECT sum(amount)/1000000 as total_splits, condition from splits GROUP BY condition),
     total_merges as (SELECT sum(amount)/1000000 as total_merges, condition from merges GROUP BY condition),
     total_payouts as (SELECT sum(payout)/1000000 as total_payouts, condition from redemptions where redeemer!='0x45373c80906b6d1d3c66de6e2dde4d30709c239b' GROUP BY condition),
     new_oi AS (SELECT sum(value)/1000000 as new_oi from (
                                                             SELECT sum(amount) as value from splits
                                                             UNION SELECT -sum(amount) as value from merges
                                                             UNION SELECT -sum(payout) as value from redemptions) t),
     s_m AS (SELECT sum(value)/1000000 as s_m from (
                                                       SELECT sum(amount) as value from splits
                                                       UNION SELECT -sum(amount) as value from merges ) t),
     sum_positions AS (SELECT sum(net_value)/1000000 as positions FROM positions_above_zero),
     positions_by_condition AS (SELECT sum(net_value)/1000000 as positions, market FROM positions_above_zero GROUP BY market),
     sum_liquidity AS (SELECT sum(scaled_liquidity_parameter) as liq FROM subgraph.fixed_product_market_maker),
     open_interest AS (SELECT sum(value) as open_interest FROM (SELECT "positions" as value from sum_positions UNION SELECT "liq" as value from sum_liquidity) t)
-- SELECT count(*) FROM positions
-- SELECT * from sum_positions, sum_liquidity, open_interest, new_oi, total_splits, total_merges, total_payouts, s_m;
-- SELECT * from positions LIMIT 10;
-- SELECT * FROM positions_by_condition ORDER BY positions DESC;
-- SELECT * FROM buy_minus_sell ORDER BY buy_minus_sell DESC;
-- SELECT * FROM buys limit 10;
-- SELECT * FROM condition_join_fpmm;
-- SELECT COUNT(*) FROM conditions_with_fpmm;
-- SELECT * FROM conditions_with_fpmm;
-- SELECT COUNT(*) from bs_cons;
-- SELECT COUNT(*) FROM condition_join_fpmm;
-- SELECT buy_minus_sell JOIN conditions_with_fpmm ON market = fpmm
-- SELECT * FROM buy_minus_sell join market_liq on buy_minus_sell.market = market_liq.id ORDER BY scaled_liquidity_parameter DESC;
SELECT * FROM buy_minus_sell
                  JOIN market_liq ON buy_minus_sell.market = market_liq.id
                  JOIN condition_join_fpmm ON condition_join_fpmm.fpmm = market_liq.id
              -- JOIN total_splits ON condition = market_liq.id
WHERE resolution_timestamp IS NULL
ORDER BY market_liq.scaled_liquidity_parameter DESC;
