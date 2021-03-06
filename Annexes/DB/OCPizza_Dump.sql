PGDMP     2                     w           OCPizza    11.4    11.4 )    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            C           1262    33246    OCPizza    DATABASE     �   CREATE DATABASE "OCPizza" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE "OCPizza";
             postgres    false            �            1259    33247    adresse    TABLE     R  CREATE TABLE public.adresse (
    adresse_id integer NOT NULL,
    email character varying NOT NULL,
    telephone integer NOT NULL,
    numero_de_rue integer NOT NULL,
    complement_numero_de_rue character varying,
    complement_rue character varying NOT NULL,
    code_postal integer NOT NULL,
    ville character varying NOT NULL
);
    DROP TABLE public.adresse;
       public         postgres    false            �            1259    33297    commande    TABLE     [  CREATE TABLE public.commande (
    commande_id integer NOT NULL,
    utilisateur_id integer NOT NULL,
    pizzeria_id integer NOT NULL,
    type_paiement integer NOT NULL,
    statut_commande integer NOT NULL,
    mode_retrait integer NOT NULL,
    payement_effectue boolean NOT NULL,
    prix double precision NOT NULL,
    date date NOT NULL
);
    DROP TABLE public.commande;
       public         postgres    false            �            1259    33263 
   ingredient    TABLE     �   CREATE TABLE public.ingredient (
    ingredient_id integer NOT NULL,
    nom character varying NOT NULL,
    volume double precision NOT NULL
);
    DROP TABLE public.ingredient;
       public         postgres    false            �            1259    33302    ligne_commande    TABLE     �   CREATE TABLE public.ligne_commande (
    ligne_commande_id integer NOT NULL,
    commande_id integer NOT NULL,
    pizza_id integer NOT NULL,
    prix double precision NOT NULL,
    quantite integer NOT NULL
);
 "   DROP TABLE public.ligne_commande;
       public         postgres    false            �            1259    33276    pizza    TABLE     �   CREATE TABLE public.pizza (
    pizza_id integer NOT NULL,
    nom character varying NOT NULL,
    prix double precision NOT NULL,
    ingredients character varying NOT NULL
);
    DROP TABLE public.pizza;
       public         postgres    false            �            1259    33255    pizzeria    TABLE     �   CREATE TABLE public.pizzeria (
    pizzeria_id integer NOT NULL,
    adresse_id integer NOT NULL,
    nom character varying NOT NULL
);
    DROP TABLE public.pizzeria;
       public         postgres    false            �            1259    33284    recette    TABLE     �   CREATE TABLE public.recette (
    ingredient_id integer NOT NULL,
    pizza_id integer NOT NULL,
    volume integer NOT NULL
);
    DROP TABLE public.recette;
       public         postgres    false            �            1259    33271    stock    TABLE     �   CREATE TABLE public.stock (
    pizzeria_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    volume double precision NOT NULL
);
    DROP TABLE public.stock;
       public         postgres    false            �            1259    33289    utilisateur    TABLE     $  CREATE TABLE public.utilisateur (
    utilisateur_id integer NOT NULL,
    adresse_id integer NOT NULL,
    prenom character varying NOT NULL,
    nom character varying NOT NULL,
    poste integer NOT NULL,
    login character varying NOT NULL,
    mot_de_passe character varying NOT NULL
);
    DROP TABLE public.utilisateur;
       public         postgres    false            5          0    33247    adresse 
   TABLE DATA               �   COPY public.adresse (adresse_id, email, telephone, numero_de_rue, complement_numero_de_rue, complement_rue, code_postal, ville) FROM stdin;
    public       postgres    false    196   [2       <          0    33297    commande 
   TABLE DATA               �   COPY public.commande (commande_id, utilisateur_id, pizzeria_id, type_paiement, statut_commande, mode_retrait, payement_effectue, prix, date) FROM stdin;
    public       postgres    false    203   �3       7          0    33263 
   ingredient 
   TABLE DATA               @   COPY public.ingredient (ingredient_id, nom, volume) FROM stdin;
    public       postgres    false    198   �3       =          0    33302    ligne_commande 
   TABLE DATA               b   COPY public.ligne_commande (ligne_commande_id, commande_id, pizza_id, prix, quantite) FROM stdin;
    public       postgres    false    204   u4       9          0    33276    pizza 
   TABLE DATA               A   COPY public.pizza (pizza_id, nom, prix, ingredients) FROM stdin;
    public       postgres    false    200   �4       6          0    33255    pizzeria 
   TABLE DATA               @   COPY public.pizzeria (pizzeria_id, adresse_id, nom) FROM stdin;
    public       postgres    false    197   k5       :          0    33284    recette 
   TABLE DATA               B   COPY public.recette (ingredient_id, pizza_id, volume) FROM stdin;
    public       postgres    false    201   �5       8          0    33271    stock 
   TABLE DATA               C   COPY public.stock (pizzeria_id, ingredient_id, volume) FROM stdin;
    public       postgres    false    199   6       ;          0    33289    utilisateur 
   TABLE DATA               j   COPY public.utilisateur (utilisateur_id, adresse_id, prenom, nom, poste, login, mot_de_passe) FROM stdin;
    public       postgres    false    202   i6       �
           2606    33254    adresse adresse_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (adresse_id);
 <   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pk;
       public         postgres    false    196            �
           2606    33301    commande commande_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (commande_id);
 >   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pk;
       public         postgres    false    203            �
           2606    33270    ingredient ingredient_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id);
 B   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pk;
       public         postgres    false    198            �
           2606    33306     ligne_commande ligne_commande_pk 
   CONSTRAINT     m   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT ligne_commande_pk PRIMARY KEY (ligne_commande_id);
 J   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT ligne_commande_pk;
       public         postgres    false    204            �
           2606    33283    pizza pizza_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (pizza_id);
 8   ALTER TABLE ONLY public.pizza DROP CONSTRAINT pizza_pk;
       public         postgres    false    200            �
           2606    33262    pizzeria pizzeria_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id);
 >   ALTER TABLE ONLY public.pizzeria DROP CONSTRAINT pizzeria_pk;
       public         postgres    false    197            �
           2606    33288    recette recette_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_pk PRIMARY KEY (ingredient_id, pizza_id);
 <   ALTER TABLE ONLY public.recette DROP CONSTRAINT recette_pk;
       public         postgres    false    201    201            �
           2606    33275    stock stock_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (pizzeria_id, ingredient_id);
 8   ALTER TABLE ONLY public.stock DROP CONSTRAINT stock_pk;
       public         postgres    false    199    199            �
           2606    33296    utilisateur utilisateur_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateur_id);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         postgres    false    202            �
           2606    33307    pizzeria adresse_pizzeria_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT adresse_pizzeria_fk FOREIGN KEY (adresse_id) REFERENCES public.adresse(adresse_id);
 F   ALTER TABLE ONLY public.pizzeria DROP CONSTRAINT adresse_pizzeria_fk;
       public       postgres    false    2721    196    197            �
           2606    33312 "   utilisateur adresse_utilisateur_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT adresse_utilisateur_fk FOREIGN KEY (adresse_id) REFERENCES public.adresse(adresse_id);
 L   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT adresse_utilisateur_fk;
       public       postgres    false    202    2721    196            �
           2606    33352 )   ligne_commande commande_ligne_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT commande_ligne_commande_fk FOREIGN KEY (commande_id) REFERENCES public.commande(commande_id);
 S   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT commande_ligne_commande_fk;
       public       postgres    false    203    204    2735            �
           2606    33327    recette ingredient_recette_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT ingredient_recette_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);
 G   ALTER TABLE ONLY public.recette DROP CONSTRAINT ingredient_recette_fk;
       public       postgres    false    198    2725    201            �
           2606    33332    stock ingredient_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(ingredient_id);
 C   ALTER TABLE ONLY public.stock DROP CONSTRAINT ingredient_stock_fk;
       public       postgres    false    199    2725    198            �
           2606    33337 &   ligne_commande pizza_ligne_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT pizza_ligne_commande_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);
 P   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT pizza_ligne_commande_fk;
       public       postgres    false    200    2729    204            �
           2606    33342    recette pizza_recette_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT pizza_recette_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);
 B   ALTER TABLE ONLY public.recette DROP CONSTRAINT pizza_recette_fk;
       public       postgres    false    201    200    2729            �
           2606    33322    commande pizzeria_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT pizzeria_commande_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);
 G   ALTER TABLE ONLY public.commande DROP CONSTRAINT pizzeria_commande_fk;
       public       postgres    false    2723    203    197            �
           2606    33317    stock pizzeria_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT pizzeria_stock_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);
 A   ALTER TABLE ONLY public.stock DROP CONSTRAINT pizzeria_stock_fk;
       public       postgres    false    199    2723    197            �
           2606    33347     commande utilisateur_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT utilisateur_commande_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(utilisateur_id);
 J   ALTER TABLE ONLY public.commande DROP CONSTRAINT utilisateur_commande_fk;
       public       postgres    false    202    2733    203            5   6  x����r� ���S�QPs�	����Zd-Bf���b;6m.�10����J�q����磽��0�Uݩ��]Z��B2��@)Lŀ�[@�,�;.�̚���8�Ͽx�cZݨ�*��f<#�;y�j�ayQg����Z����S����lK�BB���k4�cz֑��A6�����b�B��θȿ��T�U&I�v��̒g����mˊf��W
�R�g�nC�S�ԚkI�/V|��)9�M�?�J���t�b�#����Of2��u,en8�`\O):���% #��:v��v����0>��tB|�$��      <   5   x�3�4�4C#�4N#C=#$`70��5��52�2�4�4�j �8F��� �
�      7      x�-���0C��W�Pc��p	]؊�f�6�zZћ�m������Thc�����p�6�a�{Hd���=|H^�����M;3��ܚ7���;,�֢�d�U���RV��͸��"� �.�      =   2   x�3�4�4�42Գ�0@&�F\@q������%�P��(g�C.F��� �Vt      9   �   x���A�@E��S���wqS�c�t�DN�$��c7���ߟ_�HۉS䇪�?�4'GvƑ2˲�R�c�+������:���AB̬�� ~֤���g��ִk攘l��]���'���L���'�R��i$�ѓ�m�NzC�J��Q�a��k[+�� . x �v�      6   J   x��1� Й�&j�Mb�P1��o�+T��2W��T��ͽD�G���<qӝ[t�A����x� �+>.      :   A   x����0��R��%`b/�_��\>�,��b���'.L6�}3RE(Bqv,���<me|WD�^�H      8   C   x�=̻� �К&�#·]�"!���W�Z����������p*�!�4�H#�4�H#�O�#"�uo      ;   p   x�5���0г�1�
��1�0)Ei�B��_���Y�="�**8�,k���O?�H�7K��0��Hjm��*�����(ٖ5�n��?��Ռ�.]�b��v.֫χs�s�0z     