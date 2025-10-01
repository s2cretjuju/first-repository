-- -- *️⃣ 모든 컬럼에 대해 데이터 포인트 수 집계
-- SELECT
--   COUNT(InvoiceNo)   AS InvoiceNo_count,
--   COUNT(StockCode)   AS StockCode_count,
--   COUNT(Description) AS Description_count,
--   COUNT(Quantity)    AS Quantity_count,
--   COUNT(InvoiceDate) AS InvoiceDate_count,
--   COUNT(UnitPrice)   AS UnitPrice_count,
--   COUNT(CustomerID)  AS CustomerID_count,
--   COUNT(Country)     AS Country_count
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 누락된 값이 있는 모든 컬럼
-- SELECT
--   COUNT(*) AS total_rows,
--   COUNT(InvoiceNo)   AS InvoiceNo_non_nulls,
--   COUNT(StockCode)   AS StockCode_non_nulls,
--   COUNT(Description) AS Description_non_nulls,
--   COUNT(Quantity)    AS Quantity_non_nulls,
--   COUNT(InvoiceDate) AS InvoiceDate_non_nulls,
--   COUNT(UnitPrice)   AS UnitPrice_non_nulls,
--   COUNT(CustomerID)  AS CustomerID_non_nulls,
--   COUNT(Country)     AS Country_non_nulls
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ CASE WHEN을 사용해 각 컬럼의 결측치 비율 계산 및 UNION ALL로 연결
-- -- 전체 행 수를 기준으로 각 컬럼별 결측치 비율 계산 (백분율)
-- SELECT 'InvoiceNo' AS column_name,
--        ROUND(COUNT(CASE WHEN InvoiceNo IS NULL THEN 1 END) / COUNT(*) * 100, 2) AS null_ratio_percent
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'StockCode',
--        ROUND(COUNT(CASE WHEN StockCode IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'Description',
--        ROUND(COUNT(CASE WHEN Description IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'Quantity',
--        ROUND(COUNT(CASE WHEN Quantity IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'InvoiceDate',
--        ROUND(COUNT(CASE WHEN InvoiceDate IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'UnitPrice',
--        ROUND(COUNT(CASE WHEN UnitPrice IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'CustomerID',
--        ROUND(COUNT(CASE WHEN CustomerID IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`

-- UNION ALL
-- SELECT 'Country',
--        ROUND(COUNT(CASE WHEN Country IS NULL THEN 1 END) / COUNT(*) * 100, 2)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ StockCode = '85123A'의 Description 추출
-- SELECT DISTINCT(Description)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE StockCode = '85123A'
-- ORDER BY Description ASC;

-- -- *️⃣ DELETE 구문을 사용하여, WHERE절을 통해 데이터를 제거할 조건 제시
-- DELETE FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE Description IS NULL
-- OR CustomerID IS NULL;

-- -- *️⃣ 8개의 컬럼에 그룹함수를 적용한 후, COUNT가 1보다 큰 데이터를 세어 중복된 행의 수 확인
-- SELECT COUNT(*) AS DuplicateRowsCount
-- FROM (SELECT *
--            , COUNT(*) AS row_count
--       FROM `automatic-rock-473602-a0.modulabs_project.data`
--       GROUP BY InvoiceNo
--              , StockCode
--              , Description
--              , Quantity
--              , InvoiceDate
--              , UnitPrice
--              , CustomerID
--              , Country
--       HAVING row_count > 1
-- );

-- -- *️⃣ CREATE OR REPLACE TABLE 구문을 활용하여 모든 컬럼(*)을 DISTINCT한 데이터로 업데이트
-- CREATE OR REPLACE TABLE
--     `automatic-rock-473602-a0.modulabs_project.data` AS
-- SELECT
--     DISTINCT *
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 남은 행의 개수 확인
-- SELECT
--     COUNT(*) AS FinalRowCount
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 고유한(unique) InvoiceNO 개수 출력
-- SELECT COUNT(DISTINCT InvoiceNO)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 고유한(unique) InvoiceNO 100개 출력
-- SELECT DISTINCT InvoiceNO
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- LIMIT 100;

-- -- *️⃣ InvoiceNO가 'C'로 시작하는 행을 필터링하여 100개 출력
-- SELECT *
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE InvoiceNO LIKE 'C%'
-- LIMIT 100;

-- -- *️⃣ 구매 건 상태가 Canceled인 데이터의 비율(%) (소수점 첫 번쨰까지)
-- SELECT
--     ROUND(
--         (SUM(CASE WHEN InvoiceNo LIKE 'C%' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
--         1
--     ) AS CancelledRatio
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 고유한(unique) StockCode의 개수 출력
-- SELECT COUNT(DISTINCT StockCode)
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ StockCode별 빈도 상위 10개 출력
-- SELECT StockCode
--      , COUNT(*) AS sell_cnt
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY StockCode
-- ORDER BY sell_cnt DESC
-- LIMIT 10;

-- -- *️⃣ StockCode의 문자열 내 숫자 길이 확인
-- WITH UniqueStockCodes AS (
--   SELECT DISTINCT StockCode
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
-- )
-- SELECT
--   LENGTH(StockCode) - LENGTH(REGEXP_REPLACE(StockCode, r'[0-9]', '')) AS number_count,
--   COUNT(*) AS stock_cnt
-- FROM UniqueStockCodes
-- GROUP BY number_count
-- ORDER BY stock_cnt DESC;

-- --*️⃣ 숫자가 0-1개인 값들에는 어떤 코드가 들어있는지 확인
-- SELECT DISTINCT StockCode, number_count
-- FROM (
--   SELECT StockCode,
--     LENGTH(StockCode) - LENGTH(REGEXP_REPLACE(StockCode, r'[0-9]', '')) AS number_count
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
-- ) 
-- WHERE number_count IN (0, 1);

-- --*️⃣ 전체 데이터 수 대비 해당 코드 값들을 가지고 있는 데이터(%) (소수점 둘 째 자리까지)
-- SELECT
--     ROUND(
--         (SUM(
--             CASE
--                 -- StockCode에 숫자가 0개 또는 1개인 경우 (REGEXP_REPLACE를 사용한 로직 재사용)
--                 WHEN LENGTH(StockCode) - LENGTH(REGEXP_REPLACE(StockCode, r'[0-9]', '')) IN (0, 1) THEN 1
--                 ELSE 0
--             END
--         ) * 100.0) / COUNT(*),
--         2
--     ) AS StockCodeRatio
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 숫자가 0-1개인 값들에는 어떤 코드 데이터셋에서 제외
-- DELETE FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE StockCode IN (
--   SELECT DISTINCT StockCode
--   FROM (SELECT StockCode,
--     LENGTH(StockCode) - LENGTH(REGEXP_REPLACE(StockCode, r'[0-9]', '')) AS number_count
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
-- ) 
-- WHERE number_count IN (0, 1)
-- );

-- -- *️⃣ 고유한 Description 별 출현 빈도를 계산하고 상위 30개를 출력
-- SELECT Description
--      , COUNT(*) AS description_cnt
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY Description
-- ORDER BY description_cnt DESC
-- LIMIT 30;

-- -- *️⃣ 대소문자가 혼합된 Description 확인
-- SELECT DISTINCT Description
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE REGEXP_CONTAINS(Description, r'[a-z]');

-- -- *️⃣ 서비스 관련 정보를 포함하는 행들을 제거 및 확인
-- DELETE FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE REGEXP_CONTAINS(Description, r'[a-z]');

-- --*️⃣ 대소문자를 혼합하고 있는 데이터를 대문자로 표준화
-- UPDATE `automatic-rock-473602-a0.modulabs_project.data`
-- SET Description = UPPER(Description)
-- WHERE 1=1;

-- -- *️⃣ UnitPrice의 최솟값, 최댓값, 평균
-- SELECT MIN(UnitPrice) AS min_unitprice
--      , MAX(UnitPrice) AS max_unitprice
--      , AVG(UnitPrice) AS avg_unitprice
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 단가가 0원인 거래의 개수, 구매 수량(Quantity)의 최솟값, 최댓값, 평균값
-- SELECT COUNT(Quantity) AS cnt_quantity
--      , MIN(Quantity) AS min_quantity
--      , MAX(QUantity) AS max_quantity
--      , AVG(Quantity) AS avg_quantity
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE UnitPrice = 0;

-- -- *️⃣ UnitPrice = 0인 데이터 제거
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.data` AS 
-- SELECT *
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- WHERE UnitPrice > 0;

-- -- *️⃣ InvoviceDate를 'YYYY-MM-DD HH:MM:SS'형태에서 'YYYY-MM-DD'형태로 변환
-- CREATE OR REPLACE TABLE
--     `automatic-rock-473602-a0.modulabs_project.data` AS
-- SELECT
--     * REPLACE(DATE(InvoiceDate) AS InvoiceDate)
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 가장 최근 구매 일자 확인
-- SELECT 
--   MAX(InvoiceDate) AS most_recent_date
-- FROM `automatic-rock-473602-a0.modulabs_project.data`;

-- -- *️⃣ 유저별로 가장 큰 InvoiceDate를 찾아서 가장 최근 구매일로 저장
-- SELECT 
--     CustomerID
--   , MAX(InvoiceDate) AS InvoiceDay
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY CustomerID
-- ORDER BY CustomerID ASC;

-- -- *️⃣ 가장 최근 일자(most_recent_date)와 유저별 마지막 구매일(InvoiceDay)간의 차이 계산
-- SELECT
--   CustomerID, 
--   EXTRACT(DAY FROM MAX(InvoiceDay) OVER () - InvoiceDay) AS recency
-- FROM (
--   SELECT 
--     CustomerID,
--     MAX(DATE(InvoiceDate)) AS InvoiceDay
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID
-- );

-- -- *️⃣ 최종 데티어셋에 필요한 데이터들을 각각 정제해서 이어붙이고, 지금까지의 결과를 user_r이라는 테이블로 저장
-- CREATE OR REPLACE TABLE
--     `automatic-rock-473602-a0.modulabs_project.user_r` AS
-- SELECT
--     CustomerID,
--     EXTRACT(DAY FROM MAX(InvoiceDay) OVER () - InvoiceDay) AS recency
-- FROM
--     (
--         SELECT
--             CustomerID,
--             MAX(InvoiceDate) AS InvoiceDay
--         FROM
--             `automatic-rock-473602-a0.modulabs_project.data`
--         GROUP BY
--             CustomerID
--     );

-- -- *️⃣ 전체 거래 건수 계산
-- SELECT
--   CustomerID
-- , COUNT(DISTINCT InvoiceNO) AS purchase_cnt
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY CustomerID;

-- -- *️⃣ 구매한 아이템의 총 수량 계산
-- SELECT
--   CustomerID
-- , SUM(Quantity) AS item_cnt
-- FROM `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY CustomerID;

-- -- *️⃣ 1과 2의 결과를 합쳐서 user_rf라는 이름의 테이블에 저장
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.user_rf` AS

-- -- (1) 전체 거래 건수 계산
-- WITH purchase_cnt AS (
--   SELECT
--       CustomerID
--     , COUNT(DISTINCT InvoiceNo) AS purchase_cnt
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID
-- ),

-- -- (2) 구매한 아이템 총 수량 계산
-- item_cnt AS (
--   SELECT
--       CustomerID
--     , SUM(Quantity) AS item_cnt
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID
-- )

-- -- 기존의 user_r에 (1)과 (2)를 통합
-- SELECT
--   pc.CustomerID,
--   pc.purchase_cnt,
--   ic.item_cnt,
--   ur.recency
-- FROM purchase_cnt AS pc
-- JOIN item_cnt AS ic
--   ON pc.CustomerID = ic.CustomerID
-- JOIN `automatic-rock-473602-a0.modulabs_project.user_r` AS ur
--   ON pc.CustomerID = ur.CustomerID;

-- -- *️⃣ 1. 고객별 총 지출액 계산 - 소수점 첫 째자리에서 반올림
-- SELECT
--     CustomerID,
--     ROUND(SUM(Quantity * UnitPrice)) AS total_spent
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.data`
-- GROUP BY
--     CustomerID;

-- -- *️⃣ 2. 고객별 평균 거래 금액 계산 1) data 테이블을 user_rf 테이블과 조인(LEFT JOIN) 한 후 2) purchase_cnt로 나누어서 3) user_rfm 테이블로 저장
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.user_rfm` AS
-- SELECT
--   rf.CustomerID AS CustomerID,
--   rf.purchase_cnt,
--   rf.item_cnt,
--   rf.recency,
--   ut.user_total,
--   -- 총 지출액(user_total)을 거래 건수(purchase_cnt)로 나누어 평균 거래 금액 계산
--   ROUND(ut.user_total / rf.purchase_cnt) AS user_average
-- FROM `automatic-rock-473602-a0.modulabs_project.user_rf` AS rf
-- LEFT JOIN (
--   -- 고객 별 총 지출액 계산
--   SELECT
--     CustomerID,
--     ROUND(SUM(Quantity * UnitPrice)) AS user_total
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID
-- ) AS ut
-- ON rf.CustomerID = ut.CustomerID;

-- -- *️⃣ 최종 user_rfm 테이블을 출력
-- SELECT
--     *
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.user_rfm`;

-- -- *️⃣ 1) 고객별 구매한 상품의 고유한 수 계산, 2) user_rfm 테이블과 결과를 합치고, 3) user_data라는 이름의 테이블에 저장
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.user_data` AS
-- WITH unique_products AS (
--   -- (1) 고객별 고유 상품 수 계산
--   SELECT
--     CustomerID,
--     COUNT(DISTINCT StockCode) AS unique_products
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID
-- )
-- SELECT
--   ur.*,
--   up.* EXCEPT (CustomerID) -- CustomerID를 제외하고 unique_products 컬럼만 선택
-- FROM `automatic-rock-473602-a0.modulabs_project.user_rfm` AS ur
-- JOIN unique_products AS up
--   ON ur.CustomerID = up.CustomerID;

-- -- *️⃣ 평균 구매 소요 일수를 계산하고, 그 결과를 user_data에 통합
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.user_data` AS
-- WITH purchase_intervals AS (
--   -- (2) 고객 별 구매와 구매 사이의 평균 소요 일수
--   SELECT
--     CustomerID,
--     -- interval_의 평균을 계산하고 소수점 둘째 자리에서 반올림.
--     -- 단, 고객의 구매가 1회뿐이라 interval_이 NULL일 경우 0으로 처리.
--     CASE WHEN ROUND(AVG(interval_), 2) IS NULL THEN 0 ELSE ROUND(AVG(interval_), 2) END AS average_interval
--   FROM (
--     -- (1) 구매와 구매 사이에 소요된 일수 (interval_) 계산
--     SELECT
--       CustomerID,
--       -- 현재 InvoiceDate에서 바로 직전 InvoiceDate를 빼서 일수 차이(DAY)를 계산
--       DATE_DIFF(InvoiceDate, LAG(InvoiceDate) OVER (PARTITION BY CustomerID ORDER BY InvoiceDate), DAY) AS interval_
--     FROM
--       `automatic-rock-473602-a0.modulabs_project.data`
--     WHERE CustomerID IS NOT NULL
--   )
--   GROUP BY CustomerID
-- )

-- -- 기존 user_data에 계산된 평균 소요 일수 통합
-- SELECT
--   u.*,
--   pi.* EXCEPT (CustomerID)
-- FROM `automatic-rock-473602-a0.modulabs_project.user_data` AS u
-- LEFT JOIN purchase_intervals AS pi
-- ON u.CustomerID = pi.CustomerID;

-- -- *️⃣ 취소 빈도와 취소 비율을 계산하고, 결과를 user_data에 통합 - 취소 비율은 소수점 둘 째 자리
-- CREATE OR REPLACE TABLE `automatic-rock-473602-a0.modulabs_project.user_data` AS

-- WITH TransactionInfo AS (
--   SELECT
--     CustomerID,
--     COUNT(DISTINCT InvoiceNo) AS total_transactions, -- (1) 총 거래 건수
--     COUNT(DISTINCT CASE WHEN InvoiceNo LIKE 'C%' THEN InvoiceNo ELSE NULL END) AS cancel_frequency -- (2) 취소 거래 건수
--   FROM `automatic-rock-473602-a0.modulabs_project.data`
--   GROUP BY CustomerID -- (3) 고객별로 그룹화
-- )

-- SELECT
--     u.*,
--     t.* EXCEPT(CustomerID),
--     -- (4) 취소 비율 계산: 취소 빈도 / 총 거래 건수 (소수점 둘째 자리까지 반올림)
--     ROUND(t.cancel_frequency * 1.0 / t.total_transactions, 2) AS cancel_rate
-- FROM `automatic-rock-473602-a0.modulabs_project.user_data` AS u
-- LEFT JOIN TransactionInfo AS t
-- ON u.CustomerID = t.CustomerID; -- (5) CustomerID로 조인

-- -- *️⃣ 최종적으로 user_data를 출력
-- SELECT
--     *
-- FROM
--     `automatic-rock-473602-a0.modulabs_project.user_data`;

