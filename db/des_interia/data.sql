
-- insert into categories
insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Guitarra',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Cacharreo',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Biología',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Astronomía',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Costura',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Fontanería',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Mecánica',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Cocina',
    0,
    'uploads/default.svg'
);

-- insert into users
insert into t_users
(usr_nick, usr_password, usr_email, usr_role, usr_avatar)
values(
	'test',
    '$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6',
    'mail@mail.com',
    'user',
    'uploads/avatar.png'
);

-- insert into t_tutorials