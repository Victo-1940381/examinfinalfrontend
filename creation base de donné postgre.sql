drop table if exists public.utilisateur  cascade ;
create table public.utilisateur (
id serial primary key,
nom varchar(30),
prenom varchar(30),
courriel varchar(255),
cle_api varchar(30),
password varchar(100)
);


drop  table if exists public.taches cascade;
create table public.taches (
id serial primary key,
utilisateur_id integer,
titre varchar(100),
description varchar(500),
date_debut Date,
date_echeance Date,
complete Bool,

constraint fk_utilisateur foreign key (utilisateur_id)
references public.utilisateur(id) on delete cascade
);

drop  table if exists public.sous_taches cascade ;
create table public.sous_taches (
id serial primary key,
tache_id integer,
titre varchar(100),
complete Bool,
constraint fk_tache foreign key (tache_id) 
references public.taches(id) on delete cascade
);

insert into public.utilisateur(nom, prenom, courriel, cle_api, password) values('provost','ludovic','1940381@gmail.com','12345ludo', '$2b$10$zl1IwlD599WH90H/v26kou6Zbx2FtjHlHVpVnYyqNtaIwmYpQRVj.');
insert into public.taches (utilisateur_id,titre,description,date_debut,date_echeance,complete) values('1','finir docs api','je dois fini les doc de api',null,null,false );
insert into public.sous_taches (tache_id,titre,complete) values('1','finir  la section path', false );
select * from public.taches;
