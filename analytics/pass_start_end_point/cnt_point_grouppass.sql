WITH
tbl_1 AS(SELECT point_start
          ,point_end
          ,id_passenger
          --,max(cnt)
          ,DENSE_RANK() OVER (partition by id_passenger ORDER BY id_passenger,cnt DESC)AS rnk
FROM(
    SELECT id_passenger
            ,COUNT(*) cnt
           ,point_addr_start point_start
          ,point_addr_end  point_end     
    FROM point_way pw
    JOIN passenger_order_trip ord
    ON pw.id_order = ord.id_order
    WHERE id_passenger IN (
        SELECT id_passenger
        FROM passenger_order_trip
        GROUP BY id_passenger
        HAVING COUNT(id_order)> 10)
    GROUP BY point_addr_start,point_addr_end,id_passenger
   )
GROUP BY point_start,point_end,id_passenger,cnt
)
SELECT id_passenger
       ,rnk
       ,point_start
       ,point_end
FROM tbl_1
WHERE rnk <= 5;
