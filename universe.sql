--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer,
    number_of_unformed_stars integer,
    average_distance_from_earth_in_light_years numeric,
    greek_name text NOT NULL,
    circumpolar boolean,
    seasonal boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars_in_millions integer,
    distance_from_earth_in_light_years numeric,
    type text NOT NULL,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    constellation character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_days_to_orbit_planet integer,
    distance_from_earth_in_light_years numeric,
    type text NOT NULL,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_moons_orbiting integer,
    distance_from_earth_in_light_years numeric,
    type text NOT NULL,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_planets_orbiting integer,
    distance_from_earth_in_light_years numeric,
    type text NOT NULL,
    visible_to_naked_eye boolean,
    visible_with_hobby_telescope boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', 42, 3, 500, 'Ὑδροχόος', false, true);
INSERT INTO public.constellation VALUES (2, 'Cancer', 9, 4, 236, 'Καρκίνος', false, true);
INSERT INTO public.constellation VALUES (3, 'Leo', 27, 8, 1535, 'Λέων', false, true);
INSERT INTO public.constellation VALUES (4, 'Libra', 8, 9, 1535, 'Χηλαί', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Aquarius Dwarf', 10000, NULL, 3200000, 'dwarf', true, true, '1');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13600, 100000, 0, 'barred spiral', true, true, '2, 3, 4');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 7500, 1000000, 2500000, 'barred spiral', true, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 1600, 40000, 2730000, 'spiral', true, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pisces Dwarf', 8000, 100, 18400000, 'irregular dwarf', true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 12000, 250000, 11800000, 'grand design spiral', false, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4460, 27, 0.00000004063, 'natural satellite', true, true, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 4500, 1, 0.0000238, 'natural satellite', false, true, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 4500, 0, 0.0000238, 'natural satellite', false, true, 4);
INSERT INTO public.moon VALUES (4, 'Callisto', 4500, 17, 0.0000664, 'natural satellite', true, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 6, 0.0000824, 'natural satellite', false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 7, 0.0000664, 'natural satellite', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Io', 4500, 2, 0.0000422, 'natural satellite', false, true, 5);
INSERT INTO public.moon VALUES (8, 'Atlas', 4500, 1, 0.0001268, 'natural satellite', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Calypso', 4500, 2, 0.0001505, 'natural satellite', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Janus', 4500, 1, 0.000158, 'natural satellite', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 4500, 1, 0.0001505, 'natural satellite', false, false, 6);
INSERT INTO public.moon VALUES (12, 'Ariel', 4500, 3, 0.000271, 'natural satellite', false, false, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 4500, 14, 0.000303, 'natural satellite', false, true, 7);
INSERT INTO public.moon VALUES (14, 'Galatea', 4500, 0, 0.000475, 'natural satellite', false, false, 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 4500, 1, 0.000454, 'natural satellite', false, false, 8);
INSERT INTO public.moon VALUES (16, 'Hydra', 4500, 38, 0.00079, 'natural satellite', false, false, 10);
INSERT INTO public.moon VALUES (17, 'Styx', 4500, 20, 0.0005008, 'natural satellite', false, false, 10);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 4500, 16, 0.001524, 'natural satellite', false, false, 13);
INSERT INTO public.moon VALUES (19, 'Namaka', NULL, 18, 0.000682, 'natural satellite', false, false, 11);
INSERT INTO public.moon VALUES (20, 'Hiiaka', NULL, 49, 0.000676, 'natural satellite', false, false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 0, 0.0000060841129, 'terrestrial', true, true, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 0, 0.0000097, 'terrestrial', true, true, 6);
INSERT INTO public.planet VALUES (3, 'Earth', 4540, 1, 0, 'terrestrial', NULL, NULL, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 2, 0.000042, 'terrestrial', true, true, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4570, 95, 0.00008233217279125351, 'gas giant', true, true, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 4540, 146, 0.0001505453985955772, 'gas giant', true, true, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 4540, 27, 0.0003027918751413869, 'gas giant', false, true, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 4540, 14, 0.00047460074811487044, 'gas giant', false, true, 6);
INSERT INTO public.planet VALUES (9, 'Ceres', 4500, 0, 0.0000437, 'Dwarf', false, true, 6);
INSERT INTO public.planet VALUES (10, 'Pluto', 4600, 5, 0.0000005, 'Dwarf', false, true, 6);
INSERT INTO public.planet VALUES (11, 'Haumea', 4500, 2, 0.000771, 'Dwarf', false, true, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', 4500, 1, 0.000841, 'Dwarf', false, false, 6);
INSERT INTO public.planet VALUES (13, 'Eris', 4500, 1, 0.00000153, 'Dwarf', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Aquarii', 53, NULL, 760, 'single yellow supergiant', true, true, 1);
INSERT INTO public.star VALUES (2, 'Acubens', 600, 0, 170, 'white a-type main-sequence dwarf', true, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Leonis', 1000, 0, 79, 'quadruple blue-white main-sequence', true, true, 2);
INSERT INTO public.star VALUES (4, 'Alpha Librae', 1100, 0, 76, 'double', true, true, 2);
INSERT INTO public.star VALUES (5, 'Beta Aquarii', 56, 0, 610, 'yellow supergiant', true, true, 2);
INSERT INTO public.star VALUES (6, 'The Sun', 4500, 13, 0.0000158, 'yellow dwarf', true, true, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation constellation_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: star galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

