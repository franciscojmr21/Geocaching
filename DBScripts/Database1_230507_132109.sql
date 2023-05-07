-- Founded_Value [ent5]
create table "public"."founded_value" (
   "oid"  int4  not null,
   "value"  varchar(255),
  primary key ("oid")
);


-- Founded_Geocach_Founded_Value [rel1]
alter table "public"."founded_geocach"  add column  "founded_value_oid"  int4;
alter table "public"."founded_geocach"   add constraint fk_founded_geocach_founded_val foreign key ("founded_value_oid") references "public"."founded_value" ("oid");


