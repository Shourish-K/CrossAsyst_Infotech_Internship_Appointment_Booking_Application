PGDMP     '    ;                 z            appointmentDB    13.3    13.3 |    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    57565    appointmentDB    DATABASE     k   CREATE DATABASE "appointmentDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE "appointmentDB";
                postgres    false            �            1259    57566    address    TABLE     {  CREATE TABLE public.address (
    address_id bigint NOT NULL,
    address1 character varying(256) NOT NULL,
    address2 character varying(100),
    street character varying(50) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(20) NOT NULL,
    zip_code integer NOT NULL,
    latitude numeric(10,8) NOT NULL,
    longitude numeric(11,8) NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    57569    appointment    TABLE     �  CREATE TABLE public.appointment (
    appointment_id bigint NOT NULL,
    patient_id bigint NOT NULL,
    appointment_slot_id bigint NOT NULL,
    status character varying(30) NOT NULL,
    created_ts timestamp(6) without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    updated_ts timestamp(6) without time zone,
    updated_by character varying(20),
    appointment_reference_id bigint
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    57572    appointment_slot    TABLE     {  CREATE TABLE public.appointment_slot (
    provider_id bigint NOT NULL,
    appointment_type_id bigint NOT NULL,
    location_id bigint NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    slot_date date NOT NULL,
    open_slots integer NOT NULL,
    total_slots integer NOT NULL,
    appointment_slot_id bigint NOT NULL
);
 $   DROP TABLE public.appointment_slot;
       public         heap    postgres    false            �            1259    57575    appointment_type    TABLE     �   CREATE TABLE public.appointment_type (
    appointment_type_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    practice_id bigint NOT NULL
);
 $   DROP TABLE public.appointment_type;
       public         heap    postgres    false            �            1259    82316    appointmentslot_id    SEQUENCE     {   CREATE SEQUENCE public.appointmentslot_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.appointmentslot_id;
       public          postgres    false    202            a           0    0    appointmentslot_id    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.appointmentslot_id OWNED BY public.appointment_slot.appointment_slot_id;
          public          postgres    false    219            �            1259    82318    appointmenttype_id    SEQUENCE     {   CREATE SEQUENCE public.appointmenttype_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.appointmenttype_id;
       public          postgres    false    203            b           0    0    appointmenttype_id    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.appointmenttype_id OWNED BY public.appointment_type.appointment_type_id;
          public          postgres    false    220            �            1259    57578    contact    TABLE     �   CREATE TABLE public.contact (
    contact_id bigint NOT NULL,
    value character varying(50) NOT NULL,
    type character varying(30) NOT NULL
);
    DROP TABLE public.contact;
       public         heap    postgres    false            �            1259    82320    contact_seq_id    SEQUENCE     w   CREATE SEQUENCE public.contact_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.contact_seq_id;
       public          postgres    false    204            c           0    0    contact_seq_id    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.contact_seq_id OWNED BY public.contact.contact_id;
          public          postgres    false    221            �            1259    57581    location    TABLE     �   CREATE TABLE public.location (
    name character varying(20) NOT NULL,
    location_id bigint NOT NULL,
    address_id bigint NOT NULL,
    practice_id bigint NOT NULL
);
    DROP TABLE public.location;
       public         heap    postgres    false            �            1259    57584    location_contact    TABLE     �   CREATE TABLE public.location_contact (
    location_id bigint NOT NULL,
    contact_id bigint NOT NULL,
    active boolean NOT NULL,
    location_contact_id bigint NOT NULL
);
 $   DROP TABLE public.location_contact;
       public         heap    postgres    false            �            1259    82324    location_contact_seq_id    SEQUENCE     �   CREATE SEQUENCE public.location_contact_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.location_contact_seq_id;
       public          postgres    false    206            d           0    0    location_contact_seq_id    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.location_contact_seq_id OWNED BY public.location_contact.location_contact_id;
          public          postgres    false    223            �            1259    82322    location_seq_id    SEQUENCE     x   CREATE SEQUENCE public.location_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.location_seq_id;
       public          postgres    false    205            e           0    0    location_seq_id    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.location_seq_id OWNED BY public.location.location_id;
          public          postgres    false    222            �            1259    57587    patient    TABLE       CREATE TABLE public.patient (
    patient_id bigint NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    gender character varying(30) NOT NULL,
    marital_status character varying(30) NOT NULL,
    email text
);
    DROP TABLE public.patient;
       public         heap    postgres    false            �            1259    57590    patient_address    TABLE     ]  CREATE TABLE public.patient_address (
    address1 character varying(20) NOT NULL,
    address2 character varying(50),
    street character varying(20) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(20) NOT NULL,
    zip_code bigint NOT NULL,
    patient_id bigint NOT NULL,
    patient_address_id bigint NOT NULL
);
 #   DROP TABLE public.patient_address;
       public         heap    postgres    false            �            1259    82328    patient_address_seq_id    SEQUENCE        CREATE SEQUENCE public.patient_address_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.patient_address_seq_id;
       public          postgres    false    208            f           0    0    patient_address_seq_id    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.patient_address_seq_id OWNED BY public.patient_address.patient_address_id;
          public          postgres    false    225            �            1259    57593    patient_contact    TABLE     �   CREATE TABLE public.patient_contact (
    contact_id bigint NOT NULL,
    patient_id bigint NOT NULL,
    patient_contact_id bigint NOT NULL
);
 #   DROP TABLE public.patient_contact;
       public         heap    postgres    false            �            1259    82330    patient_contact_seq_id    SEQUENCE        CREATE SEQUENCE public.patient_contact_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.patient_contact_seq_id;
       public          postgres    false    209            g           0    0    patient_contact_seq_id    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.patient_contact_seq_id OWNED BY public.patient_contact.patient_contact_id;
          public          postgres    false    226            �            1259    82326    patient_seq_id    SEQUENCE     w   CREATE SEQUENCE public.patient_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.patient_seq_id;
       public          postgres    false    207            h           0    0    patient_seq_id    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.patient_seq_id OWNED BY public.patient.patient_id;
          public          postgres    false    224            �            1259    57596    practice    TABLE     k   CREATE TABLE public.practice (
    practice_id bigint NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.practice;
       public         heap    postgres    false            �            1259    57599    practice_contact    TABLE     �   CREATE TABLE public.practice_contact (
    practice_contact_id bigint NOT NULL,
    practice_id bigint NOT NULL,
    contact_id bigint NOT NULL,
    active boolean NOT NULL
);
 $   DROP TABLE public.practice_contact;
       public         heap    postgres    false            �            1259    82334    practice_contact_seq_id    SEQUENCE     �   CREATE SEQUENCE public.practice_contact_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.practice_contact_seq_id;
       public          postgres    false    211            i           0    0    practice_contact_seq_id    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.practice_contact_seq_id OWNED BY public.practice_contact.practice_contact_id;
          public          postgres    false    228            �            1259    82332    practice_seq_id    SEQUENCE     x   CREATE SEQUENCE public.practice_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.practice_seq_id;
       public          postgres    false    210            j           0    0    practice_seq_id    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.practice_seq_id OWNED BY public.practice.practice_id;
          public          postgres    false    227            �            1259    57602    provider    TABLE       CREATE TABLE public.provider (
    provider_id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(50) NOT NULL,
    year_of_experience integer NOT NULL,
    rating integer NOT NULL,
    npi numeric(10,0) NOT NULL
);
    DROP TABLE public.provider;
       public         heap    postgres    false            �            1259    57605    provider_qualification    TABLE     �   CREATE TABLE public.provider_qualification (
    provider_id bigint NOT NULL,
    qualification_id integer NOT NULL,
    provider_qualification_id bigint NOT NULL
);
 *   DROP TABLE public.provider_qualification;
       public         heap    postgres    false            �            1259    82338    provider_qualification_seq_id    SEQUENCE     �   CREATE SEQUENCE public.provider_qualification_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.provider_qualification_seq_id;
       public          postgres    false    213            k           0    0    provider_qualification_seq_id    SEQUENCE OWNED BY     v   ALTER SEQUENCE public.provider_qualification_seq_id OWNED BY public.provider_qualification.provider_qualification_id;
          public          postgres    false    230            �            1259    82336    provider_seq_id    SEQUENCE     x   CREATE SEQUENCE public.provider_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.provider_seq_id;
       public          postgres    false    212            l           0    0    provider_seq_id    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.provider_seq_id OWNED BY public.provider.provider_id;
          public          postgres    false    229            �            1259    57608    provider_specialty    TABLE     �   CREATE TABLE public.provider_specialty (
    provider_id bigint NOT NULL,
    specialty_id bigint NOT NULL,
    provider_specialty_id bigint NOT NULL
);
 &   DROP TABLE public.provider_specialty;
       public         heap    postgres    false            �            1259    82340    provider_specialty_seq_id    SEQUENCE     �   CREATE SEQUENCE public.provider_specialty_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.provider_specialty_seq_id;
       public          postgres    false    214            m           0    0    provider_specialty_seq_id    SEQUENCE OWNED BY     j   ALTER SEQUENCE public.provider_specialty_seq_id OWNED BY public.provider_specialty.provider_specialty_id;
          public          postgres    false    231            �            1259    57611    qualification    TABLE     v   CREATE TABLE public.qualification (
    qualification_id integer NOT NULL,
    name character varying(30) NOT NULL
);
 !   DROP TABLE public.qualification;
       public         heap    postgres    false            �            1259    82342    qualification_seq_id    SEQUENCE     }   CREATE SEQUENCE public.qualification_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.qualification_seq_id;
       public          postgres    false    215            n           0    0    qualification_seq_id    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.qualification_seq_id OWNED BY public.qualification.qualification_id;
          public          postgres    false    232            �            1259    82312    seq_address_id    SEQUENCE     w   CREATE SEQUENCE public.seq_address_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.seq_address_id;
       public          postgres    false    200            o           0    0    seq_address_id    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.seq_address_id OWNED BY public.address.address_id;
          public          postgres    false    217            �            1259    82314    seq_appointment_id    SEQUENCE     {   CREATE SEQUENCE public.seq_appointment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.seq_appointment_id;
       public          postgres    false    201            p           0    0    seq_appointment_id    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.seq_appointment_id OWNED BY public.appointment.appointment_id;
          public          postgres    false    218            �            1259    57614 	   specialty    TABLE     m   CREATE TABLE public.specialty (
    specialty_id bigint NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.specialty;
       public         heap    postgres    false            �            1259    82346    specialty_seq_id    SEQUENCE     y   CREATE SEQUENCE public.specialty_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.specialty_seq_id;
       public          postgres    false    216            q           0    0    specialty_seq_id    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.specialty_seq_id OWNED BY public.specialty.specialty_id;
          public          postgres    false    233            9          0    57566    address 
   TABLE DATA           u   COPY public.address (address_id, address1, address2, street, city, state, zip_code, latitude, longitude) FROM stdin;
    public          postgres    false    200   ��       :          0    57569    appointment 
   TABLE DATA           �   COPY public.appointment (appointment_id, patient_id, appointment_slot_id, status, created_ts, created_by, updated_ts, updated_by, appointment_reference_id) FROM stdin;
    public          postgres    false    201   ,�       ;          0    57572    appointment_slot 
   TABLE DATA           �   COPY public.appointment_slot (provider_id, appointment_type_id, location_id, start_time, end_time, slot_date, open_slots, total_slots, appointment_slot_id) FROM stdin;
    public          postgres    false    202   G�       <          0    57575    appointment_type 
   TABLE DATA           R   COPY public.appointment_type (appointment_type_id, name, practice_id) FROM stdin;
    public          postgres    false    203   ��       =          0    57578    contact 
   TABLE DATA           :   COPY public.contact (contact_id, value, type) FROM stdin;
    public          postgres    false    204   ��       >          0    57581    location 
   TABLE DATA           N   COPY public.location (name, location_id, address_id, practice_id) FROM stdin;
    public          postgres    false    205   Ϡ       ?          0    57584    location_contact 
   TABLE DATA           `   COPY public.location_contact (location_id, contact_id, active, location_contact_id) FROM stdin;
    public          postgres    false    206   /�       @          0    57587    patient 
   TABLE DATA           c   COPY public.patient (patient_id, first_name, last_name, gender, marital_status, email) FROM stdin;
    public          postgres    false    207   ��       A          0    57590    patient_address 
   TABLE DATA           |   COPY public.patient_address (address1, address2, street, city, state, zip_code, patient_id, patient_address_id) FROM stdin;
    public          postgres    false    208   �       B          0    57593    patient_contact 
   TABLE DATA           U   COPY public.patient_contact (contact_id, patient_id, patient_contact_id) FROM stdin;
    public          postgres    false    209   ��       C          0    57596    practice 
   TABLE DATA           5   COPY public.practice (practice_id, name) FROM stdin;
    public          postgres    false    210   �       D          0    57599    practice_contact 
   TABLE DATA           `   COPY public.practice_contact (practice_contact_id, practice_id, contact_id, active) FROM stdin;
    public          postgres    false    211   o�       E          0    57602    provider 
   TABLE DATA           g   COPY public.provider (provider_id, first_name, last_name, year_of_experience, rating, npi) FROM stdin;
    public          postgres    false    212   ͣ       F          0    57605    provider_qualification 
   TABLE DATA           j   COPY public.provider_qualification (provider_id, qualification_id, provider_qualification_id) FROM stdin;
    public          postgres    false    213   l�       G          0    57608    provider_specialty 
   TABLE DATA           ^   COPY public.provider_specialty (provider_id, specialty_id, provider_specialty_id) FROM stdin;
    public          postgres    false    214   ��       H          0    57611    qualification 
   TABLE DATA           ?   COPY public.qualification (qualification_id, name) FROM stdin;
    public          postgres    false    215    �       I          0    57614 	   specialty 
   TABLE DATA           7   COPY public.specialty (specialty_id, name) FROM stdin;
    public          postgres    false    216   M�       r           0    0    appointmentslot_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.appointmentslot_id', 1, false);
          public          postgres    false    219            s           0    0    appointmenttype_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.appointmenttype_id', 1, false);
          public          postgres    false    220            t           0    0    contact_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.contact_seq_id', 1, false);
          public          postgres    false    221            u           0    0    location_contact_seq_id    SEQUENCE SET     F   SELECT pg_catalog.setval('public.location_contact_seq_id', 1, false);
          public          postgres    false    223            v           0    0    location_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.location_seq_id', 1, false);
          public          postgres    false    222            w           0    0    patient_address_seq_id    SEQUENCE SET     E   SELECT pg_catalog.setval('public.patient_address_seq_id', 1, false);
          public          postgres    false    225            x           0    0    patient_contact_seq_id    SEQUENCE SET     E   SELECT pg_catalog.setval('public.patient_contact_seq_id', 1, false);
          public          postgres    false    226            y           0    0    patient_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.patient_seq_id', 1, false);
          public          postgres    false    224            z           0    0    practice_contact_seq_id    SEQUENCE SET     F   SELECT pg_catalog.setval('public.practice_contact_seq_id', 1, false);
          public          postgres    false    228            {           0    0    practice_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.practice_seq_id', 1, false);
          public          postgres    false    227            |           0    0    provider_qualification_seq_id    SEQUENCE SET     L   SELECT pg_catalog.setval('public.provider_qualification_seq_id', 1, false);
          public          postgres    false    230            }           0    0    provider_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.provider_seq_id', 1, false);
          public          postgres    false    229            ~           0    0    provider_specialty_seq_id    SEQUENCE SET     H   SELECT pg_catalog.setval('public.provider_specialty_seq_id', 1, false);
          public          postgres    false    231                       0    0    qualification_seq_id    SEQUENCE SET     C   SELECT pg_catalog.setval('public.qualification_seq_id', 1, false);
          public          postgres    false    232            �           0    0    seq_address_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.seq_address_id', 1, false);
          public          postgres    false    217            �           0    0    seq_appointment_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.seq_appointment_id', 52, true);
          public          postgres    false    218            �           0    0    specialty_seq_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.specialty_seq_id', 1, false);
          public          postgres    false    233            �           2606    57631    address address_constraints 
   CONSTRAINT     a   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_constraints PRIMARY KEY (address_id);
 E   ALTER TABLE ONLY public.address DROP CONSTRAINT address_constraints;
       public            postgres    false    200            �           2606    57649 &   appointment appointment_pk_constraints 
   CONSTRAINT     p   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pk_constraints PRIMARY KEY (appointment_id);
 P   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_pk_constraints;
       public            postgres    false    201            �           2606    57656 -   appointment_slot appointment_slot_constraints 
   CONSTRAINT     |   ALTER TABLE ONLY public.appointment_slot
    ADD CONSTRAINT appointment_slot_constraints PRIMARY KEY (appointment_slot_id);
 W   ALTER TABLE ONLY public.appointment_slot DROP CONSTRAINT appointment_slot_constraints;
       public            postgres    false    202            �           2606    57624 0   appointment_type appointment_type_pk_constraints 
   CONSTRAINT        ALTER TABLE ONLY public.appointment_type
    ADD CONSTRAINT appointment_type_pk_constraints PRIMARY KEY (appointment_type_id);
 Z   ALTER TABLE ONLY public.appointment_type DROP CONSTRAINT appointment_type_pk_constraints;
       public            postgres    false    203            �           2606    57673    contact contact_constraints 
   CONSTRAINT     a   ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_constraints PRIMARY KEY (contact_id);
 E   ALTER TABLE ONLY public.contact DROP CONSTRAINT contact_constraints;
       public            postgres    false    204            �           2606    57675 0   location_contact location_contact_pk_constraints 
   CONSTRAINT        ALTER TABLE ONLY public.location_contact
    ADD CONSTRAINT location_contact_pk_constraints PRIMARY KEY (location_contact_id);
 Z   ALTER TABLE ONLY public.location_contact DROP CONSTRAINT location_contact_pk_constraints;
       public            postgres    false    206            �           2606    57633     location location_pk_constraints 
   CONSTRAINT     g   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pk_constraints PRIMARY KEY (location_id);
 J   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pk_constraints;
       public            postgres    false    205            �           2606    57687 .   patient_address patient_address_pk_constraints 
   CONSTRAINT     |   ALTER TABLE ONLY public.patient_address
    ADD CONSTRAINT patient_address_pk_constraints PRIMARY KEY (patient_address_id);
 X   ALTER TABLE ONLY public.patient_address DROP CONSTRAINT patient_address_pk_constraints;
       public            postgres    false    208            �           2606    57689 .   patient_contact patient_contact_pk_constraints 
   CONSTRAINT     |   ALTER TABLE ONLY public.patient_contact
    ADD CONSTRAINT patient_contact_pk_constraints PRIMARY KEY (patient_contact_id);
 X   ALTER TABLE ONLY public.patient_contact DROP CONSTRAINT patient_contact_pk_constraints;
       public            postgres    false    209            �           2606    57647    patient patient_pk_constraints 
   CONSTRAINT     d   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pk_constraints PRIMARY KEY (patient_id);
 H   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_pk_constraints;
       public            postgres    false    207            �           2606    57701 0   practice_contact practice_contact_pk_constraints 
   CONSTRAINT        ALTER TABLE ONLY public.practice_contact
    ADD CONSTRAINT practice_contact_pk_constraints PRIMARY KEY (practice_contact_id);
 Z   ALTER TABLE ONLY public.practice_contact DROP CONSTRAINT practice_contact_pk_constraints;
       public            postgres    false    211            �           2606    57622     practice practice_pk_constraints 
   CONSTRAINT     g   ALTER TABLE ONLY public.practice
    ADD CONSTRAINT practice_pk_constraints PRIMARY KEY (practice_id);
 J   ALTER TABLE ONLY public.practice DROP CONSTRAINT practice_pk_constraints;
       public            postgres    false    210            �           2606    57645     provider provider_pk_constraints 
   CONSTRAINT     g   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pk_constraints PRIMARY KEY (provider_id);
 J   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pk_constraints;
       public            postgres    false    212            �           2606    57713 <   provider_qualification provider_qualification_pk_constraints 
   CONSTRAINT     �   ALTER TABLE ONLY public.provider_qualification
    ADD CONSTRAINT provider_qualification_pk_constraints PRIMARY KEY (provider_qualification_id);
 f   ALTER TABLE ONLY public.provider_qualification DROP CONSTRAINT provider_qualification_pk_constraints;
       public            postgres    false    213            �           2606    57725 4   provider_specialty provider_specialty_pk_constraints 
   CONSTRAINT     �   ALTER TABLE ONLY public.provider_specialty
    ADD CONSTRAINT provider_specialty_pk_constraints PRIMARY KEY (provider_specialty_id);
 ^   ALTER TABLE ONLY public.provider_specialty DROP CONSTRAINT provider_specialty_pk_constraints;
       public            postgres    false    214            �           2606    57618 *   qualification qualification_pk_constraints 
   CONSTRAINT     v   ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT qualification_pk_constraints PRIMARY KEY (qualification_id);
 T   ALTER TABLE ONLY public.qualification DROP CONSTRAINT qualification_pk_constraints;
       public            postgres    false    215            �           2606    57620 "   specialty specialty_pk_constraints 
   CONSTRAINT     j   ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pk_constraints PRIMARY KEY (specialty_id);
 L   ALTER TABLE ONLY public.specialty DROP CONSTRAINT specialty_pk_constraints;
       public            postgres    false    216            �           2606    57650 #   appointment appointment_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_constraints FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);
 M   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_constraints;
       public          postgres    false    207    2962    201            �           2606    57657 0   appointment_slot appointment_slot_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_slot
    ADD CONSTRAINT appointment_slot_fk_constraints FOREIGN KEY (provider_id) REFERENCES public.provider(provider_id);
 Z   ALTER TABLE ONLY public.appointment_slot DROP CONSTRAINT appointment_slot_fk_constraints;
       public          postgres    false    2972    212    202            �           2606    57625 0   appointment_type appointment_type_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_type
    ADD CONSTRAINT appointment_type_fk_constraints FOREIGN KEY (practice_id) REFERENCES public.practice(practice_id);
 Z   ALTER TABLE ONLY public.appointment_type DROP CONSTRAINT appointment_type_fk_constraints;
       public          postgres    false    2968    203    210            �           2606    57662 /   appointment_slot appointmentslot_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_slot
    ADD CONSTRAINT appointmentslot_fk_constraints FOREIGN KEY (location_id) REFERENCES public.location(location_id);
 Y   ALTER TABLE ONLY public.appointment_slot DROP CONSTRAINT appointmentslot_fk_constraints;
       public          postgres    false    205    202    2958            �           2606    57667 /   appointment_slot appointmentslot_pk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_slot
    ADD CONSTRAINT appointmentslot_pk_constraints FOREIGN KEY (appointment_type_id) REFERENCES public.appointment_type(appointment_type_id);
 Y   ALTER TABLE ONLY public.appointment_slot DROP CONSTRAINT appointmentslot_pk_constraints;
       public          postgres    false    2954    203    202            �           2606    74125 0   appointment fk_appointment_apptslot_appt_slot_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment_apptslot_appt_slot_id FOREIGN KEY (appointment_slot_id) REFERENCES public.appointment_slot(appointment_slot_id);
 Z   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fk_appointment_apptslot_appt_slot_id;
       public          postgres    false    202    2952    201            �           2606    57676 0   location_contact location_contact_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_contact
    ADD CONSTRAINT location_contact_fk_constraints FOREIGN KEY (location_id) REFERENCES public.location(location_id);
 Z   ALTER TABLE ONLY public.location_contact DROP CONSTRAINT location_contact_fk_constraints;
       public          postgres    false    206    205    2958            �           2606    57681 8   location_contact location_contact_foreignkey_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_contact
    ADD CONSTRAINT location_contact_foreignkey_constraints FOREIGN KEY (contact_id) REFERENCES public.contact(contact_id);
 b   ALTER TABLE ONLY public.location_contact DROP CONSTRAINT location_contact_foreignkey_constraints;
       public          postgres    false    206    204    2956            �           2606    57634     location location_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_fk_constraints FOREIGN KEY (practice_id) REFERENCES public.practice(practice_id);
 J   ALTER TABLE ONLY public.location DROP CONSTRAINT location_fk_constraints;
       public          postgres    false    205    210    2968            �           2606    57639 (   location location_foreignkey_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_foreignkey_constraints FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 R   ALTER TABLE ONLY public.location DROP CONSTRAINT location_foreignkey_constraints;
       public          postgres    false    2948    205    200            �           2606    57690 .   patient_contact patient_contact_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.patient_contact
    ADD CONSTRAINT patient_contact_fk_constraints FOREIGN KEY (contact_id) REFERENCES public.contact(contact_id);
 X   ALTER TABLE ONLY public.patient_contact DROP CONSTRAINT patient_contact_fk_constraints;
       public          postgres    false    209    204    2956            �           2606    57695 6   patient_contact patient_contact_foreignkey_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.patient_contact
    ADD CONSTRAINT patient_contact_foreignkey_constraints FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);
 `   ALTER TABLE ONLY public.patient_contact DROP CONSTRAINT patient_contact_foreignkey_constraints;
       public          postgres    false    2962    207    209            �           2606    57702 0   practice_contact practice_contact_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.practice_contact
    ADD CONSTRAINT practice_contact_fk_constraints FOREIGN KEY (practice_id) REFERENCES public.practice(practice_id);
 Z   ALTER TABLE ONLY public.practice_contact DROP CONSTRAINT practice_contact_fk_constraints;
       public          postgres    false    211    2968    210            �           2606    57707 8   practice_contact practice_contact_foreignkey_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.practice_contact
    ADD CONSTRAINT practice_contact_foreignkey_constraints FOREIGN KEY (contact_id) REFERENCES public.contact(contact_id);
 b   ALTER TABLE ONLY public.practice_contact DROP CONSTRAINT practice_contact_foreignkey_constraints;
       public          postgres    false    204    211    2956            �           2606    57714 <   provider_qualification provider_qualification_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_qualification
    ADD CONSTRAINT provider_qualification_fk_constraints FOREIGN KEY (provider_id) REFERENCES public.provider(provider_id);
 f   ALTER TABLE ONLY public.provider_qualification DROP CONSTRAINT provider_qualification_fk_constraints;
       public          postgres    false    212    213    2972            �           2606    57719 E   provider_qualification provider_qualification_foreign_key_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_qualification
    ADD CONSTRAINT provider_qualification_foreign_key_constraints FOREIGN KEY (qualification_id) REFERENCES public.qualification(qualification_id);
 o   ALTER TABLE ONLY public.provider_qualification DROP CONSTRAINT provider_qualification_foreign_key_constraints;
       public          postgres    false    2978    213    215            �           2606    57726 4   provider_specialty provider_specialty_fk_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_specialty
    ADD CONSTRAINT provider_specialty_fk_constraints FOREIGN KEY (provider_id) REFERENCES public.provider(provider_id);
 ^   ALTER TABLE ONLY public.provider_specialty DROP CONSTRAINT provider_specialty_fk_constraints;
       public          postgres    false    2972    214    212            �           2606    57731 <   provider_specialty provider_specialty_foreignkey_constraints    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_specialty
    ADD CONSTRAINT provider_specialty_foreignkey_constraints FOREIGN KEY (specialty_id) REFERENCES public.specialty(specialty_id);
 f   ALTER TABLE ONLY public.provider_specialty DROP CONSTRAINT provider_specialty_foreignkey_constraints;
       public          postgres    false    2980    216    214            9   �  x�E�;n�0@��)x��J{���H��q3���PZ�9N�4�@�4�+�F�@�yx#�՜+_',#<܁c�:�c�fv�0e�������}��:
!h�C�!(#@jǃF!:[����o����u�c[ja�V�%����	��±�����;pO\c��7�s)h�1�������ϗ|)Î��Y�ގmN�!�>�����V�ן�+��S��Z��s��	A��p%��4t�>��mg+5{_�L����Vxwy�CH\θ�ӸQ�h(XͽQ�hK΁;m\�Qt���fܱRI��v��;;�TV���?�c�wxY�]͠����W^�d�w6��E�^�������J�n��mJ�Ȏ�δ �.�~L�
�VRk0�Ga�!�D�1G��뺿0�4      :     x�u�9r�0E��S��"6n��N'���1 =�$*;{�'.� ^����0#|r� }A�Qb� �������*�@#mHN(5Ҝ����^�i` l�W�5WxhX5hXS�^"�	����}`OL}�\�)�qHĉa_�<4u��ZEPS#?)M{�ԁ��9�<4=�� ���r��@�w�(eI���?4<y� I�@�1h� ȫ���S�~�4=y־v����Ѓ��s	��!s9�-ĕ���
�YKi�v���o��
�'YKi`�x{u��i�1�/h����������O�>��5���YieY���%�A��$K�)�[��3��#O��H<��pu��i)�J>=�'hʫ�5k5���G"f�l.�|
o���3��`HO���;h����Z�ޠy���V���9�zNh�zt�zSbj��.�.�/˼�p�3�+4OЗW�Ƞ�ma?\x��f���S��D�-��O����^�$	���3��,7o�{R��^(T�";hy�4MZ���n�<����	��9�yꃇgu�zNh�zp}���-�ӵ������|�t�g���p=��h���LܙY`�`��ѻ��I9fT���"�	�C�ȣ-����C�h��'f���'���B���/	+��іA�S�S#��/�w	=�S_����RX��`�en�2kiվ�7e=�����#�P��+��$��C��[���i	�5���W=���� ���d�*���zi%�����~���G�T      ;   �   x�]�Q�0D��.n��z���9vJ��&!��c�K�*X�j��`c�M����.!.�.�(l޳A\�5�Uv-���hoc�q�ګ�OQ�`M�j�>A�o��`S���Cte83����=�̈��K�cNd�x;\�-�3��G��ߏ�� �n=       <   �   x�M�9�0E�S���@h��P*��ca�[���	b�ߞ~⤎!YuvHT笹="�X�v9� �2�V�Gq4���
��#�[�����B�2H�-h;z�Fd��I|���t�ƽ�5n�D_R�;�X^ڜ�.k�Y\����/+D|n@�      =     x�m��r� F��w)���]6]��!B�CMS߾��֩.�q�>j0���ˁc:��+���6C�&ۥD�����цX1Ш��1>3.9c�n���Cۗ�kH�7A�r�$��om'!9n��{�)��ih�b�H\�t����3PT�*�zTM�ls����4meu?*Z+\({K1&2v��w(%�؊�.�Gj.��n$��cث����e��L	�)�a �=ޯnǨ@2��B��s���CPh4���iHW�M��d�B�,��k�����9�Yg���F����
�r      >   P   x��H�K�4A����LN#N3N#.���ĤDNcNSNc�����LN��	�oiNi^
H�Ӕ�%1%��ބӌ+F��� ��      ?   N   x����@B�5c�k/����#owrI$|90m�腓2ء;en��z�]��f����q�J�J.��E�m�      @   z   x�]���0�g�a��{H��t�r�=q�U���s[&��g{��*G\%�a�'e��&���pK���a���k`�f�hu��?��<�$V�S�nEx	�[p�oE�X0ߪ�ϥ��6ιc�5�      A   �   x�}�=�0�g�S���9UT�W��4��ܿ�� /��Ov�9��o0�h7/"�M�<yBÞ����*e!!��S�6Hi�{1���I�"jr����i��O���;N�^�x����7%=J5�+p`H+�,ܸ���j��_����T+      B   7   x���  ��m1N�^���L&�['�
�MJ�b����洇���fg�7�n;      C   Y   x�3�t,����W�H�K�2�q��32��9��3�RJ��s��L����r2�L9��J2�|KsJ�R��`|�Ĕ�"�=... �� �      D   N   x����0Cѳ��	�d��;A�W���[2A���&ąϢ�U<*%���v#��SG��t[pv�K�cf?
�      E   �   x�-�1�0���ˏ����Q�����r-��JR��oy�^��t)SU\����'I��brz-ez�t�ŞH�3�,a-��G?U�g�Aǳ��c�IH�㔢�g-��8���B���촾�`��,͙��(�]Wιu�)B      F   :   x����0��T�l'�^��s�R�Q�\�ii�x����C�/�ҭ�\���l�Cd�      G   :   x����0B��g�����٥��.	��&�vH%�P��U^��6������%��>      H   =   x�3���s�`.#N'�`.cN'G�`.N�P e�����8�"����9���􂓹b���� V��      I   �   x�E�;1Dk�� ���YZ6DEce#b)$��foϚ�n�h�up�>�<S⦸��Ec��l`�)}J*�[8��<��p}�ji��Ȥ³-�\�|�M�F��	�A�p&�q��A4�j
��%"~�D4�     