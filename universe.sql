--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type text,
    constellation text
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
    name character varying(40) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text,
    mean_radius_in_km numeric(5,1)
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_earth_in_au numeric(3,1),
    has_life boolean NOT NULL,
    star_id integer,
    number_of_moons integer,
    description text,
    has_rings boolean NOT NULL
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
-- Name: spectral_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spectral_type (
    spectral_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    emitted_color text
);


ALTER TABLE public.spectral_type OWNER TO freecodecamp;

--
-- Name: spectral_type_spectral_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spectral_type_spectral_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectral_type_spectral_type_id_seq OWNER TO freecodecamp;

--
-- Name: spectral_type_spectral_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spectral_type_spectral_type_id_seq OWNED BY public.spectral_type.spectral_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    spectral_type_id integer
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
-- Name: spectral_type spectral_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_type ALTER COLUMN spectral_type_id SET DEFAULT nextval('public.spectral_type_spectral_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 3, 13600, 'Barred Spyral', 'Sagittarius');
INSERT INTO public.galaxy VALUES ('Andromeda', 4, 10000, 'Barred Spyral', 'Andromeda');
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 13000, 'Peculiar', 'Virgo');
INSERT INTO public.galaxy VALUES ('Cigar', 6, 13300, 'Irregular', 'Ursa Major');
INSERT INTO public.galaxy VALUES ('Coma Pinwheel', 7, NULL, 'Spiral', 'Coma Berenices');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 8, 1101, 'Magellanic Spiral', 'Dorado/Mensa');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, 'Earth''s only natural satellite', 1737.4);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 'Largest moon of Mars', 11.2);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 'Named after the Greek god of dread and terror', 6.2);
INSERT INTO public.moon VALUES ('Io', 4, 5, 'Has the highest density of any moon in the Solar System', 1821.6);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 'Has the smoothest surface of any known solid object in the Solar System', 1560.8);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 'The largest moon of the Solar System', 2634.1);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 'It''s surface is the oldest and most heavily cratered object in the Solar System', 2410.3);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 'The only moon known to have a dense atmosphere', 2574.7);
INSERT INTO public.moon VALUES ('Rhea', 9, 6, 'The second largest moon of Saturn', 763.5);
INSERT INTO public.moon VALUES ('Mimas', 10, 6, 'The smallest body to be rounded in shape', 198.2);
INSERT INTO public.moon VALUES ('Enceladus', 11, 6, 'One of the most reflective bodies of the Solar System', 252.1);
INSERT INTO public.moon VALUES ('Iapetus', 12, 6, 'Has a different colorations between it''t two hemispheres', 734.5);
INSERT INTO public.moon VALUES ('Titania', 13, 8, 'The largest moon of Uranus', 788.4);
INSERT INTO public.moon VALUES ('Oberon', 14, 8, 'Has a dark and slightly red surface', 761.4);
INSERT INTO public.moon VALUES ('Umbriel', 15, 8, 'Has the darkest surface of Uranus'' moons', 584.7);
INSERT INTO public.moon VALUES ('Miranda', 16, 8, 'Is one of the smallest closely observed objects in the Solar System', 235.8);
INSERT INTO public.moon VALUES ('Triton', 17, 9, 'It is the only large moon in the Solar System with a retrograde orbit', 1353.4);
INSERT INTO public.moon VALUES ('Phoebe', 18, 6, 'The most massive irregular satellite of Saturn', 106.5);
INSERT INTO public.moon VALUES ('Nereid', 19, 9, 'It has the most eccentric orbit of all known moons in the Solar System', 170.0);
INSERT INTO public.moon VALUES ('Charon', 20, 10, 'It has half the diameter and one eighth of the mass of Pluto', 606.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 0.6, false, 1, 0, 'The smallest planet in the Solar System', false);
INSERT INTO public.planet VALUES ('Venus', 2, 0.3, false, 1, 0, 'Venus is the brightest natural object in Earth''s sky', false);
INSERT INTO public.planet VALUES ('Earth', 3, 0.0, true, 1, 1, 'the only place known in the Solar System where life has originated and found habitability', false);
INSERT INTO public.planet VALUES ('Mars', 4, 1.6, false, 1, 2, 'Known as the Red Planet', false);
INSERT INTO public.planet VALUES ('Jupiter', 5, 4.2, false, 1, 80, 'The largest planet in the Solar System', true);
INSERT INTO public.planet VALUES ('Saturn', 6, 8.5, false, 1, 83, 'Named after the Roman god of wealth and agriculture', true);
INSERT INTO public.planet VALUES ('Uranus', 8, 18.2, false, 1, 27, 'Defined with Neptune as Ice Giants', true);
INSERT INTO public.planet VALUES ('Neptune', 9, 29.8, false, 1, 14, 'The farthest planet of the Solar System', true);
INSERT INTO public.planet VALUES ('Pluto', 10, 38.5, false, 1, 5, 'A dwarf planet in the Kuiper Belt', false);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 11, NULL, false, 3, 0, 'The closest exoplanet to the Solar System', false);
INSERT INTO public.planet VALUES ('Kepler-186f', 12, NULL, false, 7, 0, 'The first Earth-sized planet in a habitable zone', false);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 13, NULL, false, 8, 0, 'Small exoplanet 40 light-years away from Earth', false);


--
-- Data for Name: spectral_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spectral_type VALUES (1, 'O-Type', 'Violet-Blue');
INSERT INTO public.spectral_type VALUES (2, 'B-Type', 'Blue');
INSERT INTO public.spectral_type VALUES (3, 'A-Type', 'Light Blue-White');
INSERT INTO public.spectral_type VALUES (4, 'F-Type', 'Turquoise-White');
INSERT INTO public.spectral_type VALUES (5, 'G-Type', 'White');
INSERT INTO public.spectral_type VALUES (6, 'K-Type', 'White-Yellow');
INSERT INTO public.spectral_type VALUES (7, 'M-Type', 'Yellow-Red');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 3, 'The Sun is the star at the center of the Solar System', 4500, 5);
INSERT INTO public.star VALUES ('Sirius', 2, 3, 'Sirius is the brightest star from Earth after the Sun', 247, 3);
INSERT INTO public.star VALUES ('Proxima Centauri', 3, 3, 'It''s the closest star from our Solar System', 4850, 7);
INSERT INTO public.star VALUES ('Canupus', 4, 3, 'Is the second brightest star in the night sky', 10000, 3);
INSERT INTO public.star VALUES ('Betelgeuse', 5, 3, 'The second brightest in the constellation of Orion', 9, 7);
INSERT INTO public.star VALUES ('Rigel', 6, 3, 'The brightest star in Orion', 9, 2);
INSERT INTO public.star VALUES ('Kepler-186', 7, 3, 'Dwarf Star located in the constellation of Cygnus', 4600, 7);
INSERT INTO public.star VALUES ('TRAPPIST-1', 8, 3, 'Red dwarf star in the constellation of Aquarius', 7600, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: spectral_type_spectral_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spectral_type_spectral_type_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spectral_type spectral_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_type
    ADD CONSTRAINT spectral_type_name_key UNIQUE (name);


--
-- Name: spectral_type spectral_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_type
    ADD CONSTRAINT spectral_type_pkey PRIMARY KEY (spectral_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_spectral_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_spectral_type_id_fkey FOREIGN KEY (spectral_type_id) REFERENCES public.spectral_type(spectral_type_id);


--
-- PostgreSQL database dump complete
--

