CREATE TABLE IF NOT EXISTS nodes (
    point1 CHAR(1),
    point2 CHAR(1),
    cost SMALLINT
);


INSERT INTO nodes
VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);


WITH RECURSIVE t AS (
    SELECT
        CONCAT('{', n.point1, ', ', n.point2) as path,
        n.point2 to_point,
        n.cost,
        2 as number_visited,
        ARRAY[n.point1, n.point2]::text[] AS visited_points
    FROM nodes n
    WHERE n.point1 = 'a'
    
    UNION ALL

    SELECT 
        CONCAT(t.path, ', ', n.point2),
		n.point2 to_point,
        t.cost + n.cost,
        t.number_visited + 1,
        (t.visited_points || ARRAY[n.point2])::text[] AS visited_points
    FROM nodes n
    JOIN t
        ON t.to_point = n.point1
    WHERE t.number_visited < 4
        AND NOT (n.point2 = ANY(t.visited_points))

        
), all_paths AS(
    SELECT t.cost + n.cost as total_cost,
            CONCAT(t.path, ', a}') AS tour	   
    FROM t
    JOIN nodes n
        ON n.point1 = t.to_point
        AND n.point2 = 'a'
    WHERE number_visited = 4
    ORDER BY total_cost, tour
)

SELECT * FROM all_paths;
