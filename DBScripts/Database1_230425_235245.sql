-- Founded_Geocach [ent2]
create table "public"."founded_geocach" (
   "oid"  int4  not null,
   "date"  time,
  primary key ("oid")
);


-- User_Founded_Geocach [rel4]
alter table "public"."founded_geocach"  add column  "user_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- Geocach_Founded_Geocach [rel5]
alter table "public"."founded_geocach"  add column  "geocach_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_geocach foreign key ("geocach_oid") references "public"."geocach" ("oid");


