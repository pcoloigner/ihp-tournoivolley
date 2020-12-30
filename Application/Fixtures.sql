

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.clubs DISABLE TRIGGER ALL;

INSERT INTO public.clubs (id, nom, nom_entier) VALUES ('f646e3b6-333b-4e19-b6b8-73f96a1b9d85', 'ELAN', 'Elan de Chevilly-Larue');


ALTER TABLE public.clubs ENABLE TRIGGER ALL;


