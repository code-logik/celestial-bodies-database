--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-12 17:44:28

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
-- TOC entry 224 (class 1259 OID 16539)
-- Name: constellation; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.constellation OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16538)
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.constellation_constellation_id_seq OWNER TO postgres;

--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 223
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- TOC entry 216 (class 1259 OID 16415)
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16414)
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- TOC entry 222 (class 1259 OID 16523)
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.moon OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16522)
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- TOC entry 220 (class 1259 OID 16496)
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.planet OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16495)
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- TOC entry 218 (class 1259 OID 16426)
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.star OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16425)
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- TOC entry 4658 (class 2604 OID 16542)
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 16418)
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16526)
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 16499)
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 16429)
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- TOC entry 4834 (class 0 OID 16539)
-- Dependencies: 224
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constellation (constellation_id, name, number_of_stars, number_of_unformed_stars, average_distance_from_earth_in_light_years, greek_name, circumpolar, seasonal) FROM stdin;
1	Aquarius	42	3	500	Ὑδροχόος	f	t
2	Cancer	9	4	236	Καρκίνος	f	t
3	Leo	27	8	1535	Λέων	f	t
4	Libra	8	9	1535	Χηλαί	f	t
\.


--
-- TOC entry 4826 (class 0 OID 16415)
-- Dependencies: 216
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (galaxy_id, name, age_in_millions_of_years, number_of_stars_in_millions, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, constellation) FROM stdin;
1	Aquarius Dwarf	10000	\N	3200000	dwarf	t	t	1
2	Milky Way	13600	100000	0	barred spiral	t	t	2, 3, 4
3	Andromeda	7500	1000000	2500000	barred spiral	t	t	\N
4	Triangulum	1600	40000	2730000	spiral	t	t	\N
5	Pisces Dwarf	8000	100	18400000	irregular dwarf	t	t	\N
6	Messier 81	12000	250000	11800000	grand design spiral	f	t	\N
\.


--
-- TOC entry 4832 (class 0 OID 16523)
-- Dependencies: 222
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (moon_id, name, age_in_millions_of_years, number_of_days_to_orbit_planet, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, planet_id) FROM stdin;
1	Moon	4460	27	0.00000004063	natural satellite	t	t	3
2	Deimos	4500	1	0.0000238	natural satellite	f	t	4
3	Phobos	4500	0	0.0000238	natural satellite	f	t	4
4	Callisto	4500	17	0.0000664	natural satellite	t	t	5
5	Europa	4500	6	0.0000824	natural satellite	f	t	5
6	Ganymede	4500	7	0.0000664	natural satellite	f	t	5
7	Io	4500	2	0.0000422	natural satellite	f	t	5
8	Atlas	4500	1	0.0001268	natural satellite	f	f	7
9	Calypso	4500	2	0.0001505	natural satellite	f	f	7
10	Janus	4500	1	0.000158	natural satellite	f	f	7
11	Prometheus	4500	1	0.0001505	natural satellite	f	f	7
12	Ariel	4500	3	0.000271	natural satellite	f	f	8
13	Oberon	4500	14	0.000303	natural satellite	f	t	8
14	Galatea	4500	0	0.000475	natural satellite	f	f	9
15	Proteus	4500	1	0.000454	natural satellite	f	f	9
17	Hydra	4500	38	0.00079	natural satellite	f	f	11
18	Styx	4500	20	0.0005008	natural satellite	f	f	11
19	Dysnomia	4500	16	0.001524	natural satellite	f	f	14
20	Namaka	\N	18	0.000682	natural satellite	f	f	12
21	Hiiaka	\N	49	0.000676	natural satellite	f	f	12
\.


--
-- TOC entry 4830 (class 0 OID 16496)
-- Dependencies: 220
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (planet_id, name, age_in_millions_of_years, number_of_moons_orbiting, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, star_id) FROM stdin;
1	Mercury	4500	0	0.0000060841129	terrestrial	t	t	6
2	Venus	4500	0	0.0000097	terrestrial	t	t	6
3	Earth	4540	1	0	terrestrial	\N	\N	6
4	Mars	4500	2	0.000042	terrestrial	t	t	6
5	Jupiter	4570	95	0.00008233217279125351	gas giant	t	t	6
7	Saturn	4540	146	0.0001505453985955772	gas giant	t	t	6
8	Uranus	4540	27	0.0003027918751413869	gas giant	f	t	6
9	Neptune	4540	14	0.00047460074811487044	gas giant	f	t	6
10	Ceres	4500	0	0.0000437	Dwarf	f	t	6
11	Pluto	4600	5	0.0000005	Dwarf	f	t	6
12	Haumea	4500	2	0.000771	Dwarf	f	t	6
13	Makemake	4500	1	0.000841	Dwarf	f	f	6
14	Eris	4500	1	0.00000153	Dwarf	f	f	6
\.


--
-- TOC entry 4828 (class 0 OID 16426)
-- Dependencies: 218
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (star_id, name, age_in_millions_of_years, number_of_planets_orbiting, distance_from_earth_in_light_years, type, visible_to_naked_eye, visible_with_hobby_telescope, galaxy_id) FROM stdin;
1	Alpha Aquarii	53	\N	760	single yellow supergiant	t	t	1
2	Acubens	600	0	170	white a-type main-sequence dwarf	t	t	2
3	Alpha Leonis	1000	0	79	quadruple blue-white main-sequence	t	t	2
4	Alpha Librae	1100	0	76	double	t	t	2
5	Beta Aquarii	56	0	610	yellow supergiant	t	t	2
6	The Sun	4500	13	0.0000158	yellow dwarf	t	t	2
\.


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 223
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- TOC entry 4676 (class 2606 OID 16548)
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- TOC entry 4678 (class 2606 OID 16546)
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- TOC entry 4660 (class 2606 OID 16424)
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- TOC entry 4662 (class 2606 OID 16422)
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- TOC entry 4672 (class 2606 OID 16532)
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- TOC entry 4674 (class 2606 OID 16530)
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- TOC entry 4668 (class 2606 OID 16505)
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- TOC entry 4670 (class 2606 OID 16503)
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- TOC entry 4664 (class 2606 OID 16435)
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- TOC entry 4666 (class 2606 OID 16433)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- TOC entry 4679 (class 2606 OID 16436)
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- TOC entry 4681 (class 2606 OID 16533)
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- TOC entry 4680 (class 2606 OID 16506)
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


-- Completed on 2024-08-12 17:44:28

--
-- PostgreSQL database dump complete
--

