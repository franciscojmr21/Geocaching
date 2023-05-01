-- Geocach [ent1]
create table "public"."geocach" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "description"  text,
   "coordenadas"  varchar(255),
   "creation_date"  timestamp,
   "last_modify"  date,
   "dificulty"  varchar(255),
   "size"  varchar(255),
  primary key ("oid")
);


-- Founded_Geocach [ent2]
create table "public"."founded_geocach" (
   "oid"  int4  not null,
   "date"  time,
  primary key ("oid")
);


-- Create_Geocach [rel2]
alter table "public"."geocach"  add column  "user_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- User_Founded_Geocach [rel4]
alter table "public"."founded_geocach"  add column  "user_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- Geocach_Founded_Geocach [rel5]
alter table "public"."founded_geocach"  add column  "geocach_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_geocach foreign key ("geocach_oid") references "public"."geocach" ("oid");


