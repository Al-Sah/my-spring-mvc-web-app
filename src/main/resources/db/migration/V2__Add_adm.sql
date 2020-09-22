insert into my_app_users (id, username, password, active ) values (1, 'admin', 'zzz', true );
insert into user_role (user_id, roles) values (1, 'USER');
/*insert into user_role (user_id, roles) values (1, 'ADMIN');*/
insert into user_role (roles, user_id) values ('ADMIN', 1);