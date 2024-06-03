
-- insert into ct_categoriesategories
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
	'Costura',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Magia',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Desarrollo Web',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Inglés',
    0,
    'uploads/default.svg'
);

insert into t_categories
(cat_name, cat_pending, cat_img)
values(
	'Alemán',
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
    'admin',
    'uploads/avatar.png'
);

insert into t_users
(usr_nick, usr_password, usr_email, usr_role, usr_avatar)
values(
	'Cristian',
    '$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6',
    'mail@mail.com',
    'user',
    'uploads/avatar.png'
);

  -- random data

INSERT INTO `t_users` (`usr_nick`,`usr_password`,`usr_email`,`usr_role`,`usr_avatar`)
VALUES
  ("Chaneys","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","chaney4512@google.com","user","uploads/avatar.png"),
  ("Germaine","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","germaine@google.com","user","uploads/avatar.png"),
  ("Lamar","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","lamar2508@google.net","user","uploads/avatar.png"),
  ("Samuel","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","samuel805@google.edu","user","uploads/avatar.png"),
  ("Zahir","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","zahir@google.edu","user","uploads/avatar.png"),
  ("Nina","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","nina@google.net","user","uploads/avatar.png"),
  ("George","$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6","george5493@google.net","user","uploads/avatar.png");
-- insert into t_tutorials
