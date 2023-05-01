-- User.amigos [User#att5]
create view "public"."user_amigos_view" as
select AL1."oid" as "oid", count(distinct AL2."user_oid_2") as "der_attr"
from  "public"."user" AL1 
               left outer join "public"."user_user" AL2 on AL1."oid"=AL2."user_oid"
group by AL1."oid";


