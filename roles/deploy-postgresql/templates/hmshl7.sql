--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: hmsdba
--

CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO hmsdba;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: hmsdba
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

{% if hospital == 'nuh' %}

--
-- Name: messages_hl7_nuh_adt; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_nuh_adt (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_nuh_adt OWNER TO hmsdba;

--
-- Name: messages_hl7_nuh_adt_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_nuh_adt_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_nuh_adt_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_nuh_adt_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_nuh_adt_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_nuh_adt_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_nuh_adt_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_nuh_adt_archive_id_seq OWNED BY public.messages_hl7_nuh_adt_archive.id;


--
-- Name: messages_hl7_nuh_adt_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_nuh_adt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_nuh_adt_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_nuh_adt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_nuh_adt_id_seq OWNED BY public.messages_hl7_nuh_adt.id;


--
-- Name: messages_hl7_nuh_adt_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_nuh_adt_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_nuh_adt_process OWNER TO hmsdba;


--
-- Name: messages_hl7_aih_adt; Type: TABLE; Schema: public; Owner: hmsdba
--


CREATE TABLE public.messages_hl7_aih_adt (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_aih_adt OWNER TO hmsdba;

--
-- Name: messages_hl7_aih_adt_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_aih_adt_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_aih_adt_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_aih_adt_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_aih_adt_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_aih_adt_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_aih_adt_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_aih_adt_archive_id_seq OWNED BY public.messages_hl7_aih_adt_archive.id;


--
-- Name: messages_hl7_aih_adt_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_aih_adt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_aih_adt_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_aih_adt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_aih_adt_id_seq OWNED BY public.messages_hl7_aih_adt.id;


--
-- Name: messages_hl7_aih_adt_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_aih_adt_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_aih_adt_process OWNER TO hmsdba;

{% else %}

--
-- Name: messages_hl7_{{ hospital }}_adt; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_adt (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_adt OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_adt_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_adt_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_adt_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_adt_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_adt_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_adt_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_adt_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_adt_archive_id_seq OWNED BY public.messages_hl7_{{ hospital }}_adt_archive.id;


--
-- Name: messages_hl7_{{ hospital }}_adt_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_adt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_adt_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_adt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_adt_id_seq OWNED BY public.messages_hl7_{{ hospital }}_adt.id;


--
-- Name: messages_hl7_{{ hospital }}_adt_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_adt_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_adt_process OWNER TO hmsdba;

{% endif %}

{% if hospital == 'ktph' %}
--
-- Name: messages_hl7_{{ hospital }}_bbr_lis_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_bbr_lis_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_bbr_lis_process OWNER TO hmsdba;
{% endif %}

{% if hospital == 'ktph' %}
--
-- Name: messages_hl7_{{ hospital }}_bbr_rad_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_bbr_rad_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_bbr_rad_process OWNER TO hmsdba;
{% endif %}

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_{{ hospital }}_lis_beaker; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_beaker (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_beaker OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_beaker_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_beaker_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_beaker_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_beaker_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_beaker_process OWNER TO hmsdba;


--
-- Name: messages_hl7_{{ hospital }}_lis_beaker_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_beaker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_beaker_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_beaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_beaker_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis_beaker.id;

{% else %}
--
-- Name: messages_hl7_{{ hospital }}_lis; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive_crrdb; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_archive_crrdb (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_archive_crrdb OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive_crrdb_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_archive_crrdb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_archive_crrdb_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive_crrdb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_archive_crrdb_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis_archive_crrdb.id;


--
-- Name: messages_hl7_{{ hospital }}_lis_archive_hms; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_archive_hms (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_archive_hms OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_archive_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis_archive.id;


--
-- Name: messages_hl7_{{ hospital }}_lis_crrdb; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_crrdb (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_crrdb OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_crrdb_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_crrdb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_crrdb_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_crrdb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_crrdb_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis_crrdb.id;


--
-- Name: messages_hl7_{{ hospital }}_lis_hms; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_hms (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_hms OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_hms_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_hms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_hms_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_hms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_hms_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis_hms.id;


--
-- Name: messages_hl7_{{ hospital }}_lis_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_lis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_lis_id_seq OWNED BY public.messages_hl7_{{ hospital }}_lis.id;


--
-- Name: messages_hl7_{{ hospital }}_lis_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_process OWNER TO hmsdba;

{% endif %}
--
-- Name: messages_hl7_{{ hospital }}_lis_process_crrdb; Type: TABLE; Schema: public; Owner: hmsdba
--
{% if hospital == 'ktph' %}
CREATE TABLE public.messages_hl7_{{ hospital }}_lis_process_crrdb (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_process_crrdb OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_lis_process_hms; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_lis_process_hms (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_lis_process_hms OWNER TO hmsdba;

{% endif %}
--
-- Name: messages_hl7_{{ hospital }}_rad; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_rad (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_rad OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_rad_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_rad_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_rad_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_rad_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_rad_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_rad_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_rad_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_rad_archive_id_seq OWNED BY public.messages_hl7_{{ hospital }}_rad_archive.id;


--
-- Name: messages_hl7_{{ hospital }}_rad_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_rad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_rad_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_rad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_rad_id_seq OWNED BY public.messages_hl7_{{ hospital }}_rad.id;


--
-- Name: messages_hl7_{{ hospital }}_rad_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_rad_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_rad_process OWNER TO hmsdba;

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_{{ hospital }}_ecg; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_ecg (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_ecg OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_ecg_archive; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_ecg_archive (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    msg_control_id character varying(100),
    msg_date_time character varying(100),
    accession_no character varying(100),
    patient_visit_id character varying(100),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_hl7_{{ hospital }}_ecg_archive OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_ecg_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_ecg_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_ecg_archive_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_ecg_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_ecg_archive_id_seq OWNED BY public.messages_hl7_{{ hospital }}_ecg_archive.id;


--
-- Name: messages_hl7_{{ hospital }}_ecg_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_hl7_{{ hospital }}_ecg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_hl7_{{ hospital }}_ecg_id_seq OWNER TO hmsdba;

--
-- Name: messages_hl7_{{ hospital }}_ecg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_hl7_{{ hospital }}_ecg_id_seq OWNED BY public.messages_hl7_{{ hospital }}_ecg.id;


--
-- Name: messages_hl7_{{ hospital }}_ecg_process; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_hl7_{{ hospital }}_ecg_process (
    lastupdateid bigint DEFAULT '0'::bigint NOT NULL,
    lastupdatetimestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages_hl7_{{ hospital }}_ecg_process OWNER TO hmsdba;

{% endif %}

--
-- Name: messages_scm; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_scm (
    id integer NOT NULL,
    event_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sending_facility character varying(10),
    message_type character varying(3),
    event_type character varying(3),
    patient_ext_id character varying(100),
    patient_int_id character varying(100),
    patient_name character varying(500),
    patient_location character varying(500),
    attending_doctor character varying(500),
    admitting_doctor character varying(500),
    raw_data text,
    message text,
    channel character varying(10)
);


ALTER TABLE public.messages_scm OWNER TO hmsdba;

--
-- Name: messages_scm_id_seq; Type: SEQUENCE; Schema: public; Owner: hmsdba
--

CREATE SEQUENCE public.messages_scm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_scm_id_seq OWNER TO hmsdba;

--
-- Name: messages_scm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmsdba
--

ALTER SEQUENCE public.messages_scm_id_seq OWNED BY public.messages_scm.id;


--
-- Name: messages_watchdog; Type: TABLE; Schema: public; Owner: hmsdba
--

CREATE TABLE public.messages_watchdog (
    channel character varying(20) NOT NULL,
    last_check_id bigint NOT NULL,
    last_check_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE public.messages_watchdog OWNER TO hmsdba;

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_nuh_adt id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_nuh_adt ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_nuh_adt_id_seq'::regclass);

--
-- Name: messages_hl7_aih_adt id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_aih_adt ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_aih_adt_id_seq'::regclass);

--
-- Name: messages_hl7_{{ hospital }}_lis_beaker id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_beaker ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_lis_beaker_id_seq'::regclass);


{% else %}
--
-- Name: messages_hl7_{{ hospital }}_adt id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_adt ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_adt_id_seq'::regclass);

--
-- Name: messages_hl7_{{ hospital }}_lis id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_lis_id_seq'::regclass);


--
-- Name: messages_hl7_{{ hospital }}_lis_crrdb id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_crrdb ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_lis_crrdb_id_seq'::regclass);


--
-- Name: messages_hl7_{{ hospital }}_lis_hms id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_hms ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_lis_hms_id_seq'::regclass);

{% endif %}

--
-- Name: messages_hl7_{{ hospital }}_rad id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_rad ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_rad_id_seq'::regclass);

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_{{ hospital }}_ecg id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_ecg ALTER COLUMN id SET DEFAULT nextval('public.messages_hl7_{{ hospital }}_ecg_id_seq'::regclass);

{% endif %}

--
-- Name: messages_scm id; Type: DEFAULT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_scm ALTER COLUMN id SET DEFAULT nextval('public.messages_scm_id_seq'::regclass);

{% if hospital == 'nuh' %}

--
-- Name: messages_hl7_nuh_adt idx_563615_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_nuh_adt
    ADD CONSTRAINT idx_563615_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_nuh_adt_archive idx_563625_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_nuh_adt_archive
    ADD CONSTRAINT idx_563625_primary PRIMARY KEY (id);
--
-- Name: messages_hl7_aih_adt idx_563615_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_aih_adt
    ADD CONSTRAINT idx_563615_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_aih_adt_archive idx_563625_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_aih_adt_archive
    ADD CONSTRAINT idx_563625_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_{{ hospital }}_lis_beaker idx_563650_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_beaker
    ADD CONSTRAINT idx_563650_primary PRIMARY KEY (id);
	
--
-- Name: messages_hl7_{{ hospital }}_lis_beaker_archive idx_563660_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_beaker_archive
    ADD CONSTRAINT idx_563660_primary PRIMARY KEY (id);

{% else %}
--
-- Name: messages_hl7_{{ hospital }}_adt idx_563615_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_adt
    ADD CONSTRAINT idx_563615_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_{{ hospital }}_adt_archive idx_563625_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_adt_archive
    ADD CONSTRAINT idx_563625_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_{{ hospital }}_lis idx_563650_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis
    ADD CONSTRAINT idx_563650_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_lis_archive idx_563660_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_archive
    ADD CONSTRAINT idx_563660_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_lis_archive_crrdb idx_563670_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_archive_crrdb
    ADD CONSTRAINT idx_563670_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_lis_archive_hms idx_563678_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_archive_hms
    ADD CONSTRAINT idx_563678_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_lis_crrdb idx_563687_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_crrdb
    ADD CONSTRAINT idx_563687_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_lis_hms idx_563697_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_hms
    ADD CONSTRAINT idx_563697_primary PRIMARY KEY (id);

{% endif %}

--
-- Name: messages_hl7_{{ hospital }}_rad idx_563722_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_rad
    ADD CONSTRAINT idx_563722_primary PRIMARY KEY (id);


--
-- Name: messages_hl7_{{ hospital }}_rad_archive idx_563732_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_rad_archive
    ADD CONSTRAINT idx_563732_primary PRIMARY KEY (id);


{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_{{ hospital }}_ecg idx_563722_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_ecg
    ADD CONSTRAINT idx_563722_primary PRIMARY KEY (id);

--
-- Name: messages_hl7_{{ hospital }}_ecg_archive idx_563732_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_ecg_archive
    ADD CONSTRAINT idx_563732_primary PRIMARY KEY (id);
{% endif %}
--
-- Name: messages_scm idx_563747_primary; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_scm
    ADD CONSTRAINT idx_563747_primary PRIMARY KEY (id);

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_nuh_adt_process messages_hl7_nuh_adt_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_nuh_adt_process
    ADD CONSTRAINT messages_hl7_nuh_adt_process_pkey PRIMARY KEY (lastupdateid);

--
-- Name: messages_hl7_aih_adt_process messages_hl7_aih_adt_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_aih_adt_process
    ADD CONSTRAINT messages_hl7_aih_adt_process_pkey PRIMARY KEY (lastupdateid);
{% else %}
--
-- Name: messages_hl7_{{ hospital }}_adt_process messages_hl7_{{ hospital }}_adt_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_adt_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_adt_process_pkey PRIMARY KEY (lastupdateid);

{% endif %}

{% if hospital == 'ktph' %}
--
-- Name: messages_hl7_{{ hospital }}_bbr_lis_process messages_hl7_{{ hospital }}_bbr_lis_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_bbr_lis_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_bbr_lis_process_pkey PRIMARY KEY (lastupdateid);


--
-- Name: messages_hl7_{{ hospital }}_bbr_rad_process messages_hl7_{{ hospital }}_bbr_rad_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_bbr_rad_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_bbr_rad_process_pkey PRIMARY KEY (lastupdateid);

--
-- Name: messages_hl7_{{ hospital }}_lis_process_crrdb messages_hl7_{{ hospital }}_lis_process_crrdb_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_process_crrdb
    ADD CONSTRAINT messages_hl7_{{ hospital }}_lis_process_crrdb_pkey PRIMARY KEY (lastupdateid);


--
-- Name: messages_hl7_{{ hospital }}_lis_process_hms messages_hl7_{{ hospital }}_lis_process_hms_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_process_hms
    ADD CONSTRAINT messages_hl7_{{ hospital }}_lis_process_hms_pkey PRIMARY KEY (lastupdateid);

{% endif %}

{% if hospital == 'nuh' %}

--
-- Name: messages_hl7_{{ hospital }}_lis_beaker_process messages_hl7_{{ hospital }}_lis_beaker_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_beaker_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_lis_beaker_process_pkey PRIMARY KEY (lastupdateid);

{% else %}

--
-- Name: messages_hl7_{{ hospital }}_lis_process messages_hl7_{{ hospital }}_lis_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_lis_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_lis_process_pkey PRIMARY KEY (lastupdateid);

{% endif %}

--
-- Name: messages_hl7_{{ hospital }}_rad_process messages_hl7_{{ hospital }}_rad_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_rad_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_rad_process_pkey PRIMARY KEY (lastupdateid);

{% if hospital == 'nuh' %}
--
-- Name: messages_hl7_{{ hospital }}_ecg_process messages_hl7_{{ hospital }}_ecg_process_pkey; Type: CONSTRAINT; Schema: public; Owner: hmsdba
--

ALTER TABLE ONLY public.messages_hl7_{{ hospital }}_ecg_process
    ADD CONSTRAINT messages_hl7_{{ hospital }}_ecg_process_pkey PRIMARY KEY (lastupdateid);
{% endif %}

{% if hospital == 'nuh' %}
--
-- Name: idx_563615_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_accession_no ON public.messages_hl7_nuh_adt USING btree (accession_no);

--
-- Name: idx_563615_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_event_type ON public.messages_hl7_nuh_adt USING btree (event_type);

--
-- Name: idx_563615_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_control_id ON public.messages_hl7_nuh_adt USING btree (msg_control_id);

--
-- Name: idx_563615_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_date_time ON public.messages_hl7_nuh_adt USING btree (msg_date_time);

--
-- Name: idx_563615_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_ext_id ON public.messages_hl7_nuh_adt USING btree (patient_ext_id);

--
-- Name: idx_563615_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_visit_id ON public.messages_hl7_nuh_adt USING btree (patient_visit_id);

--
-- Name: idx_563625_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_accession_no ON public.messages_hl7_nuh_adt_archive USING btree (accession_no);

--
-- Name: idx_563625_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_event_type ON public.messages_hl7_nuh_adt_archive USING btree (event_type);

--
-- Name: idx_563625_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_control_id ON public.messages_hl7_nuh_adt_archive USING btree (msg_control_id);

--
-- Name: idx_563625_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_date_time ON public.messages_hl7_nuh_adt_archive USING btree (msg_date_time);

--
-- Name: idx_563625_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_ext_id ON public.messages_hl7_nuh_adt_archive USING btree (patient_ext_id);

--
-- Name: idx_563625_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_visit_id ON public.messages_hl7_nuh_adt_archive USING btree (patient_visit_id);

--
-- Name: idx_563633_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563633_lastupdateid ON public.messages_hl7_nuh_adt_process USING btree (lastupdateid);

--
-- Name: idx_563615_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_accession_no ON public.messages_hl7_aih_adt USING btree (accession_no);

--
-- Name: idx_563615_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_event_type ON public.messages_hl7_aih_adt USING btree (event_type);

--
-- Name: idx_563615_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_control_id ON public.messages_hl7_aih_adt USING btree (msg_control_id);

--
-- Name: idx_563615_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_date_time ON public.messages_hl7_aih_adt USING btree (msg_date_time);

--
-- Name: idx_563615_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_ext_id ON public.messages_hl7_aih_adt USING btree (patient_ext_id);

--
-- Name: idx_563615_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_visit_id ON public.messages_hl7_aih_adt USING btree (patient_visit_id);

--
-- Name: idx_563625_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_accession_no ON public.messages_hl7_aih_adt_archive USING btree (accession_no);

--
-- Name: idx_563625_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_event_type ON public.messages_hl7_aih_adt_archive USING btree (event_type);

--
-- Name: idx_563625_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_control_id ON public.messages_hl7_aih_adt_archive USING btree (msg_control_id);

--
-- Name: idx_563625_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_date_time ON public.messages_hl7_aih_adt_archive USING btree (msg_date_time);

--
-- Name: idx_563625_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_ext_id ON public.messages_hl7_aih_adt_archive USING btree (patient_ext_id);

--
-- Name: idx_563625_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_visit_id ON public.messages_hl7_aih_adt_archive USING btree (patient_visit_id);

--
-- Name: idx_563633_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563633_lastupdateid ON public.messages_hl7_aih_adt_process USING btree (lastupdateid);

{% else %}
--
-- Name: idx_563615_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_accession_no ON public.messages_hl7_{{ hospital }}_adt USING btree (accession_no);


--
-- Name: idx_563615_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_event_type ON public.messages_hl7_{{ hospital }}_adt USING btree (event_type);


--
-- Name: idx_563615_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_control_id ON public.messages_hl7_{{ hospital }}_adt USING btree (msg_control_id);


--
-- Name: idx_563615_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_msg_date_time ON public.messages_hl7_{{ hospital }}_adt USING btree (msg_date_time);


--
-- Name: idx_563615_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_ext_id ON public.messages_hl7_{{ hospital }}_adt USING btree (patient_ext_id);


--
-- Name: idx_563615_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563615_patient_visit_id ON public.messages_hl7_{{ hospital }}_adt USING btree (patient_visit_id);


--
-- Name: idx_563625_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_accession_no ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (accession_no);


--
-- Name: idx_563625_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_event_type ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (event_type);


--
-- Name: idx_563625_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_control_id ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (msg_control_id);


--
-- Name: idx_563625_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_msg_date_time ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (msg_date_time);


--
-- Name: idx_563625_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_ext_id ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (patient_ext_id);


--
-- Name: idx_563625_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563625_patient_visit_id ON public.messages_hl7_{{ hospital }}_adt_archive USING btree (patient_visit_id);


--
-- Name: idx_563633_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563633_lastupdateid ON public.messages_hl7_{{ hospital }}_adt_process USING btree (lastupdateid);

{% endif %}
{% if hospital == 'ktph' %}
--
-- Name: idx_563638_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563638_lastupdateid ON public.messages_hl7_{{ hospital }}_bbr_lis_process USING btree (lastupdateid);


--
-- Name: idx_563643_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563643_lastupdateid ON public.messages_hl7_{{ hospital }}_bbr_rad_process USING btree (lastupdateid);
{% endif %}
{% if hospital == 'nuh' %}

--
-- Name: idx_563650_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_accession_no ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (accession_no);


--
-- Name: idx_563650_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_event_type ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (event_type);


--
-- Name: idx_563650_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (msg_control_id);


--
-- Name: idx_563650_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (msg_date_time);


--
-- Name: idx_563650_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (patient_ext_id);


--
-- Name: idx_563650_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_beaker USING btree (patient_visit_id);


--
-- Name: idx_563660_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_accession_no ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (accession_no);


--
-- Name: idx_563660_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_event_type ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (event_type);


--
-- Name: idx_563660_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (msg_control_id);


--
-- Name: idx_563660_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (msg_date_time);


--
-- Name: idx_563660_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (patient_ext_id);


--
-- Name: idx_563660_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_beaker_archive USING btree (patient_visit_id);

{% else %}
--
-- Name: idx_563650_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_accession_no ON public.messages_hl7_{{ hospital }}_lis USING btree (accession_no);


--
-- Name: idx_563650_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_event_type ON public.messages_hl7_{{ hospital }}_lis USING btree (event_type);


--
-- Name: idx_563650_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_msg_control_id ON public.messages_hl7_{{ hospital }}_lis USING btree (msg_control_id);


--
-- Name: idx_563650_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_msg_date_time ON public.messages_hl7_{{ hospital }}_lis USING btree (msg_date_time);


--
-- Name: idx_563650_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis USING btree (patient_ext_id);


--
-- Name: idx_563650_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563650_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis USING btree (patient_visit_id);


--
-- Name: idx_563660_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_accession_no ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (accession_no);


--
-- Name: idx_563660_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_event_type ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (event_type);


--
-- Name: idx_563660_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (msg_control_id);


--
-- Name: idx_563660_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (msg_date_time);


--
-- Name: idx_563660_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (patient_ext_id);


--
-- Name: idx_563660_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563660_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_archive USING btree (patient_visit_id);


--
-- Name: idx_563670_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_accession_no ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (accession_no);


--
-- Name: idx_563670_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_event_type ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (event_type);


--
-- Name: idx_563670_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (msg_control_id);


--
-- Name: idx_563670_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (msg_date_time);


--
-- Name: idx_563670_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (patient_ext_id);


--
-- Name: idx_563670_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563670_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_archive_crrdb USING btree (patient_visit_id);


--
-- Name: idx_563678_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_accession_no ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (accession_no);


--
-- Name: idx_563678_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_event_type ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (event_type);


--
-- Name: idx_563678_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (msg_control_id);


--
-- Name: idx_563678_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (msg_date_time);


--
-- Name: idx_563678_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (patient_ext_id);


--
-- Name: idx_563678_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563678_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_archive_hms USING btree (patient_visit_id);


--
-- Name: idx_563687_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_accession_no ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (accession_no);


--
-- Name: idx_563687_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_event_type ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (event_type);


--
-- Name: idx_563687_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (msg_control_id);


--
-- Name: idx_563687_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (msg_date_time);


--
-- Name: idx_563687_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (patient_ext_id);


--
-- Name: idx_563687_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563687_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_crrdb USING btree (patient_visit_id);


--
-- Name: idx_563697_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_accession_no ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (accession_no);


--
-- Name: idx_563697_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_event_type ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (event_type);


--
-- Name: idx_563697_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_msg_control_id ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (msg_control_id);


--
-- Name: idx_563697_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_msg_date_time ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (msg_date_time);


--
-- Name: idx_563697_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_patient_ext_id ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (patient_ext_id);


--
-- Name: idx_563697_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563697_patient_visit_id ON public.messages_hl7_{{ hospital }}_lis_hms USING btree (patient_visit_id);


--
-- Name: idx_563705_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563705_lastupdateid ON public.messages_hl7_{{ hospital }}_lis_process USING btree (lastupdateid);
{% endif %}

--
-- Name: idx_563710_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--
{% if hospital == 'ktph' %}
CREATE INDEX idx_563710_lastupdateid ON public.messages_hl7_{{ hospital }}_lis_process_crrdb USING btree (lastupdateid);


--
-- Name: idx_563715_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563715_lastupdateid ON public.messages_hl7_{{ hospital }}_lis_process_hms USING btree (lastupdateid);
{% endif %}

--
-- Name: idx_563722_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_accession_no ON public.messages_hl7_{{ hospital }}_rad USING btree (accession_no);


--
-- Name: idx_563722_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_event_type ON public.messages_hl7_{{ hospital }}_rad USING btree (event_type);


--
-- Name: idx_563722_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_msg_control_id ON public.messages_hl7_{{ hospital }}_rad USING btree (msg_control_id);


--
-- Name: idx_563722_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_msg_date_time ON public.messages_hl7_{{ hospital }}_rad USING btree (msg_date_time);


--
-- Name: idx_563722_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_patient_ext_id ON public.messages_hl7_{{ hospital }}_rad USING btree (patient_ext_id);


--
-- Name: idx_563722_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_patient_visit_id ON public.messages_hl7_{{ hospital }}_rad USING btree (patient_visit_id);


--
-- Name: idx_563732_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_accession_no ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (accession_no);


--
-- Name: idx_563732_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_event_type ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (event_type);


--
-- Name: idx_563732_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_msg_control_id ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (msg_control_id);


--
-- Name: idx_563732_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_msg_date_time ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (msg_date_time);


--
-- Name: idx_563732_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_patient_ext_id ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (patient_ext_id);


--
-- Name: idx_563732_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_patient_visit_id ON public.messages_hl7_{{ hospital }}_rad_archive USING btree (patient_visit_id);


--
-- Name: idx_563740_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563740_lastupdateid ON public.messages_hl7_{{ hospital }}_rad_process USING btree (lastupdateid);

{% if hospital == 'nuh' %}
--
-- Name: idx_563722_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_accession_no ON public.messages_hl7_{{ hospital }}_ecg USING btree (accession_no);

--
-- Name: idx_563722_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_event_type ON public.messages_hl7_{{ hospital }}_ecg USING btree (event_type);

--
-- Name: idx_563722_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_msg_control_id ON public.messages_hl7_{{ hospital }}_ecg USING btree (msg_control_id);

--
-- Name: idx_563722_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_msg_date_time ON public.messages_hl7_{{ hospital }}_ecg USING btree (msg_date_time);

--
-- Name: idx_563722_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_patient_ext_id ON public.messages_hl7_{{ hospital }}_ecg USING btree (patient_ext_id);

--
-- Name: idx_563722_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563722_patient_visit_id ON public.messages_hl7_{{ hospital }}_ecg USING btree (patient_visit_id);

--
-- Name: idx_563732_accession_no; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_accession_no ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (accession_no);

--
-- Name: idx_563732_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_event_type ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (event_type);

--
-- Name: idx_563732_msg_control_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_msg_control_id ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (msg_control_id);

--
-- Name: idx_563732_msg_date_time; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_msg_date_time ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (msg_date_time);

--
-- Name: idx_563732_patient_ext_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_patient_ext_id ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (patient_ext_id);

--
-- Name: idx_563732_patient_visit_id; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563732_patient_visit_id ON public.messages_hl7_{{ hospital }}_ecg_archive USING btree (patient_visit_id);

--
-- Name: idx_563740_lastupdateid; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563740_lastupdateid ON public.messages_hl7_{{ hospital }}_ecg_process USING btree (lastupdateid);

{% endif %}

--
-- Name: idx_563747_event_type; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563747_event_type ON public.messages_scm USING btree (event_type);


--
-- Name: idx_563755_channel; Type: INDEX; Schema: public; Owner: hmsdba
--

CREATE INDEX idx_563755_channel ON public.messages_watchdog USING btree (channel);


--
-- Name: Grant {{ pgsql_app_usr }}
--

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER ON ALL TABLES IN SCHEMA public TO {{ pgsql_app_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_app_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_dba_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_read_usr }};
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO {{ pgsql_app_usr }};
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO {{ pgsql_app_usr }};

{% if hospital == 'nuh' %}
--
-- Name: Insert data to public.messages_hl7_nuh_adt_process
--

INSERT INTO public.messages_hl7_nuh_adt_process VALUES ('0','now()');

--
-- Name: Insert data to public.messages_hl7_aih_adt_process
--

INSERT INTO public.messages_hl7_aih_adt_process VALUES ('0','now()');

{% else %}
--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_adt_process
--

INSERT INTO public.messages_hl7_{{ hospital }}_adt_process VALUES ('0','now()');

{% endif %}
--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_bbr_lis_process
--
{% if hospital == 'ktph' %}
INSERT INTO public.messages_hl7_{{ hospital }}_bbr_lis_process VALUES ('0','now()');

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_bbr_rad_process
--

INSERT INTO public.messages_hl7_{{ hospital }}_bbr_rad_process VALUES ('0','now()');
{% endif %}

{% if hospital == 'nuh' %}

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_lis_beaker_process
--

INSERT INTO public.messages_hl7_{{ hospital }}_lis_beaker_process VALUES ('0','now()');\

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_ecg_process
--

INSERT INTO public.messages_hl7_{{ hospital }}_ecg_process VALUES ('0','now()');

{% else %}
--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_lis_process
--

INSERT INTO public.messages_hl7_{{ hospital }}_lis_process VALUES ('0','now()');

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_lis_process_crrdb
--

{% endif %}

{% if hospital == 'ktph' %}
INSERT INTO public.messages_hl7_{{ hospital }}_lis_process_crrdb VALUES ('0','now()');

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_lis_process_hms
--

INSERT INTO public.messages_hl7_{{ hospital }}_lis_process_hms VALUES ('0','now()');

--
-- Name: Insert data to public.messages_hl7_{{ hospital }}_rad_process
--
{% endif %}

INSERT INTO public.messages_hl7_{{ hospital }}_rad_process VALUES ('0','now()');

--
-- PostgreSQL database dump complete
--