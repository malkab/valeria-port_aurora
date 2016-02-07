\c valeria postgres

begin;


\copy test_data.line to csv/test_data_line.csv with delimiter '|' csv header quote '"' encoding 'utf-8' null '-'

\copy test_data.polygon to csv/test_data_polygon.csv with delimiter '|' csv header quote '"' encoding 'utf-8' null '-'


commit;

vacuum analyze;
