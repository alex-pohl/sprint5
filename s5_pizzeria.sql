create table comandes(
	id_comanda int,
    data_hora varchar(50),
    domicili boolean,
	qt_pizza int,
    qt_burger int,
    qt_beguda int,
    preu decimal(3,2),
    id_client int,
    botiga_id_botiga int);
    
create table botiga(
	id_botiga int,
    adreça varchar(50),
    CP int,
    localitat varchar(50),
    provincia varchar(50)
    );
create table treballador(
	nom varchar(50),
    cognom varchar(50),
    nif varchar(50),
    telefon int,
    posicio varchar(50),
    botiga_id_botiga int);

create table repartidor(
	treballador_botiga_id_botiga int,
    comandes_data_hora varchar(50));
create table clients(
	id_client int,
    nom varchar(50),
    cognom varchar(50),
    adreça varchar(50),
    CP int,
    provincia varchar(50),
    telefon int);
    
create table productes_pizza(
	id_pizza int,
    nom varchar(50),
    descripcio varchar(50),
    imatge blob,
    preu decimal(2,2));
    
create table productes_burger(
	id_burger int,
    nom varchar(50),
    descripcio varchar(50),
    imatge blob,
    preu decimal(2,2));

create table productes_beguda(
	id_beguda int,
    nom varchar(50),
    descripcio varchar(50),
    imatge blob,
    preu decimal(2,2));
    
create table cat_pizza(
	id_cat int,
    nom varchar(50),
    productes_pizza_id_pizza int);

	