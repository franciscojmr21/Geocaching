-- User_User [rel8]
create table "public"."user_user" (
   "user_oid"  int4 not null,
   "user_oid_2"  int4 not null,
  primary key ("user_oid", "user_oid_2")
);
alter table "public"."user_user"   add constraint fk_user_user_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_user"   add constraint fk_user_user_user_2 foreign key ("user_oid_2") references "public"."user" ("oid");


