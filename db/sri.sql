--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-2.pgdg22.04+2)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-2.pgdg22.04+2)

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

--
-- Name: insert_companynamebyid_by_sri(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insert_companynamebyid_by_sri(INOUT companyid integer, IN companyname character varying)
    LANGUAGE plpgsql
    AS $$
begin
--  return companyid= 
 UPDATE public.company_details set company_name= companyname	WHERE id=companyID RETURNING id;
-- 		commit;
	end
	
$$;


ALTER PROCEDURE public.insert_companynamebyid_by_sri(INOUT companyid integer, IN companyname character varying) OWNER TO postgres;

--
-- Name: test(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.test()
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RETURN QUERY
    SELECT * 
    FROM public.company_details
commit;
END
$$;


ALTER PROCEDURE public.test() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    "order" character varying(255)
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: company_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_details (
    id integer NOT NULL,
    address character varying(255),
    company_name character varying(255),
    email_id character varying(255),
    phone bigint
);


ALTER TABLE public.company_details OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(255),
    cart_id integer NOT NULL,
    book_category_id integer
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_course (
    student_id bigint NOT NULL,
    course_id bigint NOT NULL
);


ALTER TABLE public.student_course OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: tutorial_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutorial_tags (
    tutorial_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.tutorial_tags OWNER TO postgres;

--
-- Name: tutorials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutorials (
    id bigint NOT NULL,
    description character varying(255),
    published boolean,
    title character varying(255)
);


ALTER TABLE public.tutorials OWNER TO postgres;

--
-- Name: tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tutorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tutorials_id_seq OWNER TO postgres;

--
-- Name: tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tutorials_id_seq OWNED BY public.tutorials.id;


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, "order") FROM stdin;
\.


--
-- Data for Name: company_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_details (id, address, company_name, email_id, phone) FROM stdin;
23	\N	\N	sadfg@GMAIL	32456758
24	\N	\N	sadfg@GMAIL	32456758
25	\N	\N	sadfg@GMAIL	32456758
26	\N	\N	sadfg@GMAIL	32456758
27	\N	\N	sadfg@GMAIL	32456758
1	\N	innovix2	sadfg@GMAIL	32456758
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, name) FROM stdin;
1	Maths
2	Science
8	Physics
3	abcd
4	abcd
5	abcd
9	abcd
10	abcd
11	abcd
12	abcd
13	abcd
14	abcd
15	abcd
16	abcd
17	abcd
18	abcd
19	abcd
20	abcd
21	abcd
22	abcd
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id, name, cart_id, book_category_id) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name) FROM stdin;
1	Sridhar
2	Sridhar
3	Sridhar
8	Sridhar
6	abcd
7	abcd
\.


--
-- Data for Name: student_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_course (student_id, course_id) FROM stdin;
3	1
8	1
2	3
1	3
2	1
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
1	sridhar
\.


--
-- Data for Name: tutorial_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutorial_tags (tutorial_id, tag_id) FROM stdin;
1	1
\.


--
-- Data for Name: tutorials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutorials (id, description, published, title) FROM stdin;
1	description about first commit	t	first Commit
2	description about first commit	t	first Commit
3	description about first commit	t	first Commit
4	description about first commit	t	first Commit
5	description about first commit	t	first Commit
6	description about first commit	t	first Commit
7	description about first commit	t	first Commit
8	description about first commit	t	first Commit
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 27, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, true);


--
-- Name: tutorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tutorials_id_seq', 8, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: company_details company_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_details
    ADD CONSTRAINT company_details_pkey PRIMARY KEY (id);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: student_course student_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course
    ADD CONSTRAINT student_course_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tutorial_tags tutorial_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutorial_tags
    ADD CONSTRAINT tutorial_tags_pkey PRIMARY KEY (tutorial_id, tag_id);


--
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- Name: student_course fkejrkh4gv8iqgmspsanaji90ws; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course
    ADD CONSTRAINT fkejrkh4gv8iqgmspsanaji90ws FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: tutorial_tags fkhsdms8tahjb7i8pso32jbbjro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutorial_tags
    ADD CONSTRAINT fkhsdms8tahjb7i8pso32jbbjro FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- Name: student_course fkq7yw2wg9wlt2cnj480hcdn6dq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course
    ADD CONSTRAINT fkq7yw2wg9wlt2cnj480hcdn6dq FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: tutorial_tags fksdkwlpnw5i3b4i3x4flxtnakf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutorial_tags
    ADD CONSTRAINT fksdkwlpnw5i3b4i3x4flxtnakf FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- PostgreSQL database dump complete
--

