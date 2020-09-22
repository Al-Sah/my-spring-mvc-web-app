
create table calc_history_message (
    id integer not null auto_increment,
    text varchar(255),
    primary key (id)
);

create table hibernate_sequence (next_val bigint);
insert into hibernate_sequence values ( 1 );

create table message (
    id bigint not null,
    tag varchar(255),
    text varchar(2048) not null,
    user_id bigint,
    primary key (id)
);


create table my_app_users (
    id bigint not null auto_increment,
    activate_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

create table user_role (
    user_id bigint not null,
    roles varchar(255)
);

alter table message add constraint message_user_fk foreign key (user_id) references my_app_users (id);
alter table user_role add constraint user_role_fk foreign key (user_id) references my_app_users (id);