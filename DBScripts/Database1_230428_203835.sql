-- Geocach [ent1]
create table "public"."geocach" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "description"  text,
   "coordenadas"  varchar(255),
   "creation_date"  timestamp,
   "last_modify"  date,
  primary key ("oid")
);


-- Founded_Geocach [ent2]
create table "public"."founded_geocach" (
   "oid"  int4  not null,
   "date"  time,
  primary key ("oid")
);


-- Dificultad [ent3]
create table "public"."dificultad" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "puntos"  int4,
  primary key ("oid")
);


-- Size [ent4]
create table "public"."size" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "puntos"  int4,
  primary key ("oid")
);


-- Provincia [ent6]
create table "public"."provincia" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
  primary key ("oid")
);


-- User [User]
alter table "public"."user"  add column  "puntos"  int4;


-- Create_Geocach [rel2]
alter table "public"."geocach"  add column  "user_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- Dificultad_Geocach [rel3]
alter table "public"."geocach"  add column  "dificultad_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_dificultad foreign key ("dificultad_oid") references "public"."dificultad" ("oid");


-- User_Founded_Geocach [rel4]
alter table "public"."founded_geocach"  add column  "user_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- Geocach_Founded_Geocach [rel5]
alter table "public"."founded_geocach"  add column  "geocach_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_geocach foreign key ("geocach_oid") references "public"."geocach" ("oid");


-- Size_Geocach [rel6]
alter table "public"."geocach"  add column  "size_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_size foreign key ("size_oid") references "public"."size" ("oid");


-- Provincia_Geocach [rel7]
alter table "public"."geocach"  add column  "provincia_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_provincia foreign key ("provincia_oid") references "public"."provincia" ("oid");


-- Founded_Geocach.puntos [ent2#att26]
create view "public"."founded_geocach_puntos_view" as
select AL1."oid" as "oid", AL3."puntos" + AL4."puntos" as "der_attr"
from  "public"."founded_geocach" AL1 
               left outer join "public"."geocach" AL2 on AL1."geocach_oid"=AL2."oid"
               left outer join "public"."dificultad" AL3 on AL2."dificultad_oid"=AL3."oid"
               left outer join "public"."size" AL4 on AL2."size_oid"=AL4."oid";


