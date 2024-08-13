create database universe;

create table constellation 
(
	constellation_id serial primary key,
    "name" varchar(100) not null,
    number_of_stars int,
    number_of_unformed_stars int,
    average_distance_from_earth_in_light_years numeric,
    greek_name text not null,
    circumpolar boolean,
    seasonal boolean
);

create table galaxy 
(
    galaxy_id serial primary key,
    name varchar(100) not null,
    age_in_millions_of_years int,
    number_of_stars_in_millions int,
    distance_from_earth_in_light_years numeric,
    type text not null,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    constellation varchar(20)
);

create table star 
(
    star_id serial primary key,
    name varchar(100) not null,
    age_in_millions_of_years int,
    number_of_planets_orbiting int,
    distance_from_earth_in_light_years numeric,
    type text not null,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    galaxy_id int,
	constraint galaxy_id_fkey
		foreign key(galaxy_id) 
		references galaxy(galaxy_id) 
);

create table planet 
(
    planet_id serial primary key,
    name varchar(100) not null,
    age_in_millions_of_years int,
    number_of_moons_orbiting int,
    distance_from_earth_in_light_years numeric,
    type text not null,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    star_id int,
	constraint star_id_fkey
		foreign key(star_id)
		references star(star_id)
);

create table moon 
(
    moon_id serial primary key,
    name varchar(100) not null,
    age_in_millions_of_years int,
    number_of_days_to_orbit_planet int,
    distance_from_earth_in_light_years numeric,
    type text not null,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    planet_id int,
	constraint planet_id_fkey
		foreign key(planet_id)
		references planet(planet_id)
);

insert into constellation 
(name, number_of_stars, number_of_unformed_stars, average_distance_from_earth_in_light_years, greek_name, circumpolar, seasonal)
values
('Aquarius', 42, 3, 500, 'Ὑδροχόος', false, true),
('Cancer', 9, 4, 236, 'Καρκίνος', false, true),
('Leo', 27, 8, 1535, 'Λέων', false, true),
('Libra', 8, 9, 1535, 'Χηλαί', false, true);

insert into galaxy 
(name, age_in_millions_of_years, number_of_stars_in_millions, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, constellation)
values 
('Aquarius Dwarf', 10000, null, 3200000, 'dwarf', true, true, '1'),
('Milky Way', 13600, 100000, 0, 'barred spiral', true, true, '2, 3, 4'),
('Andromeda', 7500, 1000000, 2500000, 'barred spiral', true, true, null),
('Triangulum', 1600, 40000, 2730000, 'spiral', true, true, null),
('Pisces Dwarf', 8000, 100, 18400000, 'irregular dwarf', true, true, null),
('Messier 81', 12000, 250000, 11800000, 'grand design spiral', false, true, null);

insert into star 
(name, age_in_millions_of_years, number_of_planets_orbiting, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, galaxy_id)
values
('Alpha Aquarii', 53, null, 760, 'single yellow supergiant', true, true, 1),
('Acubens', 600, 0, 170, 'white a-type main-sequence dwarf', true, true, 2),
('Alpha Leonis', 1000, 0, 79, 'quadruple blue-white main-sequence', true, true, 2),
('Alpha Librae', 1100, 0, 76, 'double', true, true, 2),
('Beta Aquarii', 56, 0, 610, 'yellow supergiant', true, true, 2),
('The Sun', 4500, 13, 0.0000158, 'yellow dwarf', true, true, 2);

insert into planet 
(name, age_in_millions_of_years, number_of_moons_orbiting, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, star_id)
values
('Mercury', 4500, 0, 0.0000060841129, 'terrestrial', true, true, 6),
('Venus', 4500, 0, 0.0000097, 'terrestrial', true, true, 6),
('Earth', 4540, 1, 0, 'terrestrial', null, null, 6),
('Mars', 4500, 2, 0.000042, 'terrestrial', true, true, 6),
('Jupiter', 4570, 95, 0.00008233217279125351, 'gas giant', true, true, 6),
('Saturn', 4540, 146, 0.0001505453985955772, 'gas giant', true, true, 6),
('Uranus', 4540, 27, 0.0003027918751413869, 'gas giant', false, true, 6),
('Neptune', 4540, 14, 0.00047460074811487044, 'gas giant', false, true, 6),
('Ceres', 4500, 0, 0.0000437, 'Dwarf', false, true, 6),
('Pluto', 4600, 5, 0.0000005, 'Dwarf', false, true, 6),
('Haumea', 4500, 2, 0.000771, 'Dwarf', false, true, 6),
('Makemake', 4500, 1, 0.000841, 'Dwarf', false, false, 6),
('Eris', 4500, 1, 0.00000153, 'Dwarf', false, false, 6);

insert into moon 
(name, age_in_millions_of_years, number_of_days_to_orbit_planet, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, planet_id)
values
('Moon', 4460, 27, 0.00000004063, 'natural satellite', true, true, 3),
('Deimos', 4500, 1, 0.0000238, 'natural satellite', false, true, 4),
('Phobos', 4500, 0, 0.0000238, 'natural satellite', false, true, 4),
('Callisto', 4500, 17, 0.0000664, 'natural satellite', true, true, 5),
('Europa', 4500, 6, 0.0000824, 'natural satellite', false, true, 5),
('Ganymede', 4500, 7, 0.0000664, 'natural satellite', false, true, 5),
('Io', 4500, 2, 0.0000422, 'natural satellite', false, true, 5),
('Atlas', 4500, 1, 0.0001268, 'natural satellite', false, false, 6),
('Calypso', 4500, 2, 0.0001505, 'natural satellite', false, false, 6),
('Janus', 4500, 1, 0.000158, 'natural satellite', false, false, 6),
('Prometheus', 4500, 1, 0.0001505, 'natural satellite', false, false, 6),
('Ariel', 4500, 3, 0.000271, 'natural satellite', false, false, 7),
('Oberon', 4500, 14, 0.000303, 'natural satellite', false, true, 7),
('Galatea', 4500, 0, 0.000475, 'natural satellite', false, false, 8),
('Proteus', 4500, 1, 0.000454, 'natural satellite', false, false, 8),
('Hydra', 4500, 38, 0.00079, 'natural satellite', false, false, 10),
('Styx', 4500, 20, 0.0005008, 'natural satellite', false, false, 10),
('Dysnomia', 4500, 16, 0.001524, 'natural satellite', false, false, 13),
('Namaka', null, 18, 0.000682, 'natural satellite', false, false, 11),
('Hiiaka', null, 49, 0.000676, 'natural satellite', false, false, 11);

alter table constellation add constraint constellation_unique unique(name);
alter table galaxy add constraint galaxy_unique unique(name);
alter table star add constraint star_unique unique(name);
alter table planet add constraint planet_unique unique(name);
alter table moon add constraint moon_unique unique(name);
