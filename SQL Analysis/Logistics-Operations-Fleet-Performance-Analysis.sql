USE logistics_db;

/* ===================================================
   LOGISTICS OPERATIONS SQL ANALYSIS
   Author: Dorcas Akou
=================================================== */

-----------------------------------------------------
-- TOP CUSTOMERS BY REVENUE
-----------------------------------------------------

SELECT TOP 10
    c.customer_name,
    SUM(l.revenue) AS total_revenue
FROM loads l
JOIN [customers (3)] c
    ON l.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

-----------------------------------------------------
-- TOP DESTINATION CITIES BY REVENUE
-----------------------------------------------------

SELECT TOP 10
    r.destination_city,
    SUM(l.revenue) AS total_revenue
FROM loads l
JOIN routes r
    ON l.route_id = r.route_id
GROUP BY r.destination_city
ORDER BY total_revenue DESC;

-----------------------------------------------------
-- FUEL COST ANALYSIS
-----------------------------------------------------

SELECT TOP 10
    truck_id,
    SUM(total_cost) AS total_fuel_cost
FROM fuel_purchases
GROUP BY truck_id
ORDER BY total_fuel_cost DESC;

-----------------------------------------------------
-- SAFETY INCIDENT ANALYSIS
-----------------------------------------------------

SELECT
    incident_type,
    COUNT(*) AS total_incidents
FROM safety_incidents
GROUP BY incident_type
ORDER BY total_incidents DESC;