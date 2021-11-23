--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Debian 12.7-1.pgdg100+1)
-- Dumped by pg_dump version 13.3

-- Started on 2021-11-23 18:44:12 CET

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
-- TOC entry 202 (class 1259 OID 16385)
-- Name: candidate; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.candidate (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    content jsonb,
    icon_url character varying(255),
    rating integer NOT NULL,
    version character varying(255),
    pattern_language_id uuid
);


ALTER TABLE public.candidate OWNER TO patternatlas;

--
-- TOC entry 203 (class 1259 OID 16391)
-- Name: candidate_comment; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.candidate_comment (
    id uuid NOT NULL,
    rating integer NOT NULL,
    text character varying(255),
    candidate_id uuid,
    user_id uuid
);


ALTER TABLE public.candidate_comment OWNER TO patternatlas;

--
-- TOC entry 204 (class 1259 OID 16394)
-- Name: candidate_comment_rating; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.candidate_comment_rating (
    rating integer NOT NULL,
    candidate_comment_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.candidate_comment_rating OWNER TO patternatlas;

--
-- TOC entry 205 (class 1259 OID 16397)
-- Name: candidate_rating; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.candidate_rating (
    rating integer NOT NULL,
    candidate_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.candidate_rating OWNER TO patternatlas;

--
-- TOC entry 206 (class 1259 OID 16400)
-- Name: concrete_solution; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.concrete_solution (
    id uuid NOT NULL,
    aggregator_type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    pattern_uri character varying(255) NOT NULL,
    template_uri character varying(255) NOT NULL
);


ALTER TABLE public.concrete_solution OWNER TO patternatlas;

--
-- TOC entry 207 (class 1259 OID 16406)
-- Name: design_model; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.design_model (
    id uuid NOT NULL,
    name character varying(255),
    uri character varying(255),
    logo character varying(255)
);


ALTER TABLE public.design_model OWNER TO patternatlas;

--
-- TOC entry 208 (class 1259 OID 16412)
-- Name: design_model_edge_type; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.design_model_edge_type (
    name character varying(255) NOT NULL,
    swap boolean NOT NULL
);


ALTER TABLE public.design_model_edge_type OWNER TO patternatlas;

--
-- TOC entry 209 (class 1259 OID 16415)
-- Name: design_model_pattern_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.design_model_pattern_edge (
    pattern_instance1_pattern_instance_id uuid NOT NULL,
    pattern_instance2_pattern_instance_id uuid NOT NULL,
    design_model_id uuid,
    type character varying(255),
    description character varying(255),
    is_directed_edge boolean
);


ALTER TABLE public.design_model_pattern_edge OWNER TO patternatlas;

--
-- TOC entry 210 (class 1259 OID 16421)
-- Name: design_model_pattern_instance; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.design_model_pattern_instance (
    pattern_instance_id uuid NOT NULL,
    pattern_id uuid,
    design_model_id uuid,
    type character varying(255),
    index integer,
    x double precision,
    y double precision,
    vx double precision,
    vy double precision
);


ALTER TABLE public.design_model_pattern_instance OWNER TO patternatlas;

--
-- TOC entry 211 (class 1259 OID 16424)
-- Name: design_model_undirected_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.design_model_undirected_edge (
    design_model_id uuid NOT NULL,
    undirected_edge_id uuid NOT NULL
);


ALTER TABLE public.design_model_undirected_edge OWNER TO patternatlas;

--
-- TOC entry 212 (class 1259 OID 16427)
-- Name: directed_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.directed_edge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    pattern_language_id uuid,
    source_id uuid NOT NULL,
    target_id uuid NOT NULL
);


ALTER TABLE public.directed_edge OWNER TO patternatlas;

--
-- TOC entry 213 (class 1259 OID 16433)
-- Name: directed_hyperedge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.directed_hyperedge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    label character varying(255)
);


ALTER TABLE public.directed_hyperedge OWNER TO patternatlas;

--
-- TOC entry 214 (class 1259 OID 16439)
-- Name: directed_hyperedge_source_set; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.directed_hyperedge_source_set (
    directed_hyperedge_id uuid NOT NULL,
    source_set_id uuid NOT NULL
);


ALTER TABLE public.directed_hyperedge_source_set OWNER TO patternatlas;

--
-- TOC entry 215 (class 1259 OID 16442)
-- Name: directed_hyperedge_target_set; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.directed_hyperedge_target_set (
    directed_hyperedge_id uuid NOT NULL,
    target_set_id uuid NOT NULL
);


ALTER TABLE public.directed_hyperedge_target_set OWNER TO patternatlas;

--
-- TOC entry 216 (class 1259 OID 16445)
-- Name: discussion_comment; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.discussion_comment (
    id uuid NOT NULL,
    date timestamp without time zone,
    reply_to uuid,
    text character varying(255),
    discussion_topic_id uuid
);


ALTER TABLE public.discussion_comment OWNER TO patternatlas;

--
-- TOC entry 217 (class 1259 OID 16448)
-- Name: discussion_topic; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.discussion_topic (
    id uuid NOT NULL,
    date timestamp without time zone,
    description character varying(255),
    fill character varying(255),
    height double precision,
    image_id uuid,
    status integer,
    title character varying(255),
    width double precision,
    x double precision,
    y double precision
);


ALTER TABLE public.discussion_topic OWNER TO patternatlas;

--
-- TOC entry 218 (class 1259 OID 16454)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: patternatlas
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO patternatlas;

--
-- TOC entry 219 (class 1259 OID 16456)
-- Name: image; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.image (
    id uuid NOT NULL,
    data oid,
    file_name character varying(255),
    file_type character varying(255)
);


ALTER TABLE public.image OWNER TO patternatlas;

--
-- TOC entry 220 (class 1259 OID 16462)
-- Name: issue; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.issue (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    description character varying(255),
    rating integer NOT NULL,
    version character varying(255)
);


ALTER TABLE public.issue OWNER TO patternatlas;

--
-- TOC entry 221 (class 1259 OID 16468)
-- Name: issue_comment; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.issue_comment (
    id uuid NOT NULL,
    rating integer NOT NULL,
    text character varying(255),
    issue_id uuid,
    user_id uuid
);


ALTER TABLE public.issue_comment OWNER TO patternatlas;

--
-- TOC entry 222 (class 1259 OID 16471)
-- Name: issue_comment_rating; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.issue_comment_rating (
    rating integer NOT NULL,
    issue_comment_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_comment_rating OWNER TO patternatlas;

--
-- TOC entry 223 (class 1259 OID 16474)
-- Name: issue_rating; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.issue_rating (
    rating integer NOT NULL,
    issue_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_rating OWNER TO patternatlas;

--
-- TOC entry 224 (class 1259 OID 16477)
-- Name: pattern; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    content jsonb NOT NULL,
    icon_url character varying(255),
    rendered_content jsonb,
    pattern_language_id uuid,
    paper_ref character varying(255)
);


ALTER TABLE public.pattern OWNER TO patternatlas;

--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: pattern_language; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_language (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    graph jsonb,
    creative_commons_reference character varying(255),
    logo character varying(255)
);


ALTER TABLE public.pattern_language OWNER TO patternatlas;

--
-- TOC entry 226 (class 1259 OID 16489)
-- Name: pattern_schema; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_schema (
    pattern_language_id uuid NOT NULL
);


ALTER TABLE public.pattern_schema OWNER TO patternatlas;

--
-- TOC entry 227 (class 1259 OID 16492)
-- Name: pattern_section; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_section (
    id bigint NOT NULL,
    value text,
    pattern_section_schema_id uuid
);


ALTER TABLE public.pattern_section OWNER TO patternatlas;

--
-- TOC entry 228 (class 1259 OID 16498)
-- Name: pattern_section_schema; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_section_schema (
    id uuid NOT NULL,
    label character varying(255),
    name character varying(255),
    "position" integer,
    type character varying(255),
    pattern_schema_pattern_language_id uuid
);


ALTER TABLE public.pattern_section_schema OWNER TO patternatlas;

--
-- TOC entry 229 (class 1259 OID 16504)
-- Name: pattern_section_schema_pattern_sections; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_section_schema_pattern_sections (
    pattern_section_schema_id uuid NOT NULL,
    pattern_sections_id bigint NOT NULL
);


ALTER TABLE public.pattern_section_schema_pattern_sections OWNER TO patternatlas;

--
-- TOC entry 230 (class 1259 OID 16507)
-- Name: pattern_view; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_view (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    graph jsonb,
    logo character varying(255)
);


ALTER TABLE public.pattern_view OWNER TO patternatlas;

--
-- TOC entry 231 (class 1259 OID 16513)
-- Name: pattern_view_directed_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_view_directed_edge (
    directed_edge_id uuid NOT NULL,
    pattern_view_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_directed_edge OWNER TO patternatlas;

--
-- TOC entry 232 (class 1259 OID 16516)
-- Name: pattern_view_pattern; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_view_pattern (
    pattern_id uuid NOT NULL,
    pattern_view_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_pattern OWNER TO patternatlas;

--
-- TOC entry 233 (class 1259 OID 16519)
-- Name: pattern_view_undirected_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.pattern_view_undirected_edge (
    pattern_view_id uuid NOT NULL,
    undirected_edge_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_undirected_edge OWNER TO patternatlas;

--
-- TOC entry 239 (class 1259 OID 25112)
-- Name: privilege; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.privilege (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.privilege OWNER TO patternatlas;

--
-- TOC entry 240 (class 1259 OID 25117)
-- Name: role; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.role (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO patternatlas;

--
-- TOC entry 241 (class 1259 OID 25122)
-- Name: role_privileges; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.role_privileges (
    roles_id uuid NOT NULL,
    privileges_id uuid NOT NULL
);


ALTER TABLE public.role_privileges OWNER TO patternatlas;

--
-- TOC entry 234 (class 1259 OID 16522)
-- Name: undirected_edge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.undirected_edge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    p1_id uuid NOT NULL,
    p2_id uuid NOT NULL,
    pattern_language_id uuid
);


ALTER TABLE public.undirected_edge OWNER TO patternatlas;

--
-- TOC entry 235 (class 1259 OID 16528)
-- Name: undirected_hyperedge; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.undirected_hyperedge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    label character varying(255)
);


ALTER TABLE public.undirected_hyperedge OWNER TO patternatlas;

--
-- TOC entry 236 (class 1259 OID 16534)
-- Name: undirected_hyperedge_patterns; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.undirected_hyperedge_patterns (
    undirected_hyperedge_id uuid NOT NULL,
    patterns_id uuid NOT NULL
);


ALTER TABLE public.undirected_hyperedge_patterns OWNER TO patternatlas;

--
-- TOC entry 237 (class 1259 OID 16537)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.user_entity (
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    password character varying(255),
    role_id uuid
);


ALTER TABLE public.user_entity OWNER TO patternatlas;

--
-- TOC entry 238 (class 1259 OID 16543)
-- Name: user_entity_roles; Type: TABLE; Schema: public; Owner: patternatlas
--

CREATE TABLE public.user_entity_roles (
    user_entity_id uuid NOT NULL,
    roles character varying(255)
);


ALTER TABLE public.user_entity_roles OWNER TO patternatlas;

--
-- TOC entry 2953 (class 2606 OID 16547)
-- Name: candidate_comment candidate_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT candidate_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 16549)
-- Name: candidate_comment_rating candidate_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT candidate_comment_rating_pkey PRIMARY KEY (candidate_comment_id, user_id);


--
-- TOC entry 2947 (class 2606 OID 16551)
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 16553)
-- Name: candidate_rating candidate_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT candidate_rating_pkey PRIMARY KEY (candidate_id, user_id);


--
-- TOC entry 2959 (class 2606 OID 16555)
-- Name: concrete_solution concrete_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.concrete_solution
    ADD CONSTRAINT concrete_solution_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 16557)
-- Name: design_model_edge_type design_model_edge_type_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_edge_type
    ADD CONSTRAINT design_model_edge_type_pkey PRIMARY KEY (name);


--
-- TOC entry 2967 (class 2606 OID 16559)
-- Name: design_model_pattern_edge design_model_pattern_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT design_model_pattern_edge_pkey PRIMARY KEY (pattern_instance1_pattern_instance_id, pattern_instance2_pattern_instance_id);


--
-- TOC entry 2969 (class 2606 OID 16561)
-- Name: design_model_pattern_instance design_model_pattern_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT design_model_pattern_instance_pkey PRIMARY KEY (pattern_instance_id);


--
-- TOC entry 2961 (class 2606 OID 16563)
-- Name: design_model design_model_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model
    ADD CONSTRAINT design_model_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 16565)
-- Name: design_model_undirected_edge design_model_undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT design_model_undirected_edge_pkey PRIMARY KEY (design_model_id, undirected_edge_id);


--
-- TOC entry 2973 (class 2606 OID 16567)
-- Name: directed_edge directed_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT directed_edge_pkey PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 16569)
-- Name: directed_hyperedge directed_hyperedge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge
    ADD CONSTRAINT directed_hyperedge_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 16571)
-- Name: directed_hyperedge_source_set directed_hyperedge_source_set_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT directed_hyperedge_source_set_pkey PRIMARY KEY (directed_hyperedge_id, source_set_id);


--
-- TOC entry 2983 (class 2606 OID 16573)
-- Name: directed_hyperedge_target_set directed_hyperedge_target_set_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT directed_hyperedge_target_set_pkey PRIMARY KEY (directed_hyperedge_id, target_set_id);


--
-- TOC entry 2987 (class 2606 OID 16575)
-- Name: discussion_comment discussion_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.discussion_comment
    ADD CONSTRAINT discussion_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 16577)
-- Name: discussion_topic discussion_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.discussion_topic
    ADD CONSTRAINT discussion_topic_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 16579)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 16581)
-- Name: issue_comment issue_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT issue_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3001 (class 2606 OID 16583)
-- Name: issue_comment_rating issue_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT issue_comment_rating_pkey PRIMARY KEY (issue_comment_id, user_id);


--
-- TOC entry 2993 (class 2606 OID 16585)
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 16587)
-- Name: issue_rating issue_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT issue_rating_pkey PRIMARY KEY (issue_id, user_id);


--
-- TOC entry 3011 (class 2606 OID 16589)
-- Name: pattern_language pattern_language_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_language
    ADD CONSTRAINT pattern_language_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 16591)
-- Name: pattern pattern_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT pattern_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 16593)
-- Name: pattern_schema pattern_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_schema
    ADD CONSTRAINT pattern_schema_pkey PRIMARY KEY (pattern_language_id);


--
-- TOC entry 3017 (class 2606 OID 16595)
-- Name: pattern_section pattern_section_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section
    ADD CONSTRAINT pattern_section_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 16597)
-- Name: pattern_section_schema pattern_section_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section_schema
    ADD CONSTRAINT pattern_section_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 16599)
-- Name: pattern_view_directed_edge pattern_view_directed_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT pattern_view_directed_edge_pkey PRIMARY KEY (directed_edge_id, pattern_view_id);


--
-- TOC entry 3029 (class 2606 OID 16601)
-- Name: pattern_view_pattern pattern_view_pattern_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT pattern_view_pattern_pkey PRIMARY KEY (pattern_id, pattern_view_id);


--
-- TOC entry 3023 (class 2606 OID 16603)
-- Name: pattern_view pattern_view_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view
    ADD CONSTRAINT pattern_view_pkey PRIMARY KEY (id);


--
-- TOC entry 3031 (class 2606 OID 16605)
-- Name: pattern_view_undirected_edge pattern_view_undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT pattern_view_undirected_edge_pkey PRIMARY KEY (pattern_view_id, undirected_edge_id);


--
-- TOC entry 3049 (class 2606 OID 25116)
-- Name: privilege privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (id);


--
-- TOC entry 3053 (class 2606 OID 25121)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 16607)
-- Name: candidate uk_2nnar9yvwxvggs1ymw99br8fq; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT uk_2nnar9yvwxvggs1ymw99br8fq UNIQUE (uri);


--
-- TOC entry 2951 (class 2606 OID 16609)
-- Name: candidate uk_3y29gxrn8rruyc1gmq6jj6uqs; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT uk_3y29gxrn8rruyc1gmq6jj6uqs UNIQUE (uri);


--
-- TOC entry 3043 (class 2606 OID 16611)
-- Name: user_entity uk_4xad1enskw4j1t2866f7sodrx; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_4xad1enskw4j1t2866f7sodrx UNIQUE (email);


--
-- TOC entry 3007 (class 2606 OID 16613)
-- Name: pattern uk_6vocvcw50hujfwn66kt7s5fly; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT uk_6vocvcw50hujfwn66kt7s5fly UNIQUE (uri);


--
-- TOC entry 2995 (class 2606 OID 16615)
-- Name: issue uk_8063id79236r47vy0x6k3ek9n; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT uk_8063id79236r47vy0x6k3ek9n UNIQUE (uri);


--
-- TOC entry 3055 (class 2606 OID 25128)
-- Name: role uk_8sewwnpamngi6b1dwaa88askk; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_8sewwnpamngi6b1dwaa88askk UNIQUE (name);


--
-- TOC entry 3021 (class 2606 OID 16617)
-- Name: pattern_section_schema_pattern_sections uk_a5dhcqp5e8908x217tkb3ic31; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT uk_a5dhcqp5e8908x217tkb3ic31 UNIQUE (pattern_sections_id);


--
-- TOC entry 2981 (class 2606 OID 16619)
-- Name: directed_hyperedge_source_set uk_bevke13de29vkx6hixr9h9vei; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT uk_bevke13de29vkx6hixr9h9vei UNIQUE (source_set_id);


--
-- TOC entry 2963 (class 2606 OID 16621)
-- Name: design_model uk_bry9ub9e5d26eq397ax24ra8c; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model
    ADD CONSTRAINT uk_bry9ub9e5d26eq397ax24ra8c UNIQUE (uri);


--
-- TOC entry 2997 (class 2606 OID 16623)
-- Name: issue uk_c56ot98f5n1mpxjncwej48s8h; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT uk_c56ot98f5n1mpxjncwej48s8h UNIQUE (uri);


--
-- TOC entry 3039 (class 2606 OID 16625)
-- Name: undirected_hyperedge_patterns uk_e61v2oikejer2v1dtcqbbc02l; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT uk_e61v2oikejer2v1dtcqbbc02l UNIQUE (patterns_id);


--
-- TOC entry 3025 (class 2606 OID 16627)
-- Name: pattern_view uk_gcd5mwq1kb8jn6jvwg192u3cd; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view
    ADD CONSTRAINT uk_gcd5mwq1kb8jn6jvwg192u3cd UNIQUE (uri);


--
-- TOC entry 3051 (class 2606 OID 25126)
-- Name: privilege uk_h7iwbdg4ev8mgvmij76881tx8; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT uk_h7iwbdg4ev8mgvmij76881tx8 UNIQUE (name);


--
-- TOC entry 2985 (class 2606 OID 16629)
-- Name: directed_hyperedge_target_set uk_i7fjt85n23bduccj52sy5m7kl; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT uk_i7fjt85n23bduccj52sy5m7kl UNIQUE (target_set_id);


--
-- TOC entry 3045 (class 2606 OID 16631)
-- Name: user_entity uk_l6ltic8jtbw6kty72cqdqxs00; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_l6ltic8jtbw6kty72cqdqxs00 UNIQUE (email);


--
-- TOC entry 3009 (class 2606 OID 16633)
-- Name: pattern uk_plmwg77e7f62fbvydxohxn4v9; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT uk_plmwg77e7f62fbvydxohxn4v9 UNIQUE (uri);


--
-- TOC entry 3013 (class 2606 OID 16635)
-- Name: pattern_language uk_qd35crdvw857tcrg5topnhslc; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_language
    ADD CONSTRAINT uk_qd35crdvw857tcrg5topnhslc UNIQUE (uri);


--
-- TOC entry 3035 (class 2606 OID 16637)
-- Name: undirected_edge undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT undirected_edge_pkey PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 16639)
-- Name: undirected_hyperedge_patterns undirected_hyperedge_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT undirected_hyperedge_patterns_pkey PRIMARY KEY (undirected_hyperedge_id, patterns_id);


--
-- TOC entry 3037 (class 2606 OID 16641)
-- Name: undirected_hyperedge undirected_hyperedge_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_hyperedge
    ADD CONSTRAINT undirected_hyperedge_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 16643)
-- Name: user_entity user_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT user_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 1259 OID 16644)
-- Name: p1patternidx; Type: INDEX; Schema: public; Owner: patternatlas
--

CREATE INDEX p1patternidx ON public.undirected_edge USING btree (p1_id);


--
-- TOC entry 3033 (class 1259 OID 16645)
-- Name: p2patternidx; Type: INDEX; Schema: public; Owner: patternatlas
--

CREATE INDEX p2patternidx ON public.undirected_edge USING btree (p2_id);


--
-- TOC entry 2974 (class 1259 OID 16646)
-- Name: sourcepatternidx; Type: INDEX; Schema: public; Owner: patternatlas
--

CREATE INDEX sourcepatternidx ON public.directed_edge USING btree (source_id);


--
-- TOC entry 2975 (class 1259 OID 16647)
-- Name: targetpatternidx; Type: INDEX; Schema: public; Owner: patternatlas
--

CREATE INDEX targetpatternidx ON public.directed_edge USING btree (target_id);


--
-- TOC entry 3090 (class 2606 OID 16648)
-- Name: pattern_view_directed_edge fk3b7r2oi11ur1t7ugi1477imrp; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT fk3b7r2oi11ur1t7ugi1477imrp FOREIGN KEY (directed_edge_id) REFERENCES public.directed_edge(id);


--
-- TOC entry 3068 (class 2606 OID 16653)
-- Name: design_model_undirected_edge fk3c78hgbc42y1nag5hbiec4mf8; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT fk3c78hgbc42y1nag5hbiec4mf8 FOREIGN KEY (undirected_edge_id) REFERENCES public.undirected_edge(id);


--
-- TOC entry 3086 (class 2606 OID 16658)
-- Name: pattern_section fk3cvo9f0idatua01yg1n112wkq; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section
    ADD CONSTRAINT fk3cvo9f0idatua01yg1n112wkq FOREIGN KEY (pattern_section_schema_id) REFERENCES public.pattern_section_schema(id);


--
-- TOC entry 3066 (class 2606 OID 16663)
-- Name: design_model_pattern_instance fk3n041q3n5smuaq4brv9fhf7br; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT fk3n041q3n5smuaq4brv9fhf7br FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


--
-- TOC entry 3080 (class 2606 OID 16668)
-- Name: issue_comment_rating fk3o0axm0t08m1p1fb94ucksys1; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT fk3o0axm0t08m1p1fb94ucksys1 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3078 (class 2606 OID 16673)
-- Name: issue_comment fk3qe8erpdobc1yb6dk26nbhojp; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT fk3qe8erpdobc1yb6dk26nbhojp FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3082 (class 2606 OID 16678)
-- Name: issue_rating fk3qnwbh69l8ihd5ms33nvo0n83; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT fk3qnwbh69l8ihd5ms33nvo0n83 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3084 (class 2606 OID 16683)
-- Name: pattern fk77ttqbiemowpyaxy1cc5k9is5; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT fk77ttqbiemowpyaxy1cc5k9is5 FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3092 (class 2606 OID 16688)
-- Name: pattern_view_pattern fk7gjr0y7vsqmnnsgohqgb5l7ac; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT fk7gjr0y7vsqmnnsgohqgb5l7ac FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3067 (class 2606 OID 16693)
-- Name: design_model_pattern_instance fk7rdcjjev6awr8jfvwoyi3cvml; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT fk7rdcjjev6awr8jfvwoyi3cvml FOREIGN KEY (pattern_id) REFERENCES public.pattern(id);


--
-- TOC entry 3077 (class 2606 OID 16698)
-- Name: discussion_comment fk7st41tqwtxhelg9euc4y4qqm4; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.discussion_comment
    ADD CONSTRAINT fk7st41tqwtxhelg9euc4y4qqm4 FOREIGN KEY (discussion_topic_id) REFERENCES public.discussion_topic(id);


--
-- TOC entry 3073 (class 2606 OID 16703)
-- Name: directed_hyperedge_source_set fk8guwfrj62or1u8rwdwtf7y5yn; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT fk8guwfrj62or1u8rwdwtf7y5yn FOREIGN KEY (source_set_id) REFERENCES public.pattern(id);


--
-- TOC entry 3056 (class 2606 OID 16708)
-- Name: candidate fk8s7x8de0d0upup60hkuggb86q; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk8s7x8de0d0upup60hkuggb86q FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3096 (class 2606 OID 16713)
-- Name: undirected_edge fk8sqyicdi1e8n3neu2kueocol3; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fk8sqyicdi1e8n3neu2kueocol3 FOREIGN KEY (p1_id) REFERENCES public.pattern(id);


--
-- TOC entry 3079 (class 2606 OID 16718)
-- Name: issue_comment fk8wy5rxggrte2ntcq80g7o7210; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT fk8wy5rxggrte2ntcq80g7o7210 FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3104 (class 2606 OID 25134)
-- Name: role_privileges fk9n2w8s3aw0yk00s4nmqvucw6b; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk9n2w8s3aw0yk00s4nmqvucw6b FOREIGN KEY (roles_id) REFERENCES public.role(id);


--
-- TOC entry 3103 (class 2606 OID 25129)
-- Name: role_privileges fkas5s9i1itvr8tgocse4xmtwox; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fkas5s9i1itvr8tgocse4xmtwox FOREIGN KEY (privileges_id) REFERENCES public.privilege(id);


--
-- TOC entry 3069 (class 2606 OID 16723)
-- Name: design_model_undirected_edge fkbu6vgj31dog8bhcfbhyw3dydq; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT fkbu6vgj31dog8bhcfbhyw3dydq FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


--
-- TOC entry 3094 (class 2606 OID 16728)
-- Name: pattern_view_undirected_edge fkd1qjwyn88gn4jtpygu1kna7ht; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT fkd1qjwyn88gn4jtpygu1kna7ht FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3081 (class 2606 OID 16733)
-- Name: issue_comment_rating fkdpod2iog9jj6y5mitrw318sqj; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT fkdpod2iog9jj6y5mitrw318sqj FOREIGN KEY (issue_comment_id) REFERENCES public.issue_comment(id);


--
-- TOC entry 3070 (class 2606 OID 16738)
-- Name: directed_edge fkdvt319vj8sqqs5q8cxa2mqam2; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fkdvt319vj8sqqs5q8cxa2mqam2 FOREIGN KEY (source_id) REFERENCES public.pattern(id);


--
-- TOC entry 3093 (class 2606 OID 16743)
-- Name: pattern_view_pattern fke118qe89rm1swbs0f6ffs3wo8; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT fke118qe89rm1swbs0f6ffs3wo8 FOREIGN KEY (pattern_id) REFERENCES public.pattern(id);


--
-- TOC entry 3088 (class 2606 OID 16748)
-- Name: pattern_section_schema_pattern_sections fkegwj4doqcp1wipgwb2l3komdn; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT fkegwj4doqcp1wipgwb2l3komdn FOREIGN KEY (pattern_sections_id) REFERENCES public.pattern_section(id);


--
-- TOC entry 3071 (class 2606 OID 16753)
-- Name: directed_edge fken29l6v8wmkqxaiaks7pe8rwu; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fken29l6v8wmkqxaiaks7pe8rwu FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3089 (class 2606 OID 16758)
-- Name: pattern_section_schema_pattern_sections fkfafffrkwjwkpm4rus99ao5gvm; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT fkfafffrkwjwkpm4rus99ao5gvm FOREIGN KEY (pattern_section_schema_id) REFERENCES public.pattern_section_schema(id);


--
-- TOC entry 3085 (class 2606 OID 16763)
-- Name: pattern_schema fkfuru8632bnda9yj6he9aqffme; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_schema
    ADD CONSTRAINT fkfuru8632bnda9yj6he9aqffme FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3059 (class 2606 OID 16768)
-- Name: candidate_comment_rating fkg7qo3nvneqg1ivvlt50123ss2; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT fkg7qo3nvneqg1ivvlt50123ss2 FOREIGN KEY (candidate_comment_id) REFERENCES public.candidate_comment(id);


--
-- TOC entry 3060 (class 2606 OID 16773)
-- Name: candidate_comment_rating fkg8j63smj6n8rh6kr8tp3nfdix; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT fkg8j63smj6n8rh6kr8tp3nfdix FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3057 (class 2606 OID 16778)
-- Name: candidate_comment fkgl0y3i6y5dd9c8psdu7mp7xqy; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT fkgl0y3i6y5dd9c8psdu7mp7xqy FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3075 (class 2606 OID 16783)
-- Name: directed_hyperedge_target_set fkhl9yorn5wev3m5ooqrlq3ufxg; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT fkhl9yorn5wev3m5ooqrlq3ufxg FOREIGN KEY (target_set_id) REFERENCES public.pattern(id);


--
-- TOC entry 3063 (class 2606 OID 16788)
-- Name: design_model_pattern_edge fkhx1ynl2ovjddccjvxnjytl2n9; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fkhx1ynl2ovjddccjvxnjytl2n9 FOREIGN KEY (pattern_instance1_pattern_instance_id) REFERENCES public.design_model_pattern_instance(pattern_instance_id);


--
-- TOC entry 3095 (class 2606 OID 16793)
-- Name: pattern_view_undirected_edge fki4vnsjoalbiwx4yr4thn4ya87; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT fki4vnsjoalbiwx4yr4thn4ya87 FOREIGN KEY (undirected_edge_id) REFERENCES public.undirected_edge(id);


--
-- TOC entry 3076 (class 2606 OID 16798)
-- Name: directed_hyperedge_target_set fkjoimrxph588139toilxf57uy2; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT fkjoimrxph588139toilxf57uy2 FOREIGN KEY (directed_hyperedge_id) REFERENCES public.directed_hyperedge(id);


--
-- TOC entry 3097 (class 2606 OID 16803)
-- Name: undirected_edge fkjos3a1eebvu6hbrbls6wpoygt; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fkjos3a1eebvu6hbrbls6wpoygt FOREIGN KEY (p2_id) REFERENCES public.pattern(id);


--
-- TOC entry 3102 (class 2606 OID 16808)
-- Name: user_entity_roles fkjvvinok3stf32dvgie3vr73s0; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.user_entity_roles
    ADD CONSTRAINT fkjvvinok3stf32dvgie3vr73s0 FOREIGN KEY (user_entity_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3058 (class 2606 OID 16813)
-- Name: candidate_comment fkjwq8pmpyru6a87cukgmvo0q93; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT fkjwq8pmpyru6a87cukgmvo0q93 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3083 (class 2606 OID 16818)
-- Name: issue_rating fkky82wgp632e04u03hksxeg1ww; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT fkky82wgp632e04u03hksxeg1ww FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3091 (class 2606 OID 16823)
-- Name: pattern_view_directed_edge fkl97vn4so04u3ab22i5nv72q6e; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT fkl97vn4so04u3ab22i5nv72q6e FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3064 (class 2606 OID 16828)
-- Name: design_model_pattern_edge fkoy98b1qvknikypxgc0jcj0xtc; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fkoy98b1qvknikypxgc0jcj0xtc FOREIGN KEY (pattern_instance2_pattern_instance_id) REFERENCES public.design_model_pattern_instance(pattern_instance_id);


--
-- TOC entry 3061 (class 2606 OID 16833)
-- Name: candidate_rating fkp3b3ukrra2u0sysqcwlv4klkn; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT fkp3b3ukrra2u0sysqcwlv4klkn FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3101 (class 2606 OID 25139)
-- Name: user_entity fkpostrnt7qdgc4m56i71qlkl61; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT fkpostrnt7qdgc4m56i71qlkl61 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 3072 (class 2606 OID 16838)
-- Name: directed_edge fkq14jnn8mw3w8t1qo9lgtcpk9e; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fkq14jnn8mw3w8t1qo9lgtcpk9e FOREIGN KEY (target_id) REFERENCES public.pattern(id);


--
-- TOC entry 3062 (class 2606 OID 16843)
-- Name: candidate_rating fkqbpga562vdylosfny7pjviddq; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT fkqbpga562vdylosfny7pjviddq FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3087 (class 2606 OID 16848)
-- Name: pattern_section_schema fkrie76ldgkhkbs3cug3kkvmkcd; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.pattern_section_schema
    ADD CONSTRAINT fkrie76ldgkhkbs3cug3kkvmkcd FOREIGN KEY (pattern_schema_pattern_language_id) REFERENCES public.pattern_schema(pattern_language_id);


--
-- TOC entry 3099 (class 2606 OID 16853)
-- Name: undirected_hyperedge_patterns fksv0r49fdkcsiv4gg4qgg5t6w0; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT fksv0r49fdkcsiv4gg4qgg5t6w0 FOREIGN KEY (undirected_hyperedge_id) REFERENCES public.undirected_hyperedge(id);


--
-- TOC entry 3074 (class 2606 OID 16858)
-- Name: directed_hyperedge_source_set fksyqyvo4dr6pj2mdofd5drosdm; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT fksyqyvo4dr6pj2mdofd5drosdm FOREIGN KEY (directed_hyperedge_id) REFERENCES public.directed_hyperedge(id);


--
-- TOC entry 3100 (class 2606 OID 16863)
-- Name: undirected_hyperedge_patterns fkt25wk8gkit4hr7oyee2prm48; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT fkt25wk8gkit4hr7oyee2prm48 FOREIGN KEY (patterns_id) REFERENCES public.pattern(id);


--
-- TOC entry 3098 (class 2606 OID 16868)
-- Name: undirected_edge fkt73wgqcqh5u6ro109oq15dh9v; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fkt73wgqcqh5u6ro109oq15dh9v FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3065 (class 2606 OID 16873)
-- Name: design_model_pattern_edge fktmrf8lhrt4fpnh9jwdlpk1iae; Type: FK CONSTRAINT; Schema: public; Owner: patternatlas
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fktmrf8lhrt4fpnh9jwdlpk1iae FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


-- Completed on 2021-11-23 18:44:12 CET

--
-- PostgreSQL database dump complete
--

