-- shiro sql begin
insert into user(user_name,password,real_name,phone_number,department) values('root','123456','王源','13829397846','管理员');
insert into user(user_name,password,real_name,phone_number,department) values('a11111','123456','张磊','15929313878','设备科');
insert into user(user_name,password,real_name,phone_number,department) values('b11111','123456','李全','18638809098','医院');
insert into user(user_name,password,real_name,phone_number,department) values('c11111','123456','崔毅','18292893223','内科');
insert into user(user_name,password,real_name,phone_number,department) values('d11111','123456','周国平','13571922366','内科');

insert into role(role_name) values('administrator');
insert into role(role_name) values('equ_dep_person');
insert into role(role_name) values('president');
insert into role(role_name) values('director');
insert into role(role_name) values('operator');

insert into permission(permission_name) values('export_equ_data'),
('export_user_data'),
('equ_add'),
('equ_read'),
('equ_modify'),
('equ_delete'),
('user_add'),
('user_read'),
('user_modify'),
('user_delete'),
('system_settings'),
('equ_search'),
('user_search');

insert into user_role_relation(user_id,role_id) values(1,1);
insert into user_role_relation(user_id,role_id) values(2,2);

insert into role_permission_relation(role_id,permission_id) values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,12),
(3,1),(3,2),(3,4),(3,8),(1,12),(1,13),
(4,1),(4,2),(4,4),(4,8),(4,12),(4,13),
(5,1),(5,2),(5,4);

--shiro sql end

INSERT INTO equipment(serial,cn_name,en_name,description,
note,made_by,quantity,category,manufacturer,price,mng_level,
operator_id,director_id,motion_state,running_state,
repair_time,repair_frqc,maintain_time,maintain_frqc,
is_deleted) VALUES 
('E23928375','X射线深部治疗机','en_name','X射线深部治疗机','X射线深部治疗机','中国',12,
'医用X射线设备','美国医疗科技有限公司',100.12,3,5,4,'入库','正常',1409116161683,0,1437545477288,0,0),
('E23928452','及高压发生装置','x ray','及高压发生装置','及高压发生装置','美国',5,
'医用X射线设备','美国医疗科技有限公司',100,2,4,3,'出库','正常',430800000000,0,419800000000,0,0),
('E24134123','介入治疗X射线机','x ray','X射线手术影像设备','X射线手术影像设备','中国',23,
'医用X射线设备','中国医疗设备有限公司',100,3,3,3,'入库','正常',430800000000,0,419800000000,0,0),
('E2312','一次性使用无菌注射器及其胶塞','injec','一次性使用无菌注射器及其胶塞','一次性使用无菌注射器及其胶塞','美国',32,
'注射穿刺器械','医疗设备有限公司',100,1,2,4,'出库','正常',1420118918234,3,1422797318235,2,0),
('E12341','植入式心脏起搏器','embeded','植入式心脏起搏器','植入式心脏起搏器','美国',32,
'急救装置','美国医疗设备有限公司',10000000.5,3,2,5,'入库','正常',1411093011155,2,579838611156,0,0),
('E3143451','体外震波碎石机','rock','体外震波碎石机','体外震波碎石机','中国',23,
'有创式电生理仪器','美国',12323,1,3,2,'出库','正常',22471414,0,22471415,0,0),
('E234128234','剖腹产切口钳','plier','剖腹产切口钳','剖腹产切口钳','中国',69,
'妇产科用钳','设备科技有限公司',100,2,3,4,'入库','正常',1146480716483,3,561466316485,16,0),
('E1384287','超声三维（立体）诊断仪','3d equipment','超声三维（立体）诊断仪','超声三维（立体）诊断仪','美国',12,
'彩色超声成像设备及超声介入/腔内诊断设备','美国科技有限公司',1000000,1,4,3,'入库','正常',27010658,0,27010659,0,0);

--change table
ALTER TABLE equipment add CONSTRAINT EQU_UNI_CON UNIQUE(serial);
ALTER TABLE equipment MODIFY COLUM serial VARCHAR(32) NOT NULL;

ALTER TABLE role add CONSTRAINT EQU_UNI_CON UNIQUE(role_name);
ALTER TABLE permission add CONSTRAINT EQU_UNI_CON UNIQUE(permission_name);
