PGDMP     6    !                |            premier_web_db %   12.18 (Ubuntu 12.18-0ubuntu0.20.04.1) %   12.18 (Ubuntu 12.18-0ubuntu0.20.04.1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17186    premier_web_db    DATABASE     x   CREATE DATABASE premier_web_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
    DROP DATABASE premier_web_db;
             	   web_admin    false            �            1259    17293    accreditations    TABLE     I  CREATE TABLE public.accreditations (
    id bigint NOT NULL,
    accreditation_title character varying NOT NULL,
    modality character varying NOT NULL,
    study_level character varying NOT NULL,
    program_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.accreditations;
       public         heap 	   web_admin    false            �            1259    17291    accreditations_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accreditations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accreditations_id_seq;
       public       	   web_admin    false    217            �           0    0    accreditations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accreditations_id_seq OWNED BY public.accreditations.id;
          public       	   web_admin    false    216            �            1259    17234    active_admin_comments    TABLE     V  CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 )   DROP TABLE public.active_admin_comments;
       public         heap 	   web_admin    false            �            1259    17232    active_admin_comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.active_admin_comments_id_seq;
       public       	   web_admin    false    207            �           0    0    active_admin_comments_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;
          public       	   web_admin    false    206            �            1259    17404    active_storage_attachments    TABLE       CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.active_storage_attachments;
       public         heap 	   web_admin    false            �            1259    17402 !   active_storage_attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.active_storage_attachments_id_seq;
       public       	   web_admin    false    235            �           0    0 !   active_storage_attachments_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;
          public       	   web_admin    false    234            �            1259    17392    active_storage_blobs    TABLE     F  CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.active_storage_blobs;
       public         heap 	   web_admin    false            �            1259    17390    active_storage_blobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.active_storage_blobs_id_seq;
       public       	   web_admin    false    233            �           0    0    active_storage_blobs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;
          public       	   web_admin    false    232            �            1259    17216    admin_users    TABLE     ^  CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    middle_name character varying,
    role character varying DEFAULT 'admin'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.admin_users;
       public         heap 	   web_admin    false            �            1259    17214    admin_users_id_seq    SEQUENCE     {   CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public       	   web_admin    false    205            �           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public       	   web_admin    false    204            �            1259    17370 
   admissions    TABLE     �  CREATE TABLE public.admissions (
    id bigint NOT NULL,
    admission_name character varying NOT NULL,
    how_to_apply text NOT NULL,
    required_document text NOT NULL,
    payment_process text NOT NULL,
    useful_information text,
    study_level character varying NOT NULL,
    modality character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    overview character varying
);
    DROP TABLE public.admissions;
       public         heap 	   web_admin    false            �            1259    17368    admissions_id_seq    SEQUENCE     z   CREATE SEQUENCE public.admissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admissions_id_seq;
       public       	   web_admin    false    229            �           0    0    admissions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admissions_id_seq OWNED BY public.admissions.id;
          public       	   web_admin    false    228            �            1259    17381    almunis    TABLE     �  CREATE TABLE public.almunis (
    id bigint NOT NULL,
    fullname character varying NOT NULL,
    sex character varying NOT NULL,
    phone_number character varying NOT NULL,
    modality character varying,
    study_level character varying,
    graduation_date timestamp without time zone,
    program_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    student_id character varying
);
    DROP TABLE public.almunis;
       public         heap 	   web_admin    false            �            1259    17379    almunis_id_seq    SEQUENCE     w   CREATE SEQUENCE public.almunis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.almunis_id_seq;
       public       	   web_admin    false    231            �           0    0    almunis_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.almunis_id_seq OWNED BY public.almunis.id;
          public       	   web_admin    false    230            �            1259    17195    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap 	   web_admin    false            �            1259    17441    branches    TABLE     i  CREATE TABLE public.branches (
    id bigint NOT NULL,
    location character varying,
    name character varying,
    phone_number integer,
    second_phone_number integer,
    email character varying,
    program_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    map character varying
);
    DROP TABLE public.branches;
       public         heap 	   web_admin    false            �            1259    17439    branches_id_seq    SEQUENCE     x   CREATE SEQUENCE public.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.branches_id_seq;
       public       	   web_admin    false    239            �           0    0    branches_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;
          public       	   web_admin    false    238            �            1259    17318    career_opportunities    TABLE     �   CREATE TABLE public.career_opportunities (
    id bigint NOT NULL,
    program_id bigint,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.career_opportunities;
       public         heap 	   web_admin    false            �            1259    17316    career_opportunities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.career_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.career_opportunities_id_seq;
       public       	   web_admin    false    221            �           0    0    career_opportunities_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.career_opportunities_id_seq OWNED BY public.career_opportunities.id;
          public       	   web_admin    false    220            �            1259    17248    colleges    TABLE        CREATE TABLE public.colleges (
    id bigint NOT NULL,
    college_name character varying NOT NULL,
    background text,
    mission text NOT NULL,
    vision text NOT NULL,
    overview text NOT NULL,
    establishment_date timestamp without time zone NOT NULL,
    student_enrolled integer NOT NULL,
    distance_center integer NOT NULL,
    number_of_prorgam integer NOT NULL,
    mandate text NOT NULL,
    history text NOT NULL,
    headquarter_address character varying NOT NULL,
    alternative_address character varying,
    sub_city character varying,
    state character varying,
    region character varying,
    zone character varying,
    worda character varying,
    city character varying,
    country character varying,
    phone_number character varying NOT NULL,
    alternative_phone_number character varying NOT NULL,
    email character varying NOT NULL,
    facebook_handle character varying,
    twitter_handle character varying,
    instagram_handle character varying,
    linkedin_handle character varying,
    map_embed character varying,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    video_link character varying
);
    DROP TABLE public.colleges;
       public         heap 	   web_admin    false            �            1259    17246    colleges_id_seq    SEQUENCE     x   CREATE SEQUENCE public.colleges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.colleges_id_seq;
       public       	   web_admin    false    209            �           0    0    colleges_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.colleges_id_seq OWNED BY public.colleges.id;
          public       	   web_admin    false    208            �            1259    17453    frequently_asked_questions    TABLE     �   CREATE TABLE public.frequently_asked_questions (
    id bigint NOT NULL,
    question text,
    answer text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.frequently_asked_questions;
       public         heap 	   web_admin    false            �            1259    17451 !   frequently_asked_questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.frequently_asked_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.frequently_asked_questions_id_seq;
       public       	   web_admin    false    241            �           0    0 !   frequently_asked_questions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.frequently_asked_questions_id_seq OWNED BY public.frequently_asked_questions.id;
          public       	   web_admin    false    240            �            1259    17423    friendly_id_slugs    TABLE     �   CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 %   DROP TABLE public.friendly_id_slugs;
       public         heap 	   web_admin    false            �            1259    17421    friendly_id_slugs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.friendly_id_slugs_id_seq;
       public       	   web_admin    false    237            �           0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;
          public       	   web_admin    false    236            �            1259    17481    how_tos    TABLE     $  CREATE TABLE public.how_tos (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    video_link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category character varying
);
    DROP TABLE public.how_tos;
       public         heap 	   web_admin    false            �            1259    17479    how_tos_id_seq    SEQUENCE     w   CREATE SEQUENCE public.how_tos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.how_tos_id_seq;
       public       	   web_admin    false    245            �           0    0    how_tos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.how_tos_id_seq OWNED BY public.how_tos.id;
          public       	   web_admin    false    244            �            1259    17347    marketing_sections    TABLE     _  CREATE TABLE public.marketing_sections (
    id bigint NOT NULL,
    headline_title character varying,
    description character varying,
    page_to_display character varying,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    action_title character varying
);
 &   DROP TABLE public.marketing_sections;
       public         heap 	   web_admin    false            �            1259    17345    marketing_sections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marketing_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.marketing_sections_id_seq;
       public       	   web_admin    false    225            �           0    0    marketing_sections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.marketing_sections_id_seq OWNED BY public.marketing_sections.id;
          public       	   web_admin    false    224            �            1259    17281    news    TABLE     e  CREATE TABLE public.news (
    id bigint NOT NULL,
    news_title character varying NOT NULL,
    overview character varying NOT NULL,
    body text,
    publish boolean DEFAULT false,
    published_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);
    DROP TABLE public.news;
       public         heap 	   web_admin    false            �            1259    17279    news_id_seq    SEQUENCE     t   CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public       	   web_admin    false    215            �           0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public       	   web_admin    false    214            �            1259    17305    programs    TABLE     K  CREATE TABLE public.programs (
    id bigint NOT NULL,
    program_name character varying NOT NULL,
    study_level character varying NOT NULL,
    modality character varying NOT NULL,
    overview text,
    program_description text,
    program_duration integer,
    total_tuition numeric DEFAULT 0.0,
    monthly_tuition numeric DEFAULT 0.0,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    credit_hour double precision
);
    DROP TABLE public.programs;
       public         heap 	   web_admin    false            �            1259    17303    programs_id_seq    SEQUENCE     x   CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.programs_id_seq;
       public       	   web_admin    false    219            �           0    0    programs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;
          public       	   web_admin    false    218            �            1259    17464    requests    TABLE     }  CREATE TABLE public.requests (
    id bigint NOT NULL,
    name_of_organization character varying,
    email character varying,
    phone_number character varying,
    student_fullname character varying,
    approve boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    track_number integer,
    almuni_id bigint
);
    DROP TABLE public.requests;
       public         heap 	   web_admin    false            �            1259    17462    requests_id_seq    SEQUENCE     x   CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.requests_id_seq;
       public       	   web_admin    false    243            �           0    0    requests_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;
          public       	   web_admin    false    242            �            1259    17187    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap 	   web_admin    false            �            1259    17330    section_headlines    TABLE     z  CREATE TABLE public.section_headlines (
    id bigint NOT NULL,
    college_id bigint,
    gallery_headline character varying,
    service_headline character varying,
    accreditation character varying,
    testimonial_headline character varying,
    home_page_video_embed character varying DEFAULT 'https://www.youtube.com/embed/Sxuk-tbnNtE'::character varying,
    home_page_carousel_headline character varying DEFAULT 'YIC Started online masters Registration'::character varying,
    home_page_carousel_description character varying DEFAULT 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'::character varying,
    primary_cta_action character varying DEFAULT '#'::character varying,
    secondary_cta_action character varying DEFAULT 'about_path'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 %   DROP TABLE public.section_headlines;
       public         heap 	   web_admin    false            �            1259    17328    section_headlines_id_seq    SEQUENCE     �   CREATE SEQUENCE public.section_headlines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.section_headlines_id_seq;
       public       	   web_admin    false    223            �           0    0    section_headlines_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.section_headlines_id_seq OWNED BY public.section_headlines.id;
          public       	   web_admin    false    222            �            1259    17270    services    TABLE       CREATE TABLE public.services (
    id bigint NOT NULL,
    service_name character varying NOT NULL,
    service_overview character varying NOT NULL,
    details text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.services;
       public         heap 	   web_admin    false            �            1259    17268    services_id_seq    SEQUENCE     x   CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.services_id_seq;
       public       	   web_admin    false    213            �           0    0    services_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;
          public       	   web_admin    false    212            �            1259    17259    staffs    TABLE       CREATE TABLE public.staffs (
    id bigint NOT NULL,
    fullname character varying NOT NULL,
    message character varying,
    job_title character varying NOT NULL,
    office_name character varying,
    major_responsibilities text,
    offices_that_answerable_to text,
    office_address character varying,
    office_phone_number character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);
    DROP TABLE public.staffs;
       public         heap 	   web_admin    false            �            1259    17257    staffs_id_seq    SEQUENCE     v   CREATE SEQUENCE public.staffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.staffs_id_seq;
       public       	   web_admin    false    211            �           0    0    staffs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.staffs_id_seq OWNED BY public.staffs.id;
          public       	   web_admin    false    210            �            1259    17492    steps    TABLE     &  CREATE TABLE public.steps (
    id bigint NOT NULL,
    step_name character varying,
    step_description character varying,
    step_video_link character varying,
    how_to_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.steps;
       public         heap 	   web_admin    false            �            1259    17490    steps_id_seq    SEQUENCE     u   CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.steps_id_seq;
       public       	   web_admin    false    247            �           0    0    steps_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;
          public       	   web_admin    false    246            �            1259    17521    training_modules    TABLE     �   CREATE TABLE public.training_modules (
    id bigint NOT NULL,
    title character varying,
    training_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 $   DROP TABLE public.training_modules;
       public         heap 	   web_admin    false            �            1259    17519    training_modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.training_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.training_modules_id_seq;
       public       	   web_admin    false    251            �           0    0    training_modules_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.training_modules_id_seq OWNED BY public.training_modules.id;
          public       	   web_admin    false    250            �            1259    17509 	   trainings    TABLE     �  CREATE TABLE public.trainings (
    id bigint NOT NULL,
    title character varying NOT NULL,
    overview character varying NOT NULL,
    description character varying NOT NULL,
    duration integer,
    total_tuition numeric DEFAULT 0.0,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.trainings;
       public         heap 	   web_admin    false            �            1259    17507    trainings_id_seq    SEQUENCE     y   CREATE SEQUENCE public.trainings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.trainings_id_seq;
       public       	   web_admin    false    249            �           0    0    trainings_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.trainings_id_seq OWNED BY public.trainings.id;
          public       	   web_admin    false    248            �            1259    17533 	   vacancies    TABLE     ?  CREATE TABLE public.vacancies (
    id bigint NOT NULL,
    admin_user_id bigint,
    title character varying NOT NULL,
    description text NOT NULL,
    deadline timestamp without time zone NOT NULL,
    salary character varying,
    number_of_employee character varying,
    catagory character varying,
    career_level character varying,
    employment_type character varying,
    requirement text,
    organization_name character varying,
    website character varying,
    email character varying,
    city character varying,
    subcity character varying,
    address_1 character varying NOT NULL,
    address_2 character varying,
    phone_number_1 character varying NOT NULL,
    phone_number_2 character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.vacancies;
       public         heap 	   web_admin    false            �            1259    17531    vacancies_id_seq    SEQUENCE     y   CREATE SEQUENCE public.vacancies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.vacancies_id_seq;
       public       	   web_admin    false    253            �           0    0    vacancies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;
          public       	   web_admin    false    252            �            1259    17358    visitor_comments    TABLE     �  CREATE TABLE public.visitor_comments (
    id bigint NOT NULL,
    fullname character varying NOT NULL,
    category character varying NOT NULL,
    subject character varying NOT NULL,
    message text NOT NULL,
    email character varying,
    phone_number character varying,
    display_on_home_page boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    main_testimonial boolean
);
 $   DROP TABLE public.visitor_comments;
       public         heap 	   web_admin    false            �            1259    17356    visitor_comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visitor_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.visitor_comments_id_seq;
       public       	   web_admin    false    227            �           0    0    visitor_comments_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.visitor_comments_id_seq OWNED BY public.visitor_comments.id;
          public       	   web_admin    false    226            �           2604    17296    accreditations id    DEFAULT     v   ALTER TABLE ONLY public.accreditations ALTER COLUMN id SET DEFAULT nextval('public.accreditations_id_seq'::regclass);
 @   ALTER TABLE public.accreditations ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    217    216    217            �           2604    17237    active_admin_comments id    DEFAULT     �   ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);
 G   ALTER TABLE public.active_admin_comments ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    207    206    207            �           2604    17407    active_storage_attachments id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);
 L   ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    235    234    235            �           2604    17395    active_storage_blobs id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);
 F   ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    232    233    233            �           2604    17219    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    205    204    205            �           2604    17373    admissions id    DEFAULT     n   ALTER TABLE ONLY public.admissions ALTER COLUMN id SET DEFAULT nextval('public.admissions_id_seq'::regclass);
 <   ALTER TABLE public.admissions ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    228    229    229            �           2604    17384 
   almunis id    DEFAULT     h   ALTER TABLE ONLY public.almunis ALTER COLUMN id SET DEFAULT nextval('public.almunis_id_seq'::regclass);
 9   ALTER TABLE public.almunis ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    230    231    231            �           2604    17444    branches id    DEFAULT     j   ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);
 :   ALTER TABLE public.branches ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    239    238    239            �           2604    17321    career_opportunities id    DEFAULT     �   ALTER TABLE ONLY public.career_opportunities ALTER COLUMN id SET DEFAULT nextval('public.career_opportunities_id_seq'::regclass);
 F   ALTER TABLE public.career_opportunities ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    220    221    221            �           2604    17251    colleges id    DEFAULT     j   ALTER TABLE ONLY public.colleges ALTER COLUMN id SET DEFAULT nextval('public.colleges_id_seq'::regclass);
 :   ALTER TABLE public.colleges ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    209    208    209            �           2604    17456    frequently_asked_questions id    DEFAULT     �   ALTER TABLE ONLY public.frequently_asked_questions ALTER COLUMN id SET DEFAULT nextval('public.frequently_asked_questions_id_seq'::regclass);
 L   ALTER TABLE public.frequently_asked_questions ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    240    241    241            �           2604    17426    friendly_id_slugs id    DEFAULT     |   ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);
 C   ALTER TABLE public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    237    236    237            �           2604    17484 
   how_tos id    DEFAULT     h   ALTER TABLE ONLY public.how_tos ALTER COLUMN id SET DEFAULT nextval('public.how_tos_id_seq'::regclass);
 9   ALTER TABLE public.how_tos ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    245    244    245            �           2604    17350    marketing_sections id    DEFAULT     ~   ALTER TABLE ONLY public.marketing_sections ALTER COLUMN id SET DEFAULT nextval('public.marketing_sections_id_seq'::regclass);
 D   ALTER TABLE public.marketing_sections ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    225    224    225            �           2604    17284    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    215    214    215            �           2604    17308    programs id    DEFAULT     j   ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);
 :   ALTER TABLE public.programs ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    218    219    219            �           2604    17467    requests id    DEFAULT     j   ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);
 :   ALTER TABLE public.requests ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    242    243    243            �           2604    17333    section_headlines id    DEFAULT     |   ALTER TABLE ONLY public.section_headlines ALTER COLUMN id SET DEFAULT nextval('public.section_headlines_id_seq'::regclass);
 C   ALTER TABLE public.section_headlines ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    222    223    223            �           2604    17273    services id    DEFAULT     j   ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);
 :   ALTER TABLE public.services ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    212    213    213            �           2604    17262 	   staffs id    DEFAULT     f   ALTER TABLE ONLY public.staffs ALTER COLUMN id SET DEFAULT nextval('public.staffs_id_seq'::regclass);
 8   ALTER TABLE public.staffs ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    211    210    211            �           2604    17495    steps id    DEFAULT     d   ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);
 7   ALTER TABLE public.steps ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    246    247    247            �           2604    17524    training_modules id    DEFAULT     z   ALTER TABLE ONLY public.training_modules ALTER COLUMN id SET DEFAULT nextval('public.training_modules_id_seq'::regclass);
 B   ALTER TABLE public.training_modules ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    250    251    251            �           2604    17512    trainings id    DEFAULT     l   ALTER TABLE ONLY public.trainings ALTER COLUMN id SET DEFAULT nextval('public.trainings_id_seq'::regclass);
 ;   ALTER TABLE public.trainings ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    248    249    249            �           2604    17536    vacancies id    DEFAULT     l   ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);
 ;   ALTER TABLE public.vacancies ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    253    252    253            �           2604    17361    visitor_comments id    DEFAULT     z   ALTER TABLE ONLY public.visitor_comments ALTER COLUMN id SET DEFAULT nextval('public.visitor_comments_id_seq'::regclass);
 B   ALTER TABLE public.visitor_comments ALTER COLUMN id DROP DEFAULT;
       public       	   web_admin    false    226    227    227            �          0    17293    accreditations 
   TABLE DATA           |   COPY public.accreditations (id, accreditation_title, modality, study_level, program_id, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    217   �      �          0    17234    active_admin_comments 
   TABLE DATA           �   COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    207   �      �          0    17404    active_storage_attachments 
   TABLE DATA           k   COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
    public       	   web_admin    false    235   �      �          0    17392    active_storage_blobs 
   TABLE DATA           z   COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
    public       	   web_admin    false    233   �      �          0    17216    admin_users 
   TABLE DATA           "  COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, first_name, last_name, middle_name, role, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    205   c!      �          0    17370 
   admissions 
   TABLE DATA           �   COPY public.admissions (id, admission_name, how_to_apply, required_document, payment_process, useful_information, study_level, modality, created_at, updated_at, slug, overview) FROM stdin;
    public       	   web_admin    false    229   ."      �          0    17381    almunis 
   TABLE DATA           �   COPY public.almunis (id, fullname, sex, phone_number, modality, study_level, graduation_date, program_name, created_at, updated_at, slug, student_id) FROM stdin;
    public       	   web_admin    false    231   �+      �          0    17195    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    203   �+      �          0    17441    branches 
   TABLE DATA           �   COPY public.branches (id, location, name, phone_number, second_phone_number, email, program_id, created_at, updated_at, map) FROM stdin;
    public       	   web_admin    false    239   3,      �          0    17318    career_opportunities 
   TABLE DATA           ]   COPY public.career_opportunities (id, program_id, title, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    221   P,      �          0    17248    colleges 
   TABLE DATA           �  COPY public.colleges (id, college_name, background, mission, vision, overview, establishment_date, student_enrolled, distance_center, number_of_prorgam, mandate, history, headquarter_address, alternative_address, sub_city, state, region, zone, worda, city, country, phone_number, alternative_phone_number, email, facebook_handle, twitter_handle, instagram_handle, linkedin_handle, map_embed, created_by, last_updated_by, created_at, updated_at, video_link) FROM stdin;
    public       	   web_admin    false    209   .      �          0    17453    frequently_asked_questions 
   TABLE DATA           b   COPY public.frequently_asked_questions (id, question, answer, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    241   3      �          0    17423    friendly_id_slugs 
   TABLE DATA           f   COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    public       	   web_admin    false    237   63      �          0    17481    how_tos 
   TABLE DATA           g   COPY public.how_tos (id, title, description, video_link, created_at, updated_at, category) FROM stdin;
    public       	   web_admin    false    245   S3      �          0    17347    marketing_sections 
   TABLE DATA           �   COPY public.marketing_sections (id, headline_title, description, page_to_display, action, created_at, updated_at, action_title) FROM stdin;
    public       	   web_admin    false    225   %4      �          0    17281    news 
   TABLE DATA           s   COPY public.news (id, news_title, overview, body, publish, published_by, created_at, updated_at, slug) FROM stdin;
    public       	   web_admin    false    215   t5      �          0    17305    programs 
   TABLE DATA           �   COPY public.programs (id, program_name, study_level, modality, overview, program_description, program_duration, total_tuition, monthly_tuition, created_by, last_updated_by, created_at, updated_at, slug, credit_hour) FROM stdin;
    public       	   web_admin    false    219   t6      �          0    17464    requests 
   TABLE DATA           �   COPY public.requests (id, name_of_organization, email, phone_number, student_fullname, approve, created_at, updated_at, track_number, almuni_id) FROM stdin;
    public       	   web_admin    false    243   �=      �          0    17187    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public       	   web_admin    false    202   �=      �          0    17330    section_headlines 
   TABLE DATA             COPY public.section_headlines (id, college_id, gallery_headline, service_headline, accreditation, testimonial_headline, home_page_video_embed, home_page_carousel_headline, home_page_carousel_description, primary_cta_action, secondary_cta_action, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    223   u>      �          0    17270    services 
   TABLE DATA           g   COPY public.services (id, service_name, service_overview, details, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    213   �>      �          0    17259    staffs 
   TABLE DATA           �   COPY public.staffs (id, fullname, message, job_title, office_name, major_responsibilities, offices_that_answerable_to, office_address, office_phone_number, email, created_at, updated_at, slug) FROM stdin;
    public       	   web_admin    false    211   �>      �          0    17492    steps 
   TABLE DATA           t   COPY public.steps (id, step_name, step_description, step_video_link, how_to_id, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    247   �>      �          0    17521    training_modules 
   TABLE DATA           Z   COPY public.training_modules (id, title, training_id, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    251   �>      �          0    17509 	   trainings 
   TABLE DATA           �   COPY public.trainings (id, title, overview, description, duration, total_tuition, created_by, last_updated_by, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    249   ?      �          0    17533 	   vacancies 
   TABLE DATA           &  COPY public.vacancies (id, admin_user_id, title, description, deadline, salary, number_of_employee, catagory, career_level, employment_type, requirement, organization_name, website, email, city, subcity, address_1, address_2, phone_number_1, phone_number_2, created_at, updated_at) FROM stdin;
    public       	   web_admin    false    253   #?      �          0    17358    visitor_comments 
   TABLE DATA           �   COPY public.visitor_comments (id, fullname, category, subject, message, email, phone_number, display_on_home_page, created_at, updated_at, main_testimonial) FROM stdin;
    public       	   web_admin    false    227   @?      �           0    0    accreditations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.accreditations_id_seq', 3, true);
          public       	   web_admin    false    216            �           0    0    active_admin_comments_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);
          public       	   web_admin    false    206            �           0    0 !   active_storage_attachments_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 21, true);
          public       	   web_admin    false    234            �           0    0    active_storage_blobs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 22, true);
          public       	   web_admin    false    232            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public       	   web_admin    false    204            �           0    0    admissions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.admissions_id_seq', 1, true);
          public       	   web_admin    false    228            �           0    0    almunis_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.almunis_id_seq', 1, false);
          public       	   web_admin    false    230            �           0    0    branches_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.branches_id_seq', 1, false);
          public       	   web_admin    false    238            �           0    0    career_opportunities_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.career_opportunities_id_seq', 15, true);
          public       	   web_admin    false    220            �           0    0    colleges_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.colleges_id_seq', 2, true);
          public       	   web_admin    false    208            �           0    0 !   frequently_asked_questions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.frequently_asked_questions_id_seq', 1, false);
          public       	   web_admin    false    240            �           0    0    friendly_id_slugs_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);
          public       	   web_admin    false    236            �           0    0    how_tos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.how_tos_id_seq', 1, true);
          public       	   web_admin    false    244            �           0    0    marketing_sections_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.marketing_sections_id_seq', 5, true);
          public       	   web_admin    false    224            �           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 1, true);
          public       	   web_admin    false    214            �           0    0    programs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.programs_id_seq', 3, true);
          public       	   web_admin    false    218            �           0    0    requests_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.requests_id_seq', 1, false);
          public       	   web_admin    false    242            �           0    0    section_headlines_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.section_headlines_id_seq', 1, false);
          public       	   web_admin    false    222            �           0    0    services_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.services_id_seq', 1, false);
          public       	   web_admin    false    212            �           0    0    staffs_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.staffs_id_seq', 1, false);
          public       	   web_admin    false    210                        0    0    steps_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.steps_id_seq', 1, false);
          public       	   web_admin    false    246                       0    0    training_modules_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.training_modules_id_seq', 1, false);
          public       	   web_admin    false    250                       0    0    trainings_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.trainings_id_seq', 1, false);
          public       	   web_admin    false    248                       0    0    vacancies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.vacancies_id_seq', 1, false);
          public       	   web_admin    false    252                       0    0    visitor_comments_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.visitor_comments_id_seq', 12, true);
          public       	   web_admin    false    226            �           2606    17301 "   accreditations accreditations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accreditations
    ADD CONSTRAINT accreditations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accreditations DROP CONSTRAINT accreditations_pkey;
       public         	   web_admin    false    217            �           2606    17242 0   active_admin_comments active_admin_comments_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.active_admin_comments DROP CONSTRAINT active_admin_comments_pkey;
       public         	   web_admin    false    207            �           2606    17412 :   active_storage_attachments active_storage_attachments_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
       public         	   web_admin    false    235            �           2606    17400 .   active_storage_blobs active_storage_blobs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
       public         	   web_admin    false    233            �           2606    17228    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public         	   web_admin    false    205            �           2606    17378    admissions admissions_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.admissions DROP CONSTRAINT admissions_pkey;
       public         	   web_admin    false    229            �           2606    17389    almunis almunis_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.almunis
    ADD CONSTRAINT almunis_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.almunis DROP CONSTRAINT almunis_pkey;
       public         	   web_admin    false    231            �           2606    17202 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         	   web_admin    false    203                       2606    17449    branches branches_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_pkey;
       public         	   web_admin    false    239            �           2606    17326 .   career_opportunities career_opportunities_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.career_opportunities
    ADD CONSTRAINT career_opportunities_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.career_opportunities DROP CONSTRAINT career_opportunities_pkey;
       public         	   web_admin    false    221            �           2606    17256    colleges colleges_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.colleges
    ADD CONSTRAINT colleges_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.colleges DROP CONSTRAINT colleges_pkey;
       public         	   web_admin    false    209                       2606    17461 :   frequently_asked_questions frequently_asked_questions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.frequently_asked_questions
    ADD CONSTRAINT frequently_asked_questions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.frequently_asked_questions DROP CONSTRAINT frequently_asked_questions_pkey;
       public         	   web_admin    false    241            �           2606    17431 (   friendly_id_slugs friendly_id_slugs_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       public         	   web_admin    false    237            	           2606    17489    how_tos how_tos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.how_tos
    ADD CONSTRAINT how_tos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.how_tos DROP CONSTRAINT how_tos_pkey;
       public         	   web_admin    false    245            �           2606    17355 *   marketing_sections marketing_sections_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.marketing_sections
    ADD CONSTRAINT marketing_sections_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.marketing_sections DROP CONSTRAINT marketing_sections_pkey;
       public         	   web_admin    false    225            �           2606    17290    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public         	   web_admin    false    215            �           2606    17315    programs programs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.programs DROP CONSTRAINT programs_pkey;
       public         	   web_admin    false    219                       2606    17472    requests requests_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_pkey;
       public         	   web_admin    false    243            �           2606    17194 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         	   web_admin    false    202            �           2606    17343 (   section_headlines section_headlines_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.section_headlines
    ADD CONSTRAINT section_headlines_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.section_headlines DROP CONSTRAINT section_headlines_pkey;
       public         	   web_admin    false    223            �           2606    17278    services services_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public         	   web_admin    false    213            �           2606    17267    staffs staffs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.staffs DROP CONSTRAINT staffs_pkey;
       public         	   web_admin    false    211                       2606    17500    steps steps_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.steps DROP CONSTRAINT steps_pkey;
       public         	   web_admin    false    247                       2606    17529 &   training_modules training_modules_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.training_modules
    ADD CONSTRAINT training_modules_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.training_modules DROP CONSTRAINT training_modules_pkey;
       public         	   web_admin    false    251                       2606    17518    trainings trainings_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.trainings DROP CONSTRAINT trainings_pkey;
       public         	   web_admin    false    249                       2606    17541    vacancies vacancies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.vacancies DROP CONSTRAINT vacancies_pkey;
       public         	   web_admin    false    253            �           2606    17367 &   visitor_comments visitor_comments_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.visitor_comments
    ADD CONSTRAINT visitor_comments_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.visitor_comments DROP CONSTRAINT visitor_comments_pkey;
       public         	   web_admin    false    227            �           1259    17302 "   index_accreditations_on_program_id    INDEX     c   CREATE INDEX index_accreditations_on_program_id ON public.accreditations USING btree (program_id);
 6   DROP INDEX public.index_accreditations_on_program_id;
       public         	   web_admin    false    217            �           1259    17244 8   index_active_admin_comments_on_author_type_and_author_id    INDEX     �   CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);
 L   DROP INDEX public.index_active_admin_comments_on_author_type_and_author_id;
       public         	   web_admin    false    207    207            �           1259    17245 (   index_active_admin_comments_on_namespace    INDEX     o   CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);
 <   DROP INDEX public.index_active_admin_comments_on_namespace;
       public         	   web_admin    false    207            �           1259    17243 <   index_active_admin_comments_on_resource_type_and_resource_id    INDEX     �   CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);
 P   DROP INDEX public.index_active_admin_comments_on_resource_type_and_resource_id;
       public         	   web_admin    false    207    207            �           1259    17418 +   index_active_storage_attachments_on_blob_id    INDEX     u   CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_on_blob_id;
       public         	   web_admin    false    235            �           1259    17419 +   index_active_storage_attachments_uniqueness    INDEX     �   CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_uniqueness;
       public         	   web_admin    false    235    235    235    235            �           1259    17401 !   index_active_storage_blobs_on_key    INDEX     h   CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);
 5   DROP INDEX public.index_active_storage_blobs_on_key;
       public         	   web_admin    false    233            �           1259    17230    index_admin_users_on_email    INDEX     Z   CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);
 .   DROP INDEX public.index_admin_users_on_email;
       public         	   web_admin    false    205            �           1259    17231 )   index_admin_users_on_reset_password_token    INDEX     x   CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);
 =   DROP INDEX public.index_admin_users_on_reset_password_token;
       public         	   web_admin    false    205            �           1259    17229    index_admin_users_on_role    INDEX     Q   CREATE INDEX index_admin_users_on_role ON public.admin_users USING btree (role);
 -   DROP INDEX public.index_admin_users_on_role;
       public         	   web_admin    false    205            �           1259    17436    index_admissions_on_slug    INDEX     V   CREATE UNIQUE INDEX index_admissions_on_slug ON public.admissions USING btree (slug);
 ,   DROP INDEX public.index_admissions_on_slug;
       public         	   web_admin    false    229            �           1259    17438    index_almunis_on_slug    INDEX     P   CREATE UNIQUE INDEX index_almunis_on_slug ON public.almunis USING btree (slug);
 )   DROP INDEX public.index_almunis_on_slug;
       public         	   web_admin    false    231                       1259    17450    index_branches_on_program_id    INDEX     W   CREATE INDEX index_branches_on_program_id ON public.branches USING btree (program_id);
 0   DROP INDEX public.index_branches_on_program_id;
       public         	   web_admin    false    239            �           1259    17327 (   index_career_opportunities_on_program_id    INDEX     o   CREATE INDEX index_career_opportunities_on_program_id ON public.career_opportunities USING btree (program_id);
 <   DROP INDEX public.index_career_opportunities_on_program_id;
       public         	   web_admin    false    221            �           1259    17433 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX     �   CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);
 F   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type;
       public         	   web_admin    false    237    237            �           1259    17434 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 P   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       public         	   web_admin    false    237    237    237            �           1259    17432 :   index_friendly_id_slugs_on_sluggable_type_and_sluggable_id    INDEX     �   CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);
 N   DROP INDEX public.index_friendly_id_slugs_on_sluggable_type_and_sluggable_id;
       public         	   web_admin    false    237    237            �           1259    17420    index_news_on_slug    INDEX     J   CREATE UNIQUE INDEX index_news_on_slug ON public.news USING btree (slug);
 &   DROP INDEX public.index_news_on_slug;
       public         	   web_admin    false    215            �           1259    17437    index_programs_on_slug    INDEX     R   CREATE UNIQUE INDEX index_programs_on_slug ON public.programs USING btree (slug);
 *   DROP INDEX public.index_programs_on_slug;
       public         	   web_admin    false    219                       1259    17473    index_requests_on_almuni_id    INDEX     U   CREATE INDEX index_requests_on_almuni_id ON public.requests USING btree (almuni_id);
 /   DROP INDEX public.index_requests_on_almuni_id;
       public         	   web_admin    false    243            �           1259    17344 %   index_section_headlines_on_college_id    INDEX     i   CREATE INDEX index_section_headlines_on_college_id ON public.section_headlines USING btree (college_id);
 9   DROP INDEX public.index_section_headlines_on_college_id;
       public         	   web_admin    false    223            �           1259    17435    index_staffs_on_slug    INDEX     N   CREATE UNIQUE INDEX index_staffs_on_slug ON public.staffs USING btree (slug);
 (   DROP INDEX public.index_staffs_on_slug;
       public         	   web_admin    false    211            
           1259    17506    index_steps_on_how_to_id    INDEX     O   CREATE INDEX index_steps_on_how_to_id ON public.steps USING btree (how_to_id);
 ,   DROP INDEX public.index_steps_on_how_to_id;
       public         	   web_admin    false    247                       1259    17530 %   index_training_modules_on_training_id    INDEX     i   CREATE INDEX index_training_modules_on_training_id ON public.training_modules USING btree (training_id);
 9   DROP INDEX public.index_training_modules_on_training_id;
       public         	   web_admin    false    251                       1259    17547     index_vacancies_on_admin_user_id    INDEX     _   CREATE INDEX index_vacancies_on_admin_user_id ON public.vacancies USING btree (admin_user_id);
 4   DROP INDEX public.index_vacancies_on_admin_user_id;
       public         	   web_admin    false    253                       1259    17549    index_vacancies_on_catagory    INDEX     U   CREATE INDEX index_vacancies_on_catagory ON public.vacancies USING btree (catagory);
 /   DROP INDEX public.index_vacancies_on_catagory;
       public         	   web_admin    false    253                       1259    17548    index_vacancies_on_title    INDEX     O   CREATE INDEX index_vacancies_on_title ON public.vacancies USING btree (title);
 ,   DROP INDEX public.index_vacancies_on_title;
       public         	   web_admin    false    253                       2606    17474    requests fk_rails_1a1edfcde1    FK CONSTRAINT        ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_rails_1a1edfcde1 FOREIGN KEY (almuni_id) REFERENCES public.almunis(id);
 F   ALTER TABLE ONLY public.requests DROP CONSTRAINT fk_rails_1a1edfcde1;
       public       	   web_admin    false    243    231    3058                       2606    17542    vacancies fk_rails_36f2c4c366    FK CONSTRAINT     �   ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT fk_rails_36f2c4c366 FOREIGN KEY (admin_user_id) REFERENCES public.admin_users(id);
 G   ALTER TABLE ONLY public.vacancies DROP CONSTRAINT fk_rails_36f2c4c366;
       public       	   web_admin    false    3019    253    205                       2606    17501    steps fk_rails_4eed1f81ea    FK CONSTRAINT     |   ALTER TABLE ONLY public.steps
    ADD CONSTRAINT fk_rails_4eed1f81ea FOREIGN KEY (how_to_id) REFERENCES public.how_tos(id);
 C   ALTER TABLE ONLY public.steps DROP CONSTRAINT fk_rails_4eed1f81ea;
       public       	   web_admin    false    247    245    3081                       2606    17413 .   active_storage_attachments fk_rails_c3b3935057    FK CONSTRAINT     �   ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);
 X   ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT fk_rails_c3b3935057;
       public       	   web_admin    false    3061    235    233            �   �   x�u�A� @�5��(� ���5� n��T�����[��O�W�Da�\�����؜ô�Jl`
��{�/�+�`Ft�Jm����jw)̴P������4 ��q�%;ne�J��S,5����	��u��(��_��K�F~      �      x������ � �      �   �   x����n1�g�)x��l��I�n�C�J��8������+*��<�?~�N�u���g H�ȾC�(m��B�Fr�
��n�������=:��B:�2��Q��@@�HwXL,BF�ׂJm���V��zR�i�#|��W���6��I<j<C?˸��~���g_��<�3|����1>>�6���{ ���F�9z��{ �-��V0&�m�17kvu�      �   �  x���[��6�g�SD�Ԫ"�klG��΄�C �4���I�HX����n��;�S�#�O���s��1ʪ�j"�5�A2��Mw���!�w"�Qd#b��&:]�����:RY��ZE��<�? ��x��U>���N���޹븈�?1�@�AԄ����%cP�{�i�ϓj�xz�������׼��5u��JYI�p$���t0����|7]��d>،���>Z�~w�D$�+qI�1)1�.�",ŀ��qQ?�v����_!�NUi���W��Rź��u���������[ab��~�K�@�	b9\���{Kv�"<�G�:H�:�Z�B�!��A2y����糾���ٶ��r4��Bv��S(�ޑc<�^�m��'���q��]� �HP	��ǤO�v���h�������T�7\��ܖ��R�@.GA��H��&����מxÂ�,���@�v���d�m٢F��d��}}��&G��%F@�H�����o޹Ο��?k�C��1�610,�s��n�ފ��3�|Qi~�9,�Y�"��u�uv='�K~u ����LB�m��:�'Չ�l�����0�{�%��ȸ��I];�����������f����l��D\`B��Az:l���ٞg��ӟE؁�eۄKa`�W=���=I[�`����F$�[bԁ��Lb*��-�0�����      �   �   x�u��
�0���S��kÿ�I��J�T*^��6b�}{Wa.���|Y�-7�:w���"�<@
J��'.=+G�.�if�nq���)�����v���6�fՊH�/c��G	�B�CR>h�e%	U���,%26 
4Jbb$�DԿ�z+N�b�yӣ�C��G��XҒ2�.h�ƛK���cP<�      �   �	  x��Y�n��v���6�h%�?�Qpb�k�v�u�rC�P�3�,ɑ2{��(�����$��!g4��m��@�?3$��w�s==xoJm���v>��,Gb��tJx+���E(d�mD!WJd�R"Xa��s����o�,uh�U�d2hk�B�i�~��'��\*��Chre�a}Y�5VB\��/�g�hʲ%1reu.�iE��5e�ʋu��pj�}PN��x#��(���ڱ2;�F�C�[���J�ʒE���P;K�ވ�B�ȤE�xB�m����Z�K'+޾�&��u��w��x����9~-t=>ژ%ǟµӃ0�!�)�S5�,)�YS�����J@j��kZ���S�rAß2�����!�hk\m�Z�ܹ"�N��)Zé�R����[*��X
Qh/~(�
#Fo2&zQ�܇�EG��Ĺїd�R�7�p�yo2�q�SXp�Y�1���_u����9��Hd��y��/��1v���?ļ	aK6}n�K��A��R�4��I��h�����[:�ҏ\����K_̭ty��\���-P+89�h���??���� �.-9����t�S�ԸFoPI��
��^���8AO�m�zs�uFlQ7����h�k�J�$�<�������&�k���߆���~��?~��U-b6���� ��Pg��W��
��j$j�9��NgH���/�X�H�� �R\d�m`C�$Ò� �7����d «��k�˞"��}V�E�J<��Mf$����
�=��gV�Ё �"-A����f
��PB��h�"M�DV��@t�NO�ǌPޝt�t7oI�@�C�{�9��&��M+F��[�f���i�4~��+�.	�l`�8:ϖ�N��7?�`��b�9��^E֡\��-g�����>�S�n�C~V��6Wĕ�
 �ҵCz�Bc��9�$z���l:7����[#�����!�"����-��} 6�r��-�*�!�=��P�'B��4���QK�?�Ad$Թ�s��?�i.��l]���h�J�J�Gz�ѻ#�Xk�>J��C ��J�������#֌DR;VC㫾�t��`�ɵ��`��i���FB�������9�ދ�e�~��B<d����"���uie*q�|~��bߩ�)��G;�p���:��gx���E�Yc�@m�ɎM�H ኡr�B���n�h�hM%�N� �xX!K.�&U�H�W��N�'i�R���,zZ���-7"�w@[�M@Ĳ\`@ÝpM��G{{M}p:�N����%3r��'Ӳ*.#]I%6N��B�Ֆ���4C��w7Y�J���e�޽�z��n29~3;>9ysz:���ᴋy�4Z������734�&�y����1@�e�3șN^�9=۩bo�$�c�D�§���HjݻwG�
������0����N'ԾSm��a���ώ{Q��D��}��	:GʈƋ�K��:���^�:
K���Mn�ȝr��K�|�o�{�:�Pz�G7*+u�-
^THxS�@��t�S�>�uA�1v8��6���i�Jj(hVUm748���'H���n:�g%���e���b�u:�L�\�ش��Z+�4���������F�����聇����qA��Gxf�'��u����T;�r?y��ߘ:�v��ao�����,Yk��+Ӹ��]�SN�~4�*l�=��r�~�&�/���9˧�k_�z,����s]�M�πL|v�:�͐Y�`Ib�w:d��]w���k/�3.�]�g����!X�Xv�4ب��"vAKb@�w�3�fDg�>�	�jA�V}�uk��t:��=�Þ�AC�z�	 J�A"�\�З.>����d�q.�hzΟ4��ۦ�+w�]Sv�{RE��Te���ĺ��I�M]��Ã��G���yK�bQ���ҡ=]�u��R����x�}� (l�Vi*ݻ
!��u4��R6*�1��ڸ��ƜR+��I�(ںǑX�J�mliNc	����;=x��(�Nt|w�	J�K�J�رz?ŧ��W�ke=�Ș�2�ɚo�T	�	lx����h��]��(*Ĭ$I�w��r��d+1��
�������(ȞxI{���<�P��?\��y�{N��f��jrm�V�q�W1�@î����/�{_������X�D��B�l� �.,��=cͷ����A��\����� o���m����g��.�Tܐ��ȱ�D��N��x�t�*�x �B6,ȷ.�}�@2&^΢�㚯��O���o����梊.�A��Ź�t�]m�P�� h�ܑ�P�7�Y��n8��2�A3t�{0��^���^N��Ώ�����LN''���_�N���|rz�j6>=;=�w�_|�x��_��9      �      x������ � �      �   ?   x�K�+�,���M�+�,(�O)M.����4202�50�50T04�26�24�3	������� ԍ�      �      x������ � �      �   �  x����n� @��+����ŀ��4i�E�v�e7h�4�=J���v�jZgg���Ox����诎~v��R�g\�8pF�uLt��A	���i
�Ё��R�!eO6=�ч�>�`{�.�-kv�({?e\��.��WK.�D�5#���5ş�8��V�@�"-�}�����F^-p&v�H�����w\�L���*���1���WU��X�z^��t�s��}��厱�k��;� C߼X�R|I���}���.��#�����ON7�iX��ѧs)��f3�D`��Ҏ�tϗ��е��Ԩ�� �TM�>��BS\�>ЫM>N��i�c�Z�R2��۹���jS��Q#4H\��6�p�(�� s���Ί������C�A��Ŧq�'L�����" ���b��Z�o�vJ�݆�B�D�ׄ�?��+      �   �  x��U�n�F}��b^Z$�.�l���i�Dm��h�K�`I�ȭ�]fw)����YR�մ�keX���̙3���F��׶���$���E���d;G>t��I��ZǭrL��6�Q�7�"K�ӻxF︶mC�r�Y���s�4���<����B�#dF;er�����(y�|`R���R������.Ǝq�pA���C�5�W��s��|�	�c:���g(����RG��
P]Q�@��|1I�>��־�IЪ+;F8�������I�N��w�r~xh�WU#���WV��Ԉ֡Ҷ�jB�����n6�|L�>uюfi�YSk�T:Ut�uߛY_YƁ]C�)m�)�s^��Bj��(�i��N��'~R�^�*���\k�$(�w��� �����~@r[�;S�;f+I~���k����������������Ǟ�������*�=[߯�K��U.�8T�(�#��р/Hуy��w��������A�lc�gw�V�GO.�s�O��Ur��gw�����e�|�[���?�.�@ǥ��R������T@�՘��&B�qz3N�i�X.n�i���yr۾��^~�8:P�ށ��8�v߃�)ܩ�c�\�N31��9m��V뗫�B������B�) m�E)���H�7���M��|�{���gh�����g���@yV�2�2��Z�f���P�7�Õ#��0$H�#P縆JKF_����ƚ��*G���Z��fY���DU}��Pg���8?�����%�)��r|����B�| ��0}!�#QNW̴)�E���i�u�A�mcE��!���TZ[�V/�2�3�����{�z��}i�9���Gg+<�C���W��ݱj�������u;�{O �"�հ��e�
�q��{��@AR^R��x��l�
i�U��J{N���c�%�+�LL�� �l���Ӛ��v˔C+������^���c(o���}5M6]�p�w9zy,g�����l���v0��E��+>u�ń��[�_�t�F�'Z(f��#�1F���;����I�ڪ��j�Wz�<٭��>�n��ݤ׋������j�^B����~w�e��&�*��/���~?٨�3k�T2Řl@�I[�?��{������j>���Ӌ���a�:D�8����.�tr_pW�C�ޢ�G��N����*�p0-%{�:t��W슋q:ϰ+Η����j2�<�\�G��<���rq.GW����<9�crvv�7ES�      �      x������ � �      �      x������ � �      �   �   x�u���0D��+N�Tm)XX٘�X�bT��Dq
���!��Y��Ks�/$��ű����8o������$�;� Iѷ�
V<)P~G��a��r�}��
����:¢q����(�s�t W������K��zI�f��b��:c�}͚(hnLUT��X/��b_���&��u���]]lL���gY��^�      �   ?  x�œ=k�0�g�W��-�?d�1��!�tpJ�R(j|���:W����Ђ����{N����lWO��~�ܯ7�w�m^a�ʜg��1@ZI�p ��� tV|]
�R@Gh/}
��R��;il�h����s��{�g2*gNA%:��U�N�+����G󆡝�ndGP����\(i���P�m��]���Ɉ����ċ&�/���ǳy�C˪R-dtv����j�`V8g�YE�=�[	ǲr�,Cy�i��8Ix��C�>���P�DY$&J=���8�obt�z1�h1�KYג�`fu�8���5�ͼ1�u�̳      �   �   x�m�AK�@��ɯ����j[�4�B�{�d���f7l&��{7�������1*yi6U��,(�]��ۖ[r#�G@'�A<�?�&�d�Q�ZO��1&`�	�߾���}@v�T�t>����W��a��s�{�֒!�p�� ������G�0���-��c�Õ?J���B`�Hv�yg��^��DyI$Iʢ|�
��%���z^�U�T�e��_R��"i2�}`֤�<M�_C�p�      �      x��WMo�8=;���m۰;MsK�`{셦Fk�TIɉ����/;)��!�m����͛�z� CC^�\|j�����*muh�l����ˬ�;X���%�7o�w��ߋ�;\��lģ�J�Ο�*H� �P��=�d�>�p��p)��K�h��������|$�S8�&�'ݔBfGiN����=�
�C2#J�mL�i3��B+є�ز���k�Ma)��޵���г����R읿v1Á�|��Q{g+�����(��0�љ�]k��~=�i9�A�-Z�AT�����ȵ���Քp�)�JZ�)��#�9 �ZF������"����!b�����de
��Ҍ�<�������<�H
��^�ִ�W��p���(�i��c��j�&���?q��<���qO�� 2h�6�sB�O �����&�霒����1Q8Um�\
��oo<�w��
%�Ms�e-�rJ8��dYp }�9z%��5u��$���y�1~�qr�M��,���F�U*m�ɠ"�ѿF�e�9�
�C����X�)�3:�qub$���'��>�J"���e��(�'ք�M���(��SO�Ŏ��kC4`H�[·�l3�mW��r5�lv�O�x�6��~ܬ6׋��b������n�]ޮn����v��-6+�Yݭ7w��r����mgUԦ�p���d!��)̮o�6�{L5��YY#��꽼 �{|xS���7���?�r%V�w�KZK�uГ�\�$jt%��L�m(����@A�w���:#Z�T�����@�*��eθ"R�q���=Z����@�HG�1�X�X_�֌����h�:
'�&��e���S�Ǉ��v>�^JC9 �X��F^���@�3��Y��kﹸ/t�g3.���+�D���g;Ƽ�a���d��b*&B2��4U��LE�ؒ��-�j�iu�<��B6�٨��)���;�%ސ��!%��T�Ro^aݠ;������-P�����n�[~���l?³��gŏ`��z�	�ĀXdT`�,�]�%Cf������s/^;�֧�?/���<�B�j�<��Qgt!1���[Sb:Y�M�o<=^�ј�/o�J�k0�}�a�oZ'΂UpR�_�KԾ[��S(��Fv����x��gw�&>ƨ�➡�`�,�G��,M8�
��`���:��҆�z�v��e�9E�����N8�,���DH_&�ڥ��Y�{�?���R�F�b�pZ�0�l"���ݤ����WPޙ��Ŧ�]���+M.ux��ǬU���h�b���B�X��FA�2-Ubod(D�$X!�%5�jŸ*'�1Q~�_�=|��>v�á�X��nĞ�Ka)�� � [K9ra�̖Ns����@�?��w��Ҟ�$�y@#jl�N\X�]�͇� ��U|���#�ak�i�*mZ��A|�6U̠�: �yG �M����85�t�c�����թW�~���$����C���u$v~\*�9�	��v�s����Lgx�@���R,T��&�q��5��VÑ�	��	;����.�4)����k��Q���o��R_��[��o�/j��G��SQe�����o6���v�Fk$
������Ecl�~�kb�?Z��lЅs������ݺ=r��QC<�1F�����Q�p�ټ�6��c ��ne�"ʴ�d}�f�O�a���F�{��!:�Y�ֵQ2C����ƍ�����C{����vus9��q�\mnv���3�~��������p#O      �      x������ � �      �   �   x�U���0л�)DR�g��?G���<�%#4f��!5V�C�z
�cU��2�:>*gT��+/v��f[��=D����cE�l^I�}w��ԍ���g�ݫ�8��1xJ�[f��A��.͛���?�μ,޹e�C�S�݆P(0n���*ǽK̜GعbP8X������}_�_�r���&��վ�����r�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �     x��XM��F=ӿ�rH���h~J"/�8A���cg c����%�-��t�#떟����K�))��Z90<�,������H��e�qM?�~P;��T?��:��G3Z�t3(;�Oj��}�=�t���0U>���/��]ܽ��U�DI:��Y�P4/����p��,=�{�,	ި��gz��z,?h����Z�4�ʴ-�9�zy��|�)7��&xmv�3c[�ތ��ScjYՎV�t4��Xkv/�U�';�4���� "�[+�m�^��2֧�0�a�74ڑ@��Fr�vt�\�==h%K;�w���l5H�����mq3@0=�t�Zя�cr��p��+_�g`�7W�FO�"�C���jZfߒY�B{���PN{V��Y]�~=5�Ο.�"\E�:�n.��5rX@.�Y�y��"^��f�=.W+�j$I��hA`�\�/�UL��ԠM_�[3 Ш�.������;��㏏�3�%��2��d��υ��4�it�-��;��?�j�	ܪ��G��Y�󢌋0�ҴX��Rv�t�p˪j��v��$r��\G�$�8.�y�fa����\�rq]+��d�ͩ���׸��U�A����j��k�#�����\U�87���>aC��}���C���y����
'��G���Az�ތ���%L=U�#��2횽�4��=nU<	{��f�V\5�@B�'�\����!Ե�롡$�hv�1ɖ��]�z�/�jE�.|�N.Q5Z`�^t�d�oB�����k����H�{)x�Za ���	�ᰟ�x��~/sC�o�;Π���?�����G���i�Ѡв�ɤ������v���F�+1�'�2�vj��9�ܳU�A� 5� ��Q&������?l���W�E���~gl�DG�_�J��ʪ�i��?߮N�>���*��n���AF��x�r��%�w��왁�Ի�W��kr�agf2��F�j�J�������/D�~i��r%
r��V���֕ϟ����/
�FK�+Q��¡��a�5b�x�2��'����.㤦Ǎ���~��������o��k�CEq�-:t����7c�-̓N�����F��3�f+&üF"`�����P��u��H'|c�U�����E0�M�x�).�$*�$ĥ��8���ک���F�[HG�\���G-�����,x�m:PG�>E�͢xa��x'��2_�y��"��rإ�^�V����9����/&bЭ5 ��,�)���䝼ZI��b�X���`��)��	x�fJ�8EG���./�ί{����G����K�X^�yRfY-�,K΅0���
?0>����]k|�x�a����c�~��9��=��!=�p�.���"�R�3����_�
C��Q�&%�� T�n�8x��k"R��ր��V�S��M�a4O��c�K!�����{�g���^�鞔�S�
�{�E-�s!)�?�=��^�w�^j�y�ǵ��8�.k,��B����tcZ���xI��e�ݲ(Y&g" t>{���j��     