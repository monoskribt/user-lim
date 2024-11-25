--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Debian 15.10-1.pgdg120+1)
-- Dumped by pg_dump version 15.10 (Debian 15.10-1.pgdg120+1)

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
-- Name: authority; Type: TABLE; Schema: public; Owner: mono
--

CREATE TABLE public.authority (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer
);


ALTER TABLE public.authority OWNER TO mono;

--
-- Name: authority_id_seq; Type: SEQUENCE; Schema: public; Owner: mono
--

CREATE SEQUENCE public.authority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authority_id_seq OWNER TO mono;

--
-- Name: authority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mono
--

ALTER SEQUENCE public.authority_id_seq OWNED BY public.authority.id;


--
-- Name: custom_user; Type: TABLE; Schema: public; Owner: mono
--

CREATE TABLE public.custom_user (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.custom_user OWNER TO mono;

--
-- Name: custom_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mono
--

CREATE SEQUENCE public.custom_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_user_id_seq OWNER TO mono;

--
-- Name: custom_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mono
--

ALTER SEQUENCE public.custom_user_id_seq OWNED BY public.custom_user.id;


--
-- Name: authority id; Type: DEFAULT; Schema: public; Owner: mono
--

ALTER TABLE ONLY public.authority ALTER COLUMN id SET DEFAULT nextval('public.authority_id_seq'::regclass);


--
-- Name: custom_user id; Type: DEFAULT; Schema: public; Owner: mono
--

ALTER TABLE ONLY public.custom_user ALTER COLUMN id SET DEFAULT nextval('public.custom_user_id_seq'::regclass);


--
-- Data for Name: authority; Type: TABLE DATA; Schema: public; Owner: mono
--

COPY public.authority (id, name, user_id) FROM stdin;
10	USER	19
11	ADMIN	20
12	USER	21
13	USER	20
\.


--
-- Data for Name: custom_user; Type: TABLE DATA; Schema: public; Owner: mono
--

COPY public.custom_user (id, name, password) FROM stdin;
19	user1	$2a$10$2SQwp7Hs8yi13xE9fvhYOuthtc7B0RmAhT6XGTWYnIfUJXEHgAAt2
20	admin	$2a$10$M5TbstMSLxRD6RjmKiIMm.lVwPm/GtzNjLI3uegtwYELtaFIA5OlC
21	user3	$2a$10$fnzWeLm0SzamxHPBq/nGwu/s0kNS0xzLvNUVScvPnDqSIgiOlBAsC
\.


--
-- Name: authority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mono
--

SELECT pg_catalog.setval('public.authority_id_seq', 13, true);


--
-- Name: custom_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mono
--

SELECT pg_catalog.setval('public.custom_user_id_seq', 21, true);


--
-- Name: authority authority_pkey; Type: CONSTRAINT; Schema: public; Owner: mono
--

ALTER TABLE ONLY public.authority
    ADD CONSTRAINT authority_pkey PRIMARY KEY (id);


--
-- Name: custom_user custom_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mono
--

ALTER TABLE ONLY public.custom_user
    ADD CONSTRAINT custom_user_pkey PRIMARY KEY (id);


--
-- Name: authority authority_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mono
--

ALTER TABLE ONLY public.authority
    ADD CONSTRAINT authority_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.custom_user(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

