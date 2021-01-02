

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



ALTER TABLE public.clubs ENABLE TRIGGER ALL;


ALTER TABLE public.tournois DISABLE TRIGGER ALL;



ALTER TABLE public.tournois ENABLE TRIGGER ALL;


ALTER TABLE public.equipes DISABLE TRIGGER ALL;



ALTER TABLE public.equipes ENABLE TRIGGER ALL;


ALTER TABLE public.gymnases DISABLE TRIGGER ALL;



ALTER TABLE public.gymnases ENABLE TRIGGER ALL;


ALTER TABLE public.matchs DISABLE TRIGGER ALL;



ALTER TABLE public.matchs ENABLE TRIGGER ALL;


ALTER TABLE public.match_sets DISABLE TRIGGER ALL;



ALTER TABLE public.match_sets ENABLE TRIGGER ALL;


ALTER TABLE public.personnes DISABLE TRIGGER ALL;



ALTER TABLE public.personnes ENABLE TRIGGER ALL;


ALTER TABLE public.tournoi_branches DISABLE TRIGGER ALL;



ALTER TABLE public.tournoi_branches ENABLE TRIGGER ALL;


ALTER TABLE public.tournoi_phases DISABLE TRIGGER ALL;



ALTER TABLE public.tournoi_phases ENABLE TRIGGER ALL;


ALTER TABLE public.tournoi_poules DISABLE TRIGGER ALL;



ALTER TABLE public.tournoi_poules ENABLE TRIGGER ALL;


ALTER TABLE public.poule_equipes DISABLE TRIGGER ALL;



ALTER TABLE public.poule_equipes ENABLE TRIGGER ALL;


ALTER TABLE public.poule_matchs DISABLE TRIGGER ALL;



ALTER TABLE public.poule_matchs ENABLE TRIGGER ALL;


ALTER TABLE public.terrains DISABLE TRIGGER ALL;



ALTER TABLE public.terrains ENABLE TRIGGER ALL;


