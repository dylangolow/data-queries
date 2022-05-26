WITH all_txns as (SELECT account, usd_amount as vol, date FROM (
                                                                   SELECT block_time as date, trader_a as account, usd_amount FROM dex.trades
                                                                   WHERE project='Sushiswap'
                                                                   UNION SELECT block_time as date, trader_b as account, usd_amount FROM dex.trades
                                                                   WHERE project='Sushiswap'
                                                               ) t
                  WHERE date >= '2022-02-01 00:00' and date <  '2022-05-01 00:00'
),
     feb_txns AS (SELECT account, vol, date FROM all_txns
                  WHERE date >= '2022-02-01 00:00' and date <  '2022-03-01 00:00'),
     feb_accounts AS (SELECT sum(vol) as vol, account from feb_txns GROUP BY account),
     mar_txns as (SELECT account, vol, date FROM all_txns
                  WHERE date >= '2022-03-01 00:00' and date <  '2022-04-01 00:00'),
     mar_accounts AS (SELECT sum(vol) as vol, account from mar_txns GROUP BY account),
     feb_cohort AS (SELECT * FROM feb_accounts WHERE vol > 19.02),
     feb_cohort_b AS (SELECT * FROM feb_accounts WHERE vol > 100),
     feb_cohort_c AS (SELECT * FROM feb_accounts WHERE vol > 1000),
     feb_cohort_d AS (SELECT * FROM feb_accounts WHERE vol > 5000),
     feb_cohort_e AS (SELECT * FROM feb_accounts WHERE vol > 10000),
     feb_cohort_f AS (SELECT * FROM feb_accounts WHERE vol > 50000),
     feb_cohort_g AS (SELECT * FROM feb_accounts WHERE vol > 100000),
     feb_cohort_h AS (SELECT * FROM feb_accounts WHERE vol > 250000),
     feb_cohort_i AS (SELECT * FROM feb_accounts WHERE vol > 500000),
     feb_cohort_j AS (SELECT * FROM feb_accounts WHERE vol > 1000000),
     feb_cohort_k AS (SELECT * FROM feb_accounts WHERE vol > 5000000),
     feb_cohort_l AS (SELECT * FROM feb_accounts WHERE vol > 10000000),

     mar_cohort AS (SELECT * FROM mar_accounts WHERE vol > 3.8),
     mar_cohort_b AS (SELECT * FROM mar_accounts WHERE vol > 100),
     mar_cohort_c AS (SELECT * FROM mar_accounts WHERE vol > 1000),
     mar_cohort_d AS (SELECT * FROM mar_accounts WHERE vol > 5000),
     mar_cohort_e AS (SELECT * FROM mar_accounts WHERE vol > 10000),
     mar_cohort_f AS (SELECT * FROM mar_accounts WHERE vol > 50000),
     mar_cohort_g AS (SELECT * FROM mar_accounts WHERE vol > 100000),
     mar_cohort_h AS (SELECT * FROM mar_accounts WHERE vol > 250000),
     mar_cohort_i AS (SELECT * FROM mar_accounts WHERE vol > 500000),
     mar_cohort_j AS (SELECT * FROM mar_accounts WHERE vol > 1000000),
     mar_cohort_k AS (SELECT * FROM mar_accounts WHERE vol > 5000000),
     mar_cohort_l AS (SELECT * FROM mar_accounts WHERE vol > 10000000),
     "txs" as (SELECT * FROM all_txns
               WHERE account IN (SELECT "account" FROM "feb_cohort") -- swap feb/march cohort here
                 AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_b" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_b") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_c" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_c") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_d" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_d") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_e" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_e") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_f" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_f") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_g" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_g") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_h" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_h") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_i" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_i") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_j" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_j") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_k" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_k") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_feb_l" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_l") -- swap feb/march cohort here
                       AND "date" >= '2022-02-01 00:00:00' AND "date" < '2022-03-01 00:00:00'), -- swap dates here
     "txs_mar" as (SELECT * FROM all_txns
                   WHERE account IN (SELECT "account" FROM "feb_cohort") -- swap feb/march cohort here
                     AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_b" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_b") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_c" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_c") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_d" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_d") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_e" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_e") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_f" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_f") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_g" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_g") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_h" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_h") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_i" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_i") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_j" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_j") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_k" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_k") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_l" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_l") -- swap feb/march cohort here
                       AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_apr" as (SELECT * FROM all_txns
                   WHERE account IN (SELECT "account" FROM "feb_cohort") -- swap feb/march cohort here
                     AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_b" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_b") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_c" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_c") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_d" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_d") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_e" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_e") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_f" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_f") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_g" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_g") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_h" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_h") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_i" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_i") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_j" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_j") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_k" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_k") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_l" as (SELECT * FROM all_txns
                     WHERE account IN (SELECT "account" FROM "feb_cohort_l") -- swap feb/march cohort here
                       AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar" as (SELECT * FROM all_txns
                          WHERE account IN (SELECT "account" FROM "mar_cohort") -- swap feb/march cohort here
                            AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_b" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_b") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_c" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_c") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_d" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_d") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_e" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_e") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_f" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_f") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_g" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_g") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_h" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_h") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_i" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_i") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_j" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_j") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_k" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_k") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_mar_on_mar_l" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_l") -- swap feb/march cohort here
                              AND "date" >= '2022-03-01 00:00:00' AND "date" < '2022-04-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar" as (SELECT * FROM all_txns
                          WHERE account IN (SELECT "account" FROM "mar_cohort") -- swap feb/march cohort here
                            AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_b" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_b") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_c" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_c") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_d" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_d") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_e" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_e") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_f" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_f") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_g" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_g") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_h" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_h") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_i" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_i") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_j" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_j") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_k" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_k") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "txs_apr_on_mar_l" as (SELECT * FROM all_txns
                            WHERE account IN (SELECT "account" FROM "mar_cohort_l") -- swap feb/march cohort here
                              AND "date" >= '2022-04-01 00:00:00' AND "date" < '2022-05-01 00:00:00'), -- swap dates here
     "metrics" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs"
         GROUP BY "account"),
     "metrics_feb_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_b"
         GROUP BY "account"),
     "metrics_feb_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_c"
         GROUP BY "account"),
     "metrics_feb_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_d"
         GROUP BY "account"),
     "metrics_feb_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_e"
         GROUP BY "account"),
     "metrics_feb_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_f"
         GROUP BY "account"),
     "metrics_feb_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_g"
         GROUP BY "account"),
     "metrics_feb_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_h"
         GROUP BY "account"),
     "metrics_feb_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_i"
         GROUP BY "account"),
     "metrics_feb_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_j"
         GROUP BY "account"),
     "metrics_feb_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_k"
         GROUP BY "account"),
     "metrics_feb_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_feb_l"
         GROUP BY "account"),
     "metrics_mar" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar"
         GROUP BY "account"),
     "metrics_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_b"
         GROUP BY "account"),
     "metrics_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_c"
         GROUP BY "account"),
     "metrics_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_d"
         GROUP BY "account"),
     "metrics_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_e"
         GROUP BY "account"),
     "metrics_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_f"
         GROUP BY "account"),
     "metrics_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_g"
         GROUP BY "account"),
     "metrics_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_h"
         GROUP BY "account"),
     "metrics_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_i"
         GROUP BY "account"),
     "metrics_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_j"
         GROUP BY "account"),
     "metrics_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_k"
         GROUP BY "account"),
     "metrics_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_l"
         GROUP BY "account"),

     "metrics_apr" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr"
         GROUP BY "account"),
     "metrics_apr_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_b"
         GROUP BY "account"),
     "metrics_apr_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_c"
         GROUP BY "account"),
     "metrics_apr_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_d"
         GROUP BY "account"),
     "metrics_apr_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_e"
         GROUP BY "account"),
     "metrics_apr_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_f"
         GROUP BY "account"),
     "metrics_apr_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_g"
         GROUP BY "account"),
     "metrics_apr_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_h"
         GROUP BY "account"),
     "metrics_apr_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_i"
         GROUP BY "account"),
     "metrics_apr_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_j"
         GROUP BY "account"),
     "metrics_apr_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_k"
         GROUP BY "account"),
     "metrics_apr_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_l"
         GROUP BY "account"),

     "metrics_mar_on_mar" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar"
         GROUP BY "account"),
     "metrics_mar_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_b"
         GROUP BY "account"),
     "metrics_mar_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_c"
         GROUP BY "account"),
     "metrics_mar_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_d"
         GROUP BY "account"),
     "metrics_mar_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_e"
         GROUP BY "account"),
     "metrics_mar_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_f"
         GROUP BY "account"),
     "metrics_mar_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_g"
         GROUP BY "account"),
     "metrics_mar_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_h"
         GROUP BY "account"),
     "metrics_mar_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_i"
         GROUP BY "account"),
     "metrics_mar_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_j"
         GROUP BY "account"),
     "metrics_mar_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_k"
         GROUP BY "account"),
     "metrics_mar_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_mar_on_mar_l"
         GROUP BY "account"),

     "metrics_apr_on_mar" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar"
         GROUP BY "account"),
     "metrics_apr_on_mar_b" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_b"
         GROUP BY "account"),
     "metrics_apr_on_mar_c" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_c"
         GROUP BY "account"),
     "metrics_apr_on_mar_d" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_d"
         GROUP BY "account"),
     "metrics_apr_on_mar_e" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_e"
         GROUP BY "account"),
     "metrics_apr_on_mar_f" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_f"
         GROUP BY "account"),
     "metrics_apr_on_mar_g" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_g"
         GROUP BY "account"),
     "metrics_apr_on_mar_h" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_h"
         GROUP BY "account"),
     "metrics_apr_on_mar_i" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_i"
         GROUP BY "account"),
     "metrics_apr_on_mar_j" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_j"
         GROUP BY "account"),
     "metrics_apr_on_mar_k" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_k"
         GROUP BY "account"),
     "metrics_apr_on_mar_l" AS (
         SELECT "account", COUNT(*) AS "num_trades", COUNT(DISTINCT EXTRACT("DAY" FROM "date")) AS "num_days_traded"
         FROM "txs_apr_on_mar_l"
         GROUP BY "account"),

     "feb_vol_a" as (SELECT * FROM "feb_accounts" WHERE vol < 0.04),
     "feb_vol_b" as (SELECT * FROM "feb_accounts" WHERE vol >= 0.04),
     "feb_vol_c" as (SELECT * FROM "feb_accounts" WHERE vol >= 0.38),
     "feb_vol_d" as (SELECT * FROM "feb_accounts" WHERE vol >= 1.9),
     "feb_vol_e" as (SELECT * FROM "feb_accounts" WHERE vol >= 3.8),
     "feb_vol_f" as (SELECT * FROM "feb_accounts" WHERE vol >= 19.02),
     retention_stats as (SELECT * FROM (
                                           -- MARCH COHORTS
                                           SELECT CONCAT('label_', 'metrics_mar_comp1_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_l"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_l"
                                                                                                                                                                                                                                                                                                                            -- FEB COHORTS                                                                                                                                                                                                                                                                              -- FEB COHORTS
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_b"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_c"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_d"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_e"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_f"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_g"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_h"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_i"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_j"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_k"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_l"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_b"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_c"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_d"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_e"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_f"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_g"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_h"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_i"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_j"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_k"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_l"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_b"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_c"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_d"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_e"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_f"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_g"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_h"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_i"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_j"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_k"
                                           UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_l"

                                       ) t),
     avg_stats as (SELECT * FROM (
                                     -- FEB
                                     SELECT CONCAT('label_', 'metrics_feb_comp1_feb_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_b"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_c"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_d"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_e"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_f"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_g"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_h"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_i"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_j"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_k"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_l"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_b"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_c"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_d"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_e"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_f"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_g"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_h"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_i"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_j"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_k"
                                     UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_l"
                                                                                                                                                                                                              -- MARCH
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_l"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_b"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_c"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_d"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_e"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_f"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_g"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_h"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_i"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_j"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_k"
                                     UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_l"

                                 ) t2)

     -- SELECT * FROM (
     --         SELECT COUNT(*), CONCAT('label_', 'feb_vol_a') as label from "feb_vol_a"
     --             UNION SELECT COUNT(*), CONCAT('label_', 'feb_vol_b') as label from "feb_vol_b"
     --             UNION SELECT COUNT(*), CONCAT('label_', 'feb_vol_c') as label  from "feb_vol_c"
     --             UNION SELECT COUNT(*), CONCAT('label_', 'feb_vol_d') as label from "feb_vol_d"
     --             UNION SELECT COUNT(*), CONCAT('label_', 'feb_vol_e') as label from "feb_vol_e"
     --             UNION SELECT COUNT(*), CONCAT('label_', 'feb_vol_f') as label from "feb_vol_f"
     --         ) t
     -- ORDER BY label ASC;

     -- AVG STATS MARCH TO FEB
     -- SELECT * FROM (
     --         SELECT CONCAT('label_', 'metrics_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_b"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_c"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_d"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_e"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_f"
     --         ) t
     -- ORDER BY label ASC;

     -- AVG STATS APRIL TO FEB
     -- SELECT * FROM (
     --         SELECT CONCAT('label_', 'metrics_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_b"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_c"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_d"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_e"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_f"
     --         ) t
     -- ORDER BY label ASC;

     -- AVG STATS MAR TO MAR
     -- SELECT * FROM (
     --         SELECT CONCAT('label_', 'metrics_mar_on_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_b"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_c"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_d"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_e"
     --             UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_f"
     --         ) t
     -- ORDER BY label ASC;

     -- AVG STATS APRIL TO MAR
     -- SELECT * FROM (
     --         SELECT CONCAT('label_', 'metrics_apr_on_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_b"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_c"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_d"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_e"
     --             UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_f"
     --         ) t
     -- ORDER BY label ASC;



     -- MARCH TO FEB RETENTION SUMMARY
     -- SELECT * FROM (
     --     SELECT CONCAT('label_', 'metrics_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_b"
     --         UNION SELECT CONCAT('label_', 'metrics_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_c"
     --         UNION SELECT CONCAT('label_', 'metrics_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_d"
     --         UNION SELECT CONCAT('label_', 'metrics_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_e"
     --         UNION SELECT CONCAT('label_', 'metrics_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_f"
     --     ) t
     -- ORDER BY label ASC;

     -- APRIL TO FEB RETENTION SUMMARY
     --  SELECT * FROM (
     --      SELECT CONCAT('label_', 'metrics_apr_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_b"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_c"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_d"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_e"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_f"
     --      ) t
     --  ORDER BY label ASC;

     -- MAR TO MAR RETENTION SUMMARY
     --  SELECT * FROM (
     --      SELECT CONCAT('label_', 'metrics_mar_on_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_b"
     --          UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_c"
     --          UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_d"
     --          UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_e"
     --          UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) * 100) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_f"
     --      ) t
     --  ORDER BY label ASC;

     -- APRIL TO MAR RETENTION SUMMARY
     --  SELECT * FROM (
     --      SELECT CONCAT('label_', 'metrics_apr_on_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_b"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_c"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_d"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_e"
     --          UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_f"
     --      ) t
     --  ORDER BY label ASC;

     -- MISC METRICS
     -- SELECT * FROM (SELECT COUNT(*) from "feb_custom") t
     -- SELECT * FROM metrics
     -- SELECT COUNT(DISTINCT "account") FROM "txs"
     -- SELECT * FROM ((CAST((SELECT COUNT(DISTINCT "account") FROM "txs") AS FLOAT) /
     --     CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort") AS FLOAT) * 100
     --   ) as percentage, (COUNT(DISTINCT "account") FROM "txs") as count){{unnamed_parameter}}
     -- SELECT (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar") AS FLOAT) /
     --     CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort") AS FLOAT) * 100
     --     ) as percentage UNION SELECT COUNT(DISTINCT "account") as "count" FROM "txs_mar";
     -- SELECT ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded"
     -- FROM "metrics"
     -- SELECT ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded"
     -- FROM "metrics_mar"
     -- SELECT ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded"
     -- FROM "metrics_apr"
     -- SELECT COUNT(*) from feb_custom

     -- MASTER STATS
-- SELECT * FROM (
--                   -- MARCH COHORTS
--                   SELECT CONCAT('label_', 'metrics_mar_comp1_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_b"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_c"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_d"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_e"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_f"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_g"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_h"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_i"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_j"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_k"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_l"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_b"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_c"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_d"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_e"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_f"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_g"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_h"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_i"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_j"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_k"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_l"
--                                                                                                                                                                                                                                                                                                 -- FEB COHORTS
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_feb_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_feb_l"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_l"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "feb_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_l"
--
--               ) t
-- ORDER BY label ASC;

-- MARCH RETENTION SUMMARIES
-- SELECT * FROM (
--     SELECT CONCAT('label_', 'metrics_mar_on_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_b"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_c"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_d"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_e"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_f"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_g"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_h"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_i"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_j"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_k"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_mar_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_mar_on_mar_l"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_b') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_b") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_b") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_b"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_c') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_c") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_c") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_c"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_d') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_d") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_d") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_d"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_e') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_e") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_e") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_e"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_f') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_f") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_f") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_f"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_g') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_g") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_g") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_g"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_h') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_h") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_h") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_h"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_i') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_i") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_i") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_i"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_j') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_j") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_j") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_j"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_k') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_k") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_k") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_k"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_l') as label, (CAST((SELECT COUNT(DISTINCT "account") FROM "txs_apr_on_mar_l") AS FLOAT) / CAST((SELECT COUNT(DISTINCT "account") FROM "mar_cohort_l") AS FLOAT) ) as percentage, COUNT(DISTINCT "account") as "count" FROM "txs_apr_on_mar_l"
--     ) t
-- ORDER BY label ASC;

-- AVG STATS ON BOTH COHORTS
-- SELECT * FROM (
--                   -- FEB
--                   SELECT CONCAT('label_', 'metrics_feb_comp1_feb_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp1_feb_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_l"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp2_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_l"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_b"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_c"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_d"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_e"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_f"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_g"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_h"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_i"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_j"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_k"
--                   UNION SELECT CONCAT('label_', 'metrics_feb_comp3_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_l"
--                   -- MARCH
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_b"
--                   UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_c"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_d"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_e"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_f"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_g"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_h"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_i"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_j"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_k"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp1_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_l"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_b"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_c"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_d"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_e"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_f"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_g"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_h"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_i"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_j"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_k"
--                 UNION SELECT CONCAT('label_', 'metrics_mar_comp2_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_l"
--
--               ) t
-- ORDER BY label ASC;

-- AVG STATS ON FEB COHORTS
-- SELECT * FROM (
--     SELECT CONCAT('label_', 'metrics_feb_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_b"
--         UNION SELECT CONCAT('label_', 'metrics_feb_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_c"
--         UNION SELECT CONCAT('label_', 'metrics_feb_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_d"
--         UNION SELECT CONCAT('label_', 'metrics_feb_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_e"
--         UNION SELECT CONCAT('label_', 'metrics_feb_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_f"
--         UNION SELECT CONCAT('label_', 'metrics_feb_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_g"
--         UNION SELECT CONCAT('label_', 'metrics_feb_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_h"
--         UNION SELECT CONCAT('label_', 'metrics_feb_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_i"
--         UNION SELECT CONCAT('label_', 'metrics_feb_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_j"
--         UNION SELECT CONCAT('label_', 'metrics_feb_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_k"
--         UNION SELECT CONCAT('label_', 'metrics_feb_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_feb_l"
--         UNION SELECT CONCAT('label_', 'metrics_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_b"
--         UNION SELECT CONCAT('label_', 'metrics_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_c"
--         UNION SELECT CONCAT('label_', 'metrics_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_d"
--         UNION SELECT CONCAT('label_', 'metrics_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_e"
--         UNION SELECT CONCAT('label_', 'metrics_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_f"
--         UNION SELECT CONCAT('label_', 'metrics_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_g"
--         UNION SELECT CONCAT('label_', 'metrics_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_h"
--         UNION SELECT CONCAT('label_', 'metrics_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_i"
--         UNION SELECT CONCAT('label_', 'metrics_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_j"
--         UNION SELECT CONCAT('label_', 'metrics_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_k"
--         UNION SELECT CONCAT('label_', 'metrics_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_l"
--         UNION SELECT CONCAT('label_', 'metrics_apr_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_b"
--         UNION SELECT CONCAT('label_', 'metrics_apr_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_c"
--         UNION SELECT CONCAT('label_', 'metrics_apr_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_d"
--         UNION SELECT CONCAT('label_', 'metrics_apr_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_e"
--         UNION SELECT CONCAT('label_', 'metrics_apr_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_f"
--         UNION SELECT CONCAT('label_', 'metrics_apr_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_g"
--         UNION SELECT CONCAT('label_', 'metrics_apr_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_h"
--         UNION SELECT CONCAT('label_', 'metrics_apr_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_i"
--         UNION SELECT CONCAT('label_', 'metrics_apr_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_j"
--         UNION SELECT CONCAT('label_', 'metrics_apr_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_k"
--         UNION SELECT CONCAT('label_', 'metrics_apr_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_l"
--     ) t
-- ORDER BY label ASC;


-- AVG STATS ON MARCH COHORTS
-- SELECT * FROM (
--     SELECT CONCAT('label_', 'metrics_mar_on_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_b"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_c"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_d"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_e"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_f"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_g"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_h"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_i"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_j"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_k"
--         UNION SELECT CONCAT('label_', 'metrics_mar_on_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_mar_on_mar_l"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_b') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_b"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_c') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_c"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_d') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_d"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_e') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_e"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_f') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_f"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_g') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_g"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_h') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_h"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_i') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_i"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_j') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_j"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_k') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_k"
--         UNION SELECT CONCAT('label_', 'metrics_apr_on_mar_l') as label, ROUND(AVG(num_trades)) AS "avg_num_trades", ROUND(AVG(num_days_traded)) AS "avg_num_days_traded" FROM "metrics_apr_on_mar_l"

--     ) t
-- ORDER BY label ASC;



-- SELECT date_trunc('month', block_time) AS month, SUM( usd_amount ) AS usd_volume, trader_a
-- FROM dex."trades" t
-- WHERE project='Uniswap' and block_time >= '2022-02-01 00:00' and block_time <  '2022-03-01 00:00'
-- GROUP BY trader_a, MONTH;
------------------------------------------------------------------------------------------------------
-- MASTER STATS - COMBINE RETENTION AND AVG STATS
SELECT * FROM retention_stats JOIN avg_stats ON retention_stats.label = avg_stats.label ORDER BY label ASC;
