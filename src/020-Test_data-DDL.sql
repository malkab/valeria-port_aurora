\c valeria postgres

begin;


create schema test_data;

create table test_data.line(
  id_line integer,
  class integer,
  geom geometry(LINESTRING, 25830)
);

alter table test_data.line
add constraint line_pkey
primary key(id_line);

create index line_geom_gist
on test_data.line
using gist(geom);


create table test_data.polygon(
  id_polygon integer,
  class integer,
  geom geometry(POLYGON, 25830)
);

alter table test_data.polygon
add constraint polygon_pkey
primary key(id_polygon);

create index polygon_geom_gist
on test_data.polygon
using gist(geom);


commit;

