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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number (
    name character varying(22) NOT NULL,
    user_id integer NOT NULL,
    game_score integer DEFAULT 0
);


ALTER TABLE public.number OWNER TO freecodecamp;

--
-- Name: number_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_user_id_seq OWNED BY public.number.user_id;


--
-- Name: number user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number ALTER COLUMN user_id SET DEFAULT nextval('public.number_user_id_seq'::regclass);


--
-- Data for Name: number; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number VALUES ('user_1741938697205', 47, 0);
INSERT INTO public.number VALUES ('user_1741938697205', 48, 183);
INSERT INTO public.number VALUES ('user_1741938697205', 49, 418);
INSERT INTO public.number VALUES ('user_1741938697204', 50, 0);
INSERT INTO public.number VALUES ('user_1741938697204', 51, 246);
INSERT INTO public.number VALUES ('user_1741938697204', 52, 168);
INSERT INTO public.number VALUES ('user_1741938697205', 53, 883);
INSERT INTO public.number VALUES ('user_1741938697205', 54, 560);
INSERT INTO public.number VALUES ('user_1741938697205', 55, 266);
INSERT INTO public.number VALUES ('user_1741938965721', 56, 0);
INSERT INTO public.number VALUES ('user_1741938965720', 57, 0);
INSERT INTO public.number VALUES ('user_1741938982931', 58, 0);
INSERT INTO public.number VALUES ('user_1741938982930', 59, 0);
INSERT INTO public.number VALUES ('user_1741939019024', 60, 0);
INSERT INTO public.number VALUES ('user_1741939019024', 61, 15);
INSERT INTO public.number VALUES ('user_1741939019024', 62, 639);
INSERT INTO public.number VALUES ('user_1741939019023', 63, 0);
INSERT INTO public.number VALUES ('user_1741939019023', 64, 104);
INSERT INTO public.number VALUES ('user_1741939019023', 65, 474);
INSERT INTO public.number VALUES ('user_1741939019024', 66, 340);
INSERT INTO public.number VALUES ('user_1741939019024', 67, 421);
INSERT INTO public.number VALUES ('user_1741939019024', 68, 424);


--
-- Name: number_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_user_id_seq', 68, true);


--
-- Name: number number_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number
    ADD CONSTRAINT number_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

