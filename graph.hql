drop table Vertices;

create table Vertices (
	vertex1 int,
	vertex2 int)
row format delimited fields terminated by ',' stored as textfile;

load data local inpath 'large-graph.txt' overwrite into table Vertices;

select v.cnt, count(*) as num_groups from (select vertex1 as vert, count(*) as cnt from Vertices group by vertex1) v group by v.cnt;

