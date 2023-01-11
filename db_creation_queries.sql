create database if not exists catenaCinema;
use catenaCinema;

drop table if exists dipendente;

create table dipendente (
   id varchar(5) not null auto_increment,
   nome varchar(30) not null,
   cognome varchar(30) not null,
   ore int(2) not null,
   dataNascita date not null,
   mansione varchar(20) not null,
   struttura varchar(20) not null,
   primary key (id),
   foreign key (struttura) references cinema(nome)
);

drop table if exists cinema;

create table cinema (
   nome varchar(20) not null,
   citta varchar(20) not null,
   nSale int(2) not null,
   primary key (nome)
);

drop table if exists sala;

create table sala (
   cinema varchar(20) not null,
   numero int(2) not null,
   capienza int(3) not null,
   primary key (numero),
   foreign key (cinema) references cinema(nome)
);

drop table if exists proiezione;

create table proiezione (
   sala int(2) not null,
   data date not null,
   ora time not null,
   numSpettatori int(3) not null,
   pellicola varchar(20) not null,
   struttura varchar(20) not null,
   primary key (data,ora),
   foreign key (sala) references sala(numero),
   foreign key (struttura) references sala(cinema),
   foreign key (pellicola) references film(idFilm)
);

drop table if exists film;

create table film (
   idFilm varchar(20) not null auto_increment,
   nome varchar(100) not null,
   uscita date not null,
   durata int(3) not null,
   genere varchar(15) not null,
   casa varchar(30) not null,
   primary key (idFilm)
);

drop table if exists membroCast;

create table membroCast (
   id varchar(20) not null auto_increment,
   nome varchar(30) not null,
   cognome varchar(30) not null,
   nazione varchar(20) not null,
   dataNascita date not null,
   primary key (id)
);

drop table if exists spettatore;

create table spettatore (
   cf varchar(15) not null,
   nome varchar(30) not null,
   cognome varchar(30) not null,
   dataNascita date not null,
   sesso varchar(1) not null,
   residenza varchar(20) not null,
   entrate int(2) not null,
   primary key (cf)
);

drop table if exists ristoro;

create table fornitore (
   pIva varchar(15) not null,
   nome varchar(30) not null,
   primary key (pIva)
);


create table ristoro (
   codiceProdotto varchar(5) not null auto_increment,
   nome varchar(20) not null,
   qty int(5) not null,
   qtyPurchased int(5) not null,
   provenienza varchar(15) not null,
   primary key (codiceProdotto),
   foreign key (provenienza) references fornitore(pIva)
);

drop table if exists fornitore;

drop table if exists realizzazione;

create table realizzazione (
   cast varchar(20) not null,
   film varchar(20) not null,
   ruolo varchar(30),
   foreign key (cast) references membroCast(id),
   foreign key (film) references film(idFilm)
);

drop table if exists visione;

create table visione (
   spettatore varchar(15) not null,
   salaProiezione int(2) not null,
   dataProiezione date not null,
   oraProiezione time not null,
   foreign key (spettatore) references spettatore(cf),
   foreign key (salaProiezione, dataProiezione, oraProiezione) references proiezione(sala,data,ora)
);

drop table if exists vendita;

create table vendita (
   prodotto varchar(5) not null,
   cinema varchar(20) not null,
   foreign key (prodotto) references ristoro(codiceProdotto),
   foreign key (cinema) references cinema(nome)
);
