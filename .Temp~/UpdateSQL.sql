-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Geocach [ent1]
create table "public"."geocach" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "description"  text,
   "latitude"  float8,
   "longitude"  float8,
   "creation_date"  date,
   "last_modify"  date,
   "dificulty"  varchar(255),
   "size"  varchar(255),
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Friends [rel1]
alter table "public"."user"  add column  "user_oid"  int4;
alter table "public"."user"   add constraint fk_user_user foreign key ("user_oid") references "public"."user" ("oid");


-- Create_Geocach [rel2]
alter table "public"."geocach"  add column  "user_oid"  int4;
alter table "public"."geocach"   add constraint fk_geocach_user foreign key ("user_oid") references "public"."user" ("oid");


-- Find_Geocach [rel3]
create table "public"."find_geocach" (
   "user_oid"  int4 not null,
   "geocach_oid"  int4 not null,
  primary key ("user_oid", "geocach_oid")
);
alter table "public"."find_geocach"   add constraint fk_find_geocach_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."find_geocach"   add constraint fk_find_geocach_geocach foreign key ("geocach_oid") references "public"."geocach" ("oid");


