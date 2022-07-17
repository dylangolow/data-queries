WITH all_txns as (SELECT account, "tradeAmount"/10^6 as vol, timestamp FROM "Transactions"
                  WHERE "timestamp" >= '2022-02-01 00:00' and "timestamp" < '2022-07-01 00:00'),
     feb_txns AS (SELECT account, vol, "timestamp" FROM all_txns
                  WHERE timestamp >= '2022-02-01 00:00' and timestamp <  '2022-03-01 00:00'),
     feb_accounts AS (SELECT sum(vol) as vol, account from feb_txns GROUP BY account),
     mar_txns as (SELECT account, vol, timestamp FROM all_txns
                  WHERE timestamp >= '2022-03-01 00:00' and timestamp <  '2022-04-01 00:00'),
     mar_accounts AS (SELECT sum(vol) as vol, account from mar_txns GROUP BY account),
     apr_txns as (SELECT account, vol, timestamp FROM all_txns
                  WHERE timestamp >= '2022-04-01 00:00' and timestamp <  '2022-05-01 00:00'),
     apr_accounts AS (SELECT sum(vol) as vol, account from apr_txns GROUP BY account),
     may_txns as (SELECT account, vol, timestamp FROM all_txns
                  WHERE timestamp >= '2022-05-01 00:00' and timestamp <  '2022-06-01 00:00'),
     may_accounts AS (SELECT sum(vol) as vol, account from may_txns GROUP BY account),
     june_txns as (SELECT account, vol, timestamp FROM all_txns
                  WHERE timestamp >= '2022-06-01 00:00' and timestamp <  '2022-07-01 00:00'),
     feb_cohort AS (SELECT * FROM feb_accounts WHERE vol > 19.02),
     feb_cohort_b AS (SELECT * FROM feb_accounts WHERE vol > 100 AND vol <= 1000),
     feb_cohort_c AS (SELECT * FROM feb_accounts WHERE vol > 1000 AND vol <= 5000),
     feb_cohort_d AS (SELECT * FROM feb_accounts WHERE vol > 5000 AND vol <= 10000),
     feb_cohort_e AS (SELECT * FROM feb_accounts WHERE vol > 10000 AND vol <= 50000),
     feb_cohort_f AS (SELECT * FROM feb_accounts WHERE vol > 50000 AND vol <= 100000),
     feb_cohort_g AS (SELECT * FROM feb_accounts WHERE vol > 100000 AND vol <= 250000),
     feb_cohort_h AS (SELECT * FROM feb_accounts WHERE vol > 250000 AND vol <= 500000),
     feb_cohort_i AS (SELECT * FROM feb_accounts WHERE vol > 500000 AND vol <= 1000000),
     feb_cohort_j AS (SELECT * FROM feb_accounts WHERE vol > 1000000 AND vol <= 5000000),
     feb_cohort_k AS (SELECT * FROM feb_accounts WHERE vol > 5000000 AND vol <= 10000000),
     feb_cohort_l AS (SELECT * FROM feb_accounts WHERE vol > 10000000),

     mar_cohort AS (SELECT * FROM mar_accounts WHERE vol > 3.8),
     mar_cohort_b AS (SELECT * FROM mar_accounts WHERE vol > 100 AND vol <= 1000),
     mar_cohort_c AS (SELECT * FROM mar_accounts WHERE vol > 1000 AND vol <= 5000),
     mar_cohort_d AS (SELECT * FROM mar_accounts WHERE vol > 5000 AND vol <= 10000),
     mar_cohort_e AS (SELECT * FROM mar_accounts WHERE vol > 10000 AND vol <= 50000),
     mar_cohort_f AS (SELECT * FROM mar_accounts WHERE vol > 50000 AND vol <= 100000),
     mar_cohort_g AS (SELECT * FROM mar_accounts WHERE vol > 100000 AND vol <= 250000),
     mar_cohort_h AS (SELECT * FROM mar_accounts WHERE vol > 250000 AND vol <= 500000),
     mar_cohort_i AS (SELECT * FROM mar_accounts WHERE vol > 500000 AND vol <= 1000000),
     mar_cohort_j AS (SELECT * FROM mar_accounts WHERE vol > 1000000 AND vol <= 5000000),
     mar_cohort_k AS (SELECT * FROM mar_accounts WHERE vol > 5000000 AND vol <= 10000000),
     mar_cohort_l AS (SELECT * FROM mar_accounts WHERE vol > 10000000),
     apr_cohort_b AS (SELECT * FROM apr_accounts WHERE vol > 100 AND vol <= 1000),
     apr_cohort_c AS (SELECT * FROM apr_accounts WHERE vol > 1000 AND vol <= 5000),
     apr_cohort_d AS (SELECT * FROM apr_accounts WHERE vol > 5000 AND vol <= 10000),
     apr_cohort_e AS (SELECT * FROM apr_accounts WHERE vol > 10000 AND vol <= 50000),
     apr_cohort_f AS (SELECT * FROM apr_accounts WHERE vol > 50000 AND vol <= 100000),
     apr_cohort_g AS (SELECT * FROM apr_accounts WHERE vol > 100000 AND vol <= 250000),
     apr_cohort_h AS (SELECT * FROM apr_accounts WHERE vol > 250000 AND vol <= 500000),
     apr_cohort_i AS (SELECT * FROM apr_accounts WHERE vol > 500000 AND vol <= 1000000),
     apr_cohort_j AS (SELECT * FROM apr_accounts WHERE vol > 1000000 AND vol <= 5000000),
     apr_cohort_k AS (SELECT * FROM apr_accounts WHERE vol > 5000000 AND vol <= 10000000),
     apr_cohort_l AS (SELECT * FROM apr_accounts WHERE vol > 10000000),
     may_cohort_b AS (SELECT * FROM may_accounts WHERE vol > 100 AND vol <= 1000),
     may_cohort_c AS (SELECT * FROM may_accounts WHERE vol > 1000 AND vol <= 5000),
     may_cohort_d AS (SELECT * FROM may_accounts WHERE vol > 5000 AND vol <= 10000),
     may_cohort_e AS (SELECT * FROM may_accounts WHERE vol > 10000 AND vol <= 50000),
     may_cohort_f AS (SELECT * FROM may_accounts WHERE vol > 50000 AND vol <= 100000),
     may_cohort_g AS (SELECT * FROM may_accounts WHERE vol > 100000 AND vol <= 250000),
     may_cohort_h AS (SELECT * FROM may_accounts WHERE vol > 250000 AND vol <= 500000),
     may_cohort_i AS (SELECT * FROM may_accounts WHERE vol > 500000 AND vol <= 1000000),
     may_cohort_j AS (SELECT * FROM may_accounts WHERE vol > 1000000 AND vol <= 5000000),
     may_cohort_k AS (SELECT * FROM may_accounts WHERE vol > 5000000 AND vol <= 10000000),
     may_cohort_l AS (SELECT * FROM may_accounts WHERE vol > 10000000),
     "txs" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort")), -- swap feb/march cohort here
     "txs_feb_on_feb_b" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_b")), -- swap feb/march cohort here
     "txs_feb_on_feb_c" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_c")), -- swap feb/march cohort here
     "txs_feb_on_feb_d" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_d")), -- swap feb/march cohort here
     "txs_feb_on_feb_e" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_e")), -- swap feb/march cohort here
     "txs_feb_on_feb_f" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_f")), -- swap feb/march cohort here
     "txs_feb_on_feb_g" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_g")), -- swap feb/march cohort here
     "txs_feb_on_feb_h" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_h")), -- swap feb/march cohort here
     "txs_feb_on_feb_i" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_i")), -- swap feb/march cohort here
     "txs_feb_on_feb_j" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_j")), -- swap feb/march cohort here
     "txs_feb_on_feb_k" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_k")), -- swap feb/march cohort here
     "txs_feb_on_feb_l" as (SELECT * FROM feb_txns WHERE account IN (SELECT "account" FROM "feb_cohort_l")), -- swap feb/march cohort here
     "txs_mar_on_feb" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "feb_cohort")), -- swap feb/march cohort here
     "txs_mar_on_feb_b" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_b")), -- swap feb/march cohort here
     "txs_mar_on_feb_c" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_c")), -- swap feb/march cohort here
     "txs_mar_on_feb_d" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_d")), -- swap feb/march cohort here
     "txs_mar_on_feb_e" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_e")), -- swap feb/march cohort here
     "txs_mar_on_feb_f" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_f")), -- swap feb/march cohort here
     "txs_mar_on_feb_g" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_g")), -- swap feb/march cohort here
     "txs_mar_on_feb_h" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_h")), -- swap feb/march cohort here
     "txs_mar_on_feb_i" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_i")), -- swap feb/march cohort here
     "txs_mar_on_feb_j" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_j")), -- swap feb/march cohort here
     "txs_mar_on_feb_k" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_k")), -- swap feb/march cohort here
     "txs_mar_on_feb_l" as (SELECT * FROM mar_txns  WHERE account IN (SELECT "account" FROM "feb_cohort_l")), -- swap feb/march cohort here
     "txs_apr_on_feb" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort")), -- swap feb/march cohort here
     "txs_apr_on_feb_b" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_b")), -- swap feb/march cohort here
     "txs_apr_on_feb_c" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_c")), -- swap feb/march cohort here
     "txs_apr_on_feb_d" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_d")), -- swap feb/march cohort here
     "txs_apr_on_feb_e" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_e")), -- swap feb/march cohort here
     "txs_apr_on_feb_f" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_f")), -- swap feb/march cohort here
     "txs_apr_on_feb_g" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_g")), -- swap feb/march cohort here
     "txs_apr_on_feb_h" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_h")), -- swap feb/march cohort here
     "txs_apr_on_feb_i" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_i")), -- swap feb/march cohort here
     "txs_apr_on_feb_j" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_j")), -- swap feb/march cohort here
     "txs_apr_on_feb_k" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_k")), -- swap feb/march cohort here
     "txs_apr_on_feb_l" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "feb_cohort_l")), -- swap feb/march cohort here
     "txs_may_on_feb" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort")), -- swap feb/march cohort here
     "txs_may_on_feb_b" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_b")), -- swap feb/march cohort here
     "txs_may_on_feb_c" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_c")), -- swap feb/march cohort here
     "txs_may_on_feb_d" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_d")), -- swap feb/march cohort here
     "txs_may_on_feb_e" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_e")), -- swap feb/march cohort here
     "txs_may_on_feb_f" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_f")), -- swap feb/march cohort here
     "txs_may_on_feb_g" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_g")), -- swap feb/march cohort here
     "txs_may_on_feb_h" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_h")), -- swap feb/march cohort here
     "txs_may_on_feb_i" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_i")), -- swap feb/march cohort here
     "txs_may_on_feb_j" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_j")), -- swap feb/march cohort here
     "txs_may_on_feb_k" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_k")), -- swap feb/march cohort here
     "txs_may_on_feb_l" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "feb_cohort_l")), -- swap feb/march cohort here
     "txs_june_on_feb_b" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_b")), -- swap feb/march cohort here
     "txs_june_on_feb_c" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_c")), -- swap feb/march cohort here
     "txs_june_on_feb_d" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_d")), -- swap feb/march cohort here
     "txs_june_on_feb_e" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_e")), -- swap feb/march cohort here
     "txs_june_on_feb_f" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_f")), -- swap feb/march cohort here
     "txs_june_on_feb_g" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_g")), -- swap feb/march cohort here
     "txs_june_on_feb_h" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_h")), -- swap feb/march cohort here
     "txs_june_on_feb_i" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_i")), -- swap feb/march cohort here
     "txs_june_on_feb_j" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_j")), -- swap feb/march cohort here
     "txs_june_on_feb_k" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_k")), -- swap feb/march cohort here
     "txs_june_on_feb_l" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "feb_cohort_l")), -- swap feb/march cohort here
     "txs_mar_on_mar_b" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_b")), -- swap feb/march cohort here
     "txs_mar_on_mar_c" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_c")), -- swap feb/march cohort here
     "txs_mar_on_mar_d" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_d")), -- swap feb/march cohort here
     "txs_mar_on_mar_e" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_e")), -- swap feb/march cohort here
     "txs_mar_on_mar_f" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_f")), -- swap feb/march cohort here
     "txs_mar_on_mar_g" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_g")), -- swap feb/march cohort here
     "txs_mar_on_mar_h" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_h")), -- swap feb/march cohort here
     "txs_mar_on_mar_i" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_i")), -- swap feb/march cohort here
     "txs_mar_on_mar_j" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_j")), -- swap feb/march cohort here
     "txs_mar_on_mar_k" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_k")), -- swap feb/march cohort here
     "txs_mar_on_mar_l" as (SELECT * FROM mar_txns WHERE account IN (SELECT "account" FROM "mar_cohort_l")), -- swap feb/march cohort here
     "txs_apr_on_mar_b" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_b")), -- swap feb/march cohort here
     "txs_apr_on_mar_c" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_c")), -- swap feb/march cohort here
     "txs_apr_on_mar_d" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_d")), -- swap feb/march cohort here
     "txs_apr_on_mar_e" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_e")), -- swap feb/march cohort here
     "txs_apr_on_mar_f" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_f")), -- swap feb/march cohort here
     "txs_apr_on_mar_g" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_g")), -- swap feb/march cohort here
     "txs_apr_on_mar_h" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_h")), -- swap feb/march cohort here
     "txs_apr_on_mar_i" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_i")), -- swap feb/march cohort here
     "txs_apr_on_mar_j" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_j")), -- swap feb/march cohort here
     "txs_apr_on_mar_k" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_k")), -- swap feb/march cohort here
     "txs_apr_on_mar_l" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "mar_cohort_l")), -- swap feb/march cohort here
     "txs_may_on_mar_b" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_b")), -- swap feb/march cohort here
     "txs_may_on_mar_c" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_c")), -- swap feb/march cohort here
     "txs_may_on_mar_d" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_d")), -- swap feb/march cohort here
     "txs_may_on_mar_e" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_e")), -- swap feb/march cohort here
     "txs_may_on_mar_f" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_f")), -- swap feb/march cohort here
     "txs_may_on_mar_g" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_g")), -- swap feb/march cohort here
     "txs_may_on_mar_h" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_h")), -- swap feb/march cohort here
     "txs_may_on_mar_i" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_i")), -- swap feb/march cohort here
     "txs_may_on_mar_j" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_j")), -- swap feb/march cohort here
     "txs_may_on_mar_k" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_k")), -- swap feb/march cohort here
     "txs_may_on_mar_l" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "mar_cohort_l")), -- swap feb/march cohort here
     "txs_june_on_mar_b" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_b")), -- swap feb/march cohort here
     "txs_june_on_mar_c" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_c")), -- swap feb/march cohort here
     "txs_june_on_mar_d" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_d")), -- swap feb/march cohort here
     "txs_june_on_mar_e" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_e")), -- swap feb/march cohort here
     "txs_june_on_mar_f" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_f")), -- swap feb/march cohort here
     "txs_june_on_mar_g" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_g")), -- swap feb/march cohort here
     "txs_june_on_mar_h" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_h")), -- swap feb/march cohort here
     "txs_june_on_mar_i" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_i")), -- swap feb/march cohort here
     "txs_june_on_mar_j" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_j")), -- swap feb/march cohort here
     "txs_june_on_mar_k" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_k")), -- swap feb/march cohort here
     "txs_june_on_mar_l" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "mar_cohort_l")), -- swap feb/march cohort here
     "txs_apr_on_apr_b" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_b")), -- swap feb/march cohort here
     "txs_apr_on_apr_c" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_c")), -- swap feb/march cohort here
     "txs_apr_on_apr_d" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_d")), -- swap feb/march cohort here
     "txs_apr_on_apr_e" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_e")), -- swap feb/march cohort here
     "txs_apr_on_apr_f" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_f")), -- swap feb/march cohort here
     "txs_apr_on_apr_g" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_g")), -- swap feb/march cohort here
     "txs_apr_on_apr_h" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_h")), -- swap feb/march cohort here
     "txs_apr_on_apr_i" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_i")), -- swap feb/march cohort here
     "txs_apr_on_apr_j" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_j")), -- swap feb/march cohort here
     "txs_apr_on_apr_k" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_k")), -- swap feb/march cohort here
     "txs_apr_on_apr_l" as (SELECT * FROM apr_txns WHERE account IN (SELECT "account" FROM "apr_cohort_l")), -- swap feb/march cohort here
     "txs_may_on_apr_b" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_b")), -- swap feb/march cohort here
     "txs_may_on_apr_c" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_c")), -- swap feb/march cohort here
     "txs_may_on_apr_d" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_d")), -- swap feb/march cohort here
     "txs_may_on_apr_e" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_e")), -- swap feb/march cohort here
     "txs_may_on_apr_f" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_f")), -- swap feb/march cohort here
     "txs_may_on_apr_g" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_g")), -- swap feb/march cohort here
     "txs_may_on_apr_h" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_h")), -- swap feb/march cohort here
     "txs_may_on_apr_i" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_i")), -- swap feb/march cohort here
     "txs_may_on_apr_j" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_j")), -- swap feb/march cohort here
     "txs_may_on_apr_k" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_k")), -- swap feb/march cohort here
     "txs_may_on_apr_l" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "apr_cohort_l")), -- swap feb/march cohort here
     "txs_june_on_apr_b" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_b")), -- swap feb/march cohort here
     "txs_june_on_apr_c" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_c")), -- swap feb/march cohort here
     "txs_june_on_apr_d" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_d")), -- swap feb/march cohort here
     "txs_june_on_apr_e" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_e")), -- swap feb/march cohort here
     "txs_june_on_apr_f" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_f")), -- swap feb/march cohort here
     "txs_june_on_apr_g" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_g")), -- swap feb/march cohort here
     "txs_june_on_apr_h" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_h")), -- swap feb/march cohort here
     "txs_june_on_apr_i" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_i")), -- swap feb/march cohort here
     "txs_june_on_apr_j" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_j")), -- swap feb/march cohort here
     "txs_june_on_apr_k" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_k")), -- swap feb/march cohort here
     "txs_june_on_apr_l" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "apr_cohort_l")), -- swap feb/march cohort here
     "txs_may_on_may_b" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_b")), -- swap feb/march cohort here
     "txs_may_on_may_c" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_c")), -- swap feb/march cohort here
     "txs_may_on_may_d" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_d")), -- swap feb/march cohort here
     "txs_may_on_may_e" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_e")), -- swap feb/march cohort here
     "txs_may_on_may_f" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_f")), -- swap feb/march cohort here
     "txs_may_on_may_g" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_g")), -- swap feb/march cohort here
     "txs_may_on_may_h" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_h")), -- swap feb/march cohort here
     "txs_may_on_may_i" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_i")), -- swap feb/march cohort here
     "txs_may_on_may_j" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_j")), -- swap feb/march cohort here
     "txs_may_on_may_k" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_k")), -- swap feb/march cohort here
     "txs_may_on_may_l" as (SELECT * FROM may_txns WHERE account IN (SELECT "account" FROM "may_cohort_l")), -- swap feb/march cohort here
     "txs_june_on_may_b" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_b")), -- swap feb/march cohort here
     "txs_june_on_may_c" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_c")), -- swap feb/march cohort here
     "txs_june_on_may_d" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_d")), -- swap feb/march cohort here
     "txs_june_on_may_e" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_e")), -- swap feb/march cohort here
     "txs_june_on_may_f" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_f")), -- swap feb/march cohort here
     "txs_june_on_may_g" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_g")), -- swap feb/march cohort here
     "txs_june_on_may_h" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_h")), -- swap feb/march cohort here
     "txs_june_on_may_i" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_i")), -- swap feb/march cohort here
     "txs_june_on_may_j" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_j")), -- swap feb/march cohort here
     "txs_june_on_may_k" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_k")), -- swap feb/march cohort here
     "txs_june_on_may_l" as (SELECT * FROM june_txns WHERE account IN (SELECT "account" FROM "may_cohort_l")), -- swap feb/march cohort here
     "metrics" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs"
         GROUP BY "account"),
     "metrics_feb_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_b"
         GROUP BY "account"),
     "metrics_2feb_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_c"
         GROUP BY "account"),
     "metrics_feb_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_d"
         GROUP BY "account"),
     "metrics_feb_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_e"
         GROUP BY "account"),
     "metrics_feb_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_f"
         GROUP BY "account"),
     "metrics_feb_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_g"
         GROUP BY "account"),
     "metrics_feb_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_h"
         GROUP BY "account"),
     "metrics_feb_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_i"
         GROUP BY "account"),
     "metrics_feb_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_j"
         GROUP BY "account"),
     "metrics_feb_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_k"
         GROUP BY "account"),
     "metrics_feb_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_feb_on_feb_l"
         GROUP BY "account"),
     "metrics_mar" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb"
         GROUP BY "account"),
     "metrics_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_b"
         GROUP BY "account"),
     "metrics_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_c"
         GROUP BY "account"),
     "metrics_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_d"
         GROUP BY "account"),
     "metrics_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_e"
         GROUP BY "account"),
     "metrics_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_f"
         GROUP BY "account"),
     "metrics_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_g"
         GROUP BY "account"),
     "metrics_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_h"
         GROUP BY "account"),
     "metrics_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_i"
         GROUP BY "account"),
     "metrics_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_j"
         GROUP BY "account"),
     "metrics_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_k"
         GROUP BY "account"),
     "metrics_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_feb_l"
         GROUP BY "account"),

     "metrics_apr" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb"
         GROUP BY "account"),
     "metrics_apr_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_b"
         GROUP BY "account"),
     "metrics_apr_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_c"
         GROUP BY "account"),
     "metrics_apr_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_d"
         GROUP BY "account"),
     "metrics_apr_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_e"
         GROUP BY "account"),
     "metrics_apr_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_f"
         GROUP BY "account"),
     "metrics_apr_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_g"
         GROUP BY "account"),
     "metrics_apr_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_h"
         GROUP BY "account"),
     "metrics_apr_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_i"
         GROUP BY "account"),
     "metrics_apr_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_j"
         GROUP BY "account"),
     "metrics_apr_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_k"
         GROUP BY "account"),
     "metrics_apr_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_feb_l"
         GROUP BY "account"),
     "metrics_may_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_b"
         GROUP BY "account"),
     "metrics_may_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_c"
         GROUP BY "account"),
     "metrics_may_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_d"
         GROUP BY "account"),
     "metrics_may_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_e"
         GROUP BY "account"),
     "metrics_may_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_f"
         GROUP BY "account"),
     "metrics_may_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_g"
         GROUP BY "account"),
     "metrics_may_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_h"
         GROUP BY "account"),
     "metrics_may_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_i"
         GROUP BY "account"),
     "metrics_may_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_j"
         GROUP BY "account"),
     "metrics_may_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_k"
         GROUP BY "account"),
     "metrics_may_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_feb_l"
         GROUP BY "account"),
     "metrics_june_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_b"
         GROUP BY "account"),
     "metrics_june_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_c"
         GROUP BY "account"),
     "metrics_june_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_d"
         GROUP BY "account"),
     "metrics_june_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_e"
         GROUP BY "account"),
     "metrics_june_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_f"
         GROUP BY "account"),
     "metrics_june_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_g"
         GROUP BY "account"),
     "metrics_june_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_h"
         GROUP BY "account"),
     "metrics_june_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_i"
         GROUP BY "account"),
     "metrics_june_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_j"
         GROUP BY "account"),
     "metrics_june_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_k"
         GROUP BY "account"),
     "metrics_june_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_feb_l"
         GROUP BY "account"),
     "metrics_mar_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_b"
         GROUP BY "account"),
     "metrics_mar_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_c"
         GROUP BY "account"),
     "metrics_mar_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_d"
         GROUP BY "account"),
     "metrics_mar_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_e"
         GROUP BY "account"),
     "metrics_mar_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_f"
         GROUP BY "account"),
     "metrics_mar_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_g"
         GROUP BY "account"),
     "metrics_mar_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_h"
         GROUP BY "account"),
     "metrics_mar_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_i"
         GROUP BY "account"),
     "metrics_mar_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_j"
         GROUP BY "account"),
     "metrics_mar_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_k"
         GROUP BY "account"),
     "metrics_mar_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_mar_on_mar_l"
         GROUP BY "account"),
     "metrics_apr_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_b"
         GROUP BY "account"),
     "metrics_apr_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_c"
         GROUP BY "account"),
     "metrics_apr_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_d"
         GROUP BY "account"),
     "metrics_apr_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_e"
         GROUP BY "account"),
     "metrics_apr_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_f"
         GROUP BY "account"),
     "metrics_apr_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_g"
         GROUP BY "account"),
     "metrics_apr_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_h"
         GROUP BY "account"),
     "metrics_apr_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_i"
         GROUP BY "account"),
     "metrics_apr_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_j"
         GROUP BY "account"),
     "metrics_apr_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_k"
         GROUP BY "account"),
     "metrics_apr_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_mar_l"
         GROUP BY "account"),
     "metrics_may_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_b"
         GROUP BY "account"),
     "metrics_may_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_c"
         GROUP BY "account"),
     "metrics_may_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_d"
         GROUP BY "account"),
     "metrics_may_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_e"
         GROUP BY "account"),
     "metrics_may_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_f"
         GROUP BY "account"),
     "metrics_may_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_g"
         GROUP BY "account"),
     "metrics_may_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_h"
         GROUP BY "account"),
     "metrics_may_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_i"
         GROUP BY "account"),
     "metrics_may_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_j"
         GROUP BY "account"),
     "metrics_may_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_k"
         GROUP BY "account"),
     "metrics_may_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_mar_l"
         GROUP BY "account"),
     "metrics_june_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_b"
         GROUP BY "account"),
     "metrics_june_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_c"
         GROUP BY "account"),
     "metrics_june_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_d"
         GROUP BY "account"),
     "metrics_june_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_e"
         GROUP BY "account"),
     "metrics_june_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_f"
         GROUP BY "account"),
     "metrics_june_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_g"
         GROUP BY "account"),
     "metrics_june_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_h"
         GROUP BY "account"),
     "metrics_june_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_i"
         GROUP BY "account"),
     "metrics_june_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_j"
         GROUP BY "account"),
     "metrics_june_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_k"
         GROUP BY "account"),
     "metrics_june_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_mar_l"
         GROUP BY "account"),
     "metrics_apr_on_apr_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_b"
         GROUP BY "account"),
     "metrics_apr_on_apr_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_c"
         GROUP BY "account"),
     "metrics_apr_on_apr_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_d"
         GROUP BY "account"),
     "metrics_apr_on_apr_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_e"
         GROUP BY "account"),
     "metrics_apr_on_apr_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_f"
         GROUP BY "account"),
     "metrics_apr_on_apr_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_g"
         GROUP BY "account"),
     "metrics_apr_on_apr_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_h"
         GROUP BY "account"),
     "metrics_apr_on_apr_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_i"
         GROUP BY "account"),
     "metrics_apr_on_apr_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_j"
         GROUP BY "account"),
     "metrics_apr_on_apr_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_k"
         GROUP BY "account"),
     "metrics_apr_on_apr_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_apr_on_apr_l"
         GROUP BY "account"),
     "metrics_may_on_apr_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_b"
         GROUP BY "account"),
     "metrics_may_on_apr_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_c"
         GROUP BY "account"),
     "metrics_may_on_apr_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_d"
         GROUP BY "account"),
     "metrics_may_on_apr_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_e"
         GROUP BY "account"),
     "metrics_may_on_apr_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_f"
         GROUP BY "account"),
     "metrics_may_on_apr_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_g"
         GROUP BY "account"),
     "metrics_may_on_apr_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_h"
         GROUP BY "account"),
     "metrics_may_on_apr_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_i"
         GROUP BY "account"),
     "metrics_may_on_apr_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_j"
         GROUP BY "account"),
     "metrics_may_on_apr_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_k"
         GROUP BY "account"),
     "metrics_may_on_apr_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_apr_l"
         GROUP BY "account"),
     "metrics_june_on_apr_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_b"
         GROUP BY "account"),
     "metrics_june_on_apr_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_c"
         GROUP BY "account"),
     "metrics_june_on_apr_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_d"
         GROUP BY "account"),
     "metrics_june_on_apr_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_e"
         GROUP BY "account"),
     "metrics_june_on_apr_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_f"
         GROUP BY "account"),
     "metrics_june_on_apr_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_g"
         GROUP BY "account"),
     "metrics_june_on_apr_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_h"
         GROUP BY "account"),
     "metrics_june_on_apr_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_i"
         GROUP BY "account"),
     "metrics_june_on_apr_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_j"
         GROUP BY "account"),
     "metrics_june_on_apr_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_k"
         GROUP BY "account"),
     "metrics_june_on_apr_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_apr_l"
         GROUP BY "account"),
     "metrics_may_on_may_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_b"
         GROUP BY "account"),
     "metrics_may_on_may_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_c"
         GROUP BY "account"),
     "metrics_may_on_may_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_d"
         GROUP BY "account"),
     "metrics_may_on_may_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_e"
         GROUP BY "account"),
     "metrics_may_on_may_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_f"
         GROUP BY "account"),
     "metrics_may_on_may_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_g"
         GROUP BY "account"),
     "metrics_may_on_may_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_h"
         GROUP BY "account"),
     "metrics_may_on_may_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_i"
         GROUP BY "account"),
     "metrics_may_on_may_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_j"
         GROUP BY "account"),
     "metrics_may_on_may_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_k"
         GROUP BY "account"),
     "metrics_may_on_may_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_may_on_may_l"
         GROUP BY "account"),
     "metrics_june_on_may_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_b"
         GROUP BY "account"),
     "metrics_june_on_may_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_c"
         GROUP BY "account"),
     "metrics_june_on_may_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_d"
         GROUP BY "account"),
     "metrics_june_on_may_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_e"
         GROUP BY "account"),
     "metrics_june_on_may_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_f"
         GROUP BY "account"),
     "metrics_june_on_may_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_g"
         GROUP BY "account"),
     "metrics_june_on_may_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_h"
         GROUP BY "account"),
     "metrics_june_on_may_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_i"
         GROUP BY "account"),
     "metrics_june_on_may_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_j"
         GROUP BY "account"),
     "metrics_june_on_may_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_k"
         GROUP BY "account"),
     "metrics_june_on_may_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "timestamp")) AS "num_days_traded"
         FROM "txs_june_on_may_l"
         GROUP BY "account"),

     percentage_feb_on_feb_h as (SELECT COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT), 0),0) as percentage),
     percentage_feb_on_feb_i as (SELECT COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT), 0),0) as percentage),
     retention_stats as (SELECT * FROM (
                                           -- FEB COHORTS
                                           SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_on_feb_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_on_feb_l"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_feb_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_feb_l"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_feb_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_feb_l"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_feb_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_l"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_feb_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_feb_l"


                                           -- MARCH COHORTS
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_l"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_l"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_mar_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_mar_l"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_mar_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_mar_l"

                                            -- APR COHORTS
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_b"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_c"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_d"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_e"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_f"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_g"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_h"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_i"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_j"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_k"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_apr_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_apr_l"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_b"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_c"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_d"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_e"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_f"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_g"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_h"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_i"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_j"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_k"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_apr_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_apr_l"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_b"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_c"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_d"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_e"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_f"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_g"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_h"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_i"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_j"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_k"
                                           UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_apr_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "apr_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_apr_l"

                                           -- MAY COHORTS
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_b"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_c"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_d"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_e"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_f"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_g"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_h"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_i"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_j"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_k"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_may_on_may_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_may_on_may_l"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_b') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_b") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_b") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_b"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_c') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_c") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_c") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_c"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_d') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_d") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_d") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_d"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_e') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_e") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_e") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_e"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_f') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_f") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_f") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_f"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_g') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_g") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_g") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_g"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_h') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_h") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_h") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_h"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_i') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_i") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_i") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_i"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_j') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_j") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_j") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_j"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_k') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_k") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_k") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_k"
                                           UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_l') as label, COALESCE(CAST((SELECT COUNT(DISTINCT "account") FROM "txs_june_on_may_l") AS FLOAT) / NULLIF(CAST((SELECT COUNT(DISTINCT "account") FROM "may_cohort_l") AS FLOAT),0),0) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_june_on_may_l"

                                       ) t),
     avg_stats as (SELECT * FROM (
                                     -- FEB
                                     SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_b"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_2feb_c"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_d"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_e"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_f"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_g"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_h"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_i"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_j"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_k"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp1_feb_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_l"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp2_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_b"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_c"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_d"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_e"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_f"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_g"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_h"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_i"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_j"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_k"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp3_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_l"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_b"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_c"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_d"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_e"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_f"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_g"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_h"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_i"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_j"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_k"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp4_may_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_l"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_b"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_c"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_d"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_e"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_f"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_g"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_h"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_i"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_j"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_k"
                                     UNION SELECT CONCAT('label_', 'metrics_2feb_comp5_june_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_l"
                                        -- MARCH
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp1_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp2_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp3_may_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_3mar_comp4_june_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_mar_l"

                                     -- APR
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_b"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_c"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_d"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_e"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_f"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_g"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_h"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_i"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_j"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_k"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp1_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_apr_l"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_b"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_c"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_d"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_e"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_f"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_g"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_h"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_i"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_j"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_k"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp2_may_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_apr_l"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_b"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_c"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_d"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_e"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_f"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_g"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_h"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_i"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_j"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_k"
                                     UNION SELECT CONCAT('label_', 'metrics_4apr_comp3_june_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_apr_l"

                                      -- MAY
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_b"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_c"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_d"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_e"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_f"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_g"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_h"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_i"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_j"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_k"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp1_may_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_may_on_may_l"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_b"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_c"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_d"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_e"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_f"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_g"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_h"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_i"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_j"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_k"
                                     UNION SELECT CONCAT('label_', 'metrics_5may_comp2_june_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_june_on_may_l"

                                 ) t2)

------------------------------------------------------------------------------------------------------
-- MASTER STATS - COMBINE RETENTION AND AVG STATS
SELECT * FROM retention_stats JOIN avg_stats ON retention_stats.label = avg_stats.label ORDER BY retention_stats.label ASC;
-- SELECT * FROM percentage_feb_on_feb_i UNION SELECT * FROM percentage_feb_on_feb_h;
