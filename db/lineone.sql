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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    id integer NOT NULL,
    address character varying(255),
    email_id character varying(255),
    phone bigint,
    user_name character varying(255)
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- Name: getuserid(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getuserid(idvalue numeric) RETURNS public.user_details
    LANGUAGE sql
    AS $$

SELECT * FROM user_details WHERE ID = idvalue;

$$;


ALTER FUNCTION public.getuserid(idvalue numeric) OWNER TO postgres;

--
-- Name: user_delete_procedure(numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_delete_procedure(INOUT idvalue numeric)
    LANGUAGE plpgsql
    AS $_$
BEGIN

 DELETE FROM user_details where Id =idValue ;
-- select * from user_details;
-- INSERT INTO public.user_details(id, address, email_id, phone, user_name) VALUES ($1, $2, $3, $4, $5);
-- insert into public.ticket(id) values($1)
-- insert intp public.ticket(amount) values($2)
COMMIT;
END;
$_$;


ALTER PROCEDURE public.user_delete_procedure(INOUT idvalue numeric) OWNER TO postgres;

--
-- Name: user_insert_procedure(numeric, character varying, character varying, bigint, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_insert_procedure(INOUT numeric, IN character varying, IN character varying, IN bigint, IN character varying)
    LANGUAGE plpgsql
    AS $_$
BEGIN
-- select * from user_details;
INSERT INTO public.user_details(id, address, email_id, phone, user_name) VALUES ($1, $2, $3, $4, $5);
-- insert into public.ticket(id) values($1)
-- insert intp public.ticket(amount) values($2)
COMMIT;
END;
$_$;


ALTER PROCEDURE public.user_insert_procedure(INOUT numeric, IN character varying, IN character varying, IN bigint, IN character varying) OWNER TO postgres;

--
-- Name: user_select_procedure(numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_select_procedure(IN idvalue numeric, OUT character varying, OUT character varying, OUT bigint, OUT character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
-- SELECT address,email_id,phone,user_name from user_details where id=idvalue;

select * from user_details;
-- perform * from user_details where id=idvalue; 

-- perform id
-- 	FROM public.user_details where Id = idvalue;
COMMIT;
END;
$$;


ALTER PROCEDURE public.user_select_procedure(IN idvalue numeric, OUT character varying, OUT character varying, OUT bigint, OUT character varying) OWNER TO postgres;

--
-- Name: user_update_procedure(numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.user_update_procedure(INOUT idvalue numeric, IN email character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE public.user_details
	SET email_id=email
	WHERE id=idValue;
COMMIT;
END;
$$;


ALTER PROCEDURE public.user_update_procedure(INOUT idvalue numeric, IN email character varying) OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id bigint NOT NULL,
    emp_name character varying(255)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_project (
    employee_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.employee_project OWNER TO postgres;

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
-- Name: many_to_one_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.many_to_one_student (
    id integer NOT NULL,
    student_name character varying(255),
    department_id integer
);


ALTER TABLE public.many_to_one_student OWNER TO postgres;

--
-- Name: many_to_one_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.many_to_one_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.many_to_one_student_id_seq OWNER TO postgres;

--
-- Name: many_to_one_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.many_to_one_student_id_seq OWNED BY public.many_to_one_student.id;


--
-- Name: one_to_many_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.one_to_many_department (
    id integer NOT NULL,
    department_name character varying(255)
);


ALTER TABLE public.one_to_many_department OWNER TO postgres;

--
-- Name: one_to_many_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.one_to_many_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.one_to_many_department_id_seq OWNER TO postgres;

--
-- Name: one_to_many_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.one_to_many_department_id_seq OWNED BY public.one_to_many_department.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    project_id bigint NOT NULL,
    project_name character varying(255)
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: many_to_one_student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.many_to_one_student ALTER COLUMN id SET DEFAULT nextval('public.many_to_one_student_id_seq'::regclass);


--
-- Name: one_to_many_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.one_to_many_department ALTER COLUMN id SET DEFAULT nextval('public.one_to_many_department_id_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (emp_id, emp_name) FROM stdin;
1	\N
\.


--
-- Data for Name: employee_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_project (employee_id, project_id) FROM stdin;
\.


--
-- Data for Name: many_to_one_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.many_to_one_student (id, student_name, department_id) FROM stdin;
1	Sridhar	1
\.


--
-- Data for Name: one_to_many_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.one_to_many_department (id, department_name) FROM stdin;
1	mechanical engineering
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (project_id, project_name) FROM stdin;
2	\N
\.


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_details (id, address, email_id, phone, user_name) FROM stdin;
3	Apple tree	thirdLaw@earth.com	1234715969	Newton
4	\N	sadfg@GMAIL	32456758	\N
5	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
6	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
7	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
8	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
9	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
10	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
11	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
12	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
13	Dubai Kurukku Santhu	jamesBond@mars.com	7094715969	Jamees Bomd
14	triplicane	abcd@345gmail.com	9856236985	venkat
15	Madhavaram	qwerty@gmail.com	963852741	Venky
17	royapuram	san67@gmail.com	6789876890	venkat
2	Apple tree	sanj234#gmail.com	1234715969	Newton
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 13, true);


--
-- Name: many_to_one_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.many_to_one_student_id_seq', 9, true);


--
-- Name: one_to_many_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.one_to_many_department_id_seq', 1, true);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- Name: employee_project employee_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_project
    ADD CONSTRAINT employee_project_pkey PRIMARY KEY (employee_id, project_id);


--
-- Name: many_to_one_student many_to_one_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.many_to_one_student
    ADD CONSTRAINT many_to_one_student_pkey PRIMARY KEY (id);


--
-- Name: one_to_many_department one_to_many_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.one_to_many_department
    ADD CONSTRAINT one_to_many_department_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: employee_project fk4yddvnm7283a40plkcti66wv9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_project
    ADD CONSTRAINT fk4yddvnm7283a40plkcti66wv9 FOREIGN KEY (project_id) REFERENCES public.project(project_id);


--
-- Name: employee_project fkb25s5hgggo6k4au4sye7teb3a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_project
    ADD CONSTRAINT fkb25s5hgggo6k4au4sye7teb3a FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id);


--
-- Name: many_to_one_student fkk8pookxc1x7xfr0c8ccyluf29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.many_to_one_student
    ADD CONSTRAINT fkk8pookxc1x7xfr0c8ccyluf29 FOREIGN KEY (department_id) REFERENCES public.one_to_many_department(id);


--
-- PostgreSQL database dump complete
--

