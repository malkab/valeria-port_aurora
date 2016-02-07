--create view trash.points_intersect as

-- create view trash.cuts as
-- with cuts as(
--   select
--     row_number() over (order by a.id_line, b.id_line) as gid,
--     a.id_line as aid,
--     b.id_line as bid,
--     st_intersection(a.geom, b.geom) as geom
--   from
--     test_data.line a inner join
--     test_data.line b on st_intersects(a.geom, b.geom) and
--     a.id_line<b.id_line)

-- select
--   row_number() over (order by a.id_line) as gid,
--   a.id_line,
--   st_linesubstring(a.geom, 0, st_linelocatepoint(a.geom, b.geom))
-- from
--   test_data.line a inner join
--   cuts b on st_dwithin(a.geom, b.geom, 0.001)
-- order by
--   id_line, aid, bid;

create or replace view trash.ee2 as
select
  row_number() over (order by a.id_line,b.id_line) as gid,
  a.id_line as aid,
  b.id_line as bid,
  (st_dump(st_split(a.geom, b.geom))).geom as geom
from
  test_data.line a inner join
  test_data.line b on
  st_intersects(a.geom, b.geom) and
  a.id_line<>b.id_line
order by
  aid, bid;
