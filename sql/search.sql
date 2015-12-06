show tables;

select * from user;
select * from role;
select * from permission;
select * from user_role_relation;
select * from role_permission_relation;

--获取所有role对应的permission
select role_name,permission_name from role as r join role_permission_relation as rpr join permission as p 
on r.id=rpr.role_id and rpr.permission_id=p.id;

--获取所有user对应的role
select user_name,real_name,role_name from user u join user_role_relation urr join role r
on u.id=urr.user_id and urr.role_id=r.id;