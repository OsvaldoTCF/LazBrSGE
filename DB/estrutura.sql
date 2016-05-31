--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-31 16:47:34 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16393)
-- Name: boleto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE boleto (
    codigo integer,
    nosso_numero integer,
    dt_vencimento character varying(20),
    numero_documento character varying(18),
    num_agencia character varying(10),
    num_conta_cedente character varying(10),
    valor_docum double precision,
    carteira character varying(4),
    cedente character varying(150),
    sacado character varying(150),
    cep_sacado character varying(12),
    tipo_pessoa_sacado character varying(7),
    cidade character varying(100),
    uf_sacado character varying(2),
    juros double precision,
    cpf_cgc_sacado character varying(25),
    mora_juros double precision,
    banco_nome character varying(100),
    convenio character varying(15),
    dig_conta_ced character varying(2),
    dig_ag_ced character varying(2),
    endereco_sacado character varying(150),
    data_proces date,
    env_rem character varying(8),
    condigo_cedente character varying(20),
    cnpj_cedente character varying(21),
    fj_ced character varying(10),
    id integer NOT NULL,
    contabancoid integer,
    bairro character varying(200),
    numero character varying(15)
);


ALTER TABLE boleto OWNER TO postgres;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE boleto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE boleto IS 'boletos bancarios emitidos';


--
-- TOC entry 184 (class 1259 OID 16399)
-- Name: boleto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE boleto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE boleto_id_seq OWNER TO postgres;

--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 184
-- Name: boleto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE boleto_id_seq OWNED BY boleto.id;


--
-- TOC entry 185 (class 1259 OID 16401)
-- Name: cadastro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cadastro (
    codigo integer NOT NULL,
    nome character varying(300),
    apelido character varying(300),
    tipo_pessoa character varying(1),
    sexo character varying(1),
    cnpj character varying(18),
    inscricao_estadual character varying(18),
    endereco character varying(80),
    complemento character varying(70),
    bairro character varying(50),
    cidade character varying(40),
    uf character varying(2),
    cep character varying(10),
    fax character varying(15),
    cx_postal character varying(8),
    site character varying(120),
    cli_bloqueado character varying(18),
    tipo_cadastro character varying(16),
    observacao character varying(1000),
    data_cadast character varying(15),
    numero character varying(15),
    tabela character varying(50)
);


ALTER TABLE cadastro OWNER TO postgres;

--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE cadastro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cadastro IS 'cadastro de clientes , fornecedores etc';


--
-- TOC entry 186 (class 1259 OID 16407)
-- Name: cadastro_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cadastro_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_codigo_seq OWNER TO postgres;

--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 186
-- Name: cadastro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cadastro_codigo_seq OWNED BY cadastro.codigo;


--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: cadastro_contatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cadastro_contatos (
    id integer NOT NULL,
    tcadastroid integer NOT NULL,
    email character varying,
    telefone character varying,
    contato character varying
);


ALTER TABLE cadastro_contatos OWNER TO postgres;

--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE cadastro_contatos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cadastro_contatos IS 'contatos dos cadastro , email telefone etc';


--
-- TOC entry 188 (class 1259 OID 16415)
-- Name: cadastro_contatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cadastro_contatos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_contatos_id_seq OWNER TO postgres;

--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 188
-- Name: cadastro_contatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cadastro_contatos_id_seq OWNED BY cadastro_contatos.id;


--
-- TOC entry 189 (class 1259 OID 16417)
-- Name: centro_custo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE centro_custo (
    codigo_cc integer NOT NULL,
    descricao_cc character varying(150)
);


ALTER TABLE centro_custo OWNER TO postgres;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE centro_custo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE centro_custo IS 'despeza por setor';


--
-- TOC entry 190 (class 1259 OID 16420)
-- Name: centro_custo_codigo_cc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE centro_custo_codigo_cc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE centro_custo_codigo_cc_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 190
-- Name: centro_custo_codigo_cc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE centro_custo_codigo_cc_seq OWNED BY centro_custo.codigo_cc;


--
-- TOC entry 191 (class 1259 OID 16422)
-- Name: cfop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cfop (
    codigo integer NOT NULL,
    descricao character varying(70)
);


ALTER TABLE cfop OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE cfop; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cfop IS 'cfop usados na emissao nota fiscal';


--
-- TOC entry 192 (class 1259 OID 16425)
-- Name: conta_banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conta_banco (
    codigo integer NOT NULL,
    banco_nome character varying(55),
    cedente character varying(80),
    agencia character varying(15),
    dig_ag character(1),
    num_conta character varying(20),
    dig_conta character(1),
    carteira character varying(5),
    convenio character varying(20),
    condigo_cedente character varying(20),
    cnpj_cedente character varying(21),
    fj_ced character varying(10)
);


ALTER TABLE conta_banco OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE conta_banco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE conta_banco IS 'conta bancaria para emissao boleto';


--
-- TOC entry 193 (class 1259 OID 16428)
-- Name: conta_banco_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conta_banco_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conta_banco_codigo_seq OWNER TO postgres;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 193
-- Name: conta_banco_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conta_banco_codigo_seq OWNED BY conta_banco.codigo;


--
-- TOC entry 194 (class 1259 OID 16430)
-- Name: contas_pag_receb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contas_pag_receb (
    codigo integer NOT NULL,
    valor double precision,
    centrocusto_id character varying(5),
    tipo character varying(30),
    status character varying(5),
    descricao character varying(150),
    deb_cred character(1),
    data date,
    empresa character varying(15),
    vl_cust_merc double precision,
    vl_cust_terc double precision,
    lucro double precision,
    observacao character varying(500),
    data_pagamento date,
    tipo_nota integer,
    codigo_cadastro integer
);


ALTER TABLE contas_pag_receb OWNER TO postgres;

--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE contas_pag_receb; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contas_pag_receb IS 'controle de contas a pagar e a receber';


--
-- TOC entry 195 (class 1259 OID 16436)
-- Name: contas_pag_receb_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contas_pag_receb_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contas_pag_receb_codigo_seq OWNER TO postgres;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 195
-- Name: contas_pag_receb_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contas_pag_receb_codigo_seq OWNED BY contas_pag_receb.codigo;


--
-- TOC entry 196 (class 1259 OID 16438)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresa (
    codigo integer NOT NULL,
    razao_social character varying(150),
    endereco character varying(150),
    uf character varying(3),
    cep character varying(12),
    email character varying(150),
    site character varying(150),
    skype character varying(80),
    nome_fantasia_1 character varying(150),
    numero integer,
    fone character varying(25),
    cnpj character varying(40),
    ie character varying(25),
    msn character varying(100),
    bairro character varying(100),
    municipio character varying(200),
    complemento character varying
);


ALTER TABLE empresa OWNER TO postgres;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE empresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE empresa IS 'implementação futura (multiempresa)';


--
-- TOC entry 197 (class 1259 OID 16444)
-- Name: empresa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_codigo_seq OWNER TO postgres;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 197
-- Name: empresa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_codigo_seq OWNED BY empresa.codigo;


--
-- TOC entry 206 (class 1259 OID 16473)
-- Name: forma_pag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE forma_pag (
    codigo integer NOT NULL,
    descricao character varying(100),
    tes character varying(5)
);


ALTER TABLE forma_pag OWNER TO postgres;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE forma_pag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE forma_pag IS 'formas de pagamento';


--
-- TOC entry 207 (class 1259 OID 16476)
-- Name: forma_pag_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE forma_pag_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forma_pag_codigo_seq OWNER TO postgres;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 207
-- Name: forma_pag_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE forma_pag_codigo_seq OWNED BY forma_pag.codigo;


--
-- TOC entry 208 (class 1259 OID 16478)
-- Name: instrucoes_os; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE instrucoes_os (
    codigo integer NOT NULL,
    descricao character varying(100)
);


ALTER TABLE instrucoes_os OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE instrucoes_os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE instrucoes_os IS 'texto pronto para campo de observação os';


--
-- TOC entry 209 (class 1259 OID 16481)
-- Name: instrucoes_os_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instrucoes_os_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instrucoes_os_codigo_seq OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 209
-- Name: instrucoes_os_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instrucoes_os_codigo_seq OWNED BY instrucoes_os.codigo;


--
-- TOC entry 210 (class 1259 OID 16483)
-- Name: lancamento_cte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lancamento_cte (
    id integer NOT NULL,
    ide_cuf character varying(50),
    ide_cct character varying(50),
    ide_cfop character varying(500),
    ide_natop character varying(300),
    ide_forpag character varying(50),
    ide_mod character varying(50),
    ide_serie character varying(30),
    ide_nct character varying(300),
    ide_dhemi date,
    ide_tpimp character varying(300),
    ide_tpemis character varying(30),
    ide_cdv character varying(30),
    ide_tpamb character varying(30),
    ide_tpcte character varying(300),
    ide_procemi character varying(300),
    ide_verproc character varying(300),
    ide_cmunenv character varying(30),
    ide_xmunenv character varying(30),
    ide_ufenv character varying(30),
    ide_modal character varying(30),
    ide_tpserv character varying(30),
    ide_cmunini character varying(30),
    ide_xmunini character varying(300),
    ide_ufini character varying(30),
    ide_cmunfim character varying(30),
    ide_xmunfim character varying(300),
    ide_uffim character varying(30),
    ide_retira character varying(30),
    ide_toma03_toma character varying(30),
    compl_xcaracad character varying(30),
    compl_xcaracser character varying(50),
    emit_cnpj character varying(50),
    emit_ie character varying(50),
    emit_xnome character varying(300),
    emit_enderemi_xlgr character varying(300),
    emit_enderemi_nro character varying(50),
    emit_enderemi_xcpl character varying(300),
    emit_enderemi_xbairro character varying(300),
    emit_enderemi_cmun character varying(50),
    emit_enderemi_xmun character varying(300),
    emit_enderemi_cep character varying(50),
    emit_enderemi_uf character varying(10),
    emit_enderemi_fone character varying(50),
    rem_cnpj character varying(30),
    rem_ie character varying(30),
    rem_xnome character varying(300),
    rem_fone character varying(30),
    rem_enderreme_xlgr character varying(300),
    rem_enderreme_nro character varying(30),
    rem_enderreme_xbairro character varying(300),
    rem_enderreme_cmun character varying(30),
    rem_enderreme_xmun character varying(300),
    rem_enderreme_cep character varying(30),
    rem_enderreme_uf character varying(300),
    dest_cnpj character varying(30),
    dest_ie character varying(30),
    dest_xnome character varying(300),
    dest_fone character varying(30),
    dest_enderdest_xlgr character varying(300),
    dest_enderdest_nro character varying(30),
    dest_enderdest_xbairro character varying(300),
    dest_enderdest_cmun character varying(30),
    dest_enderdest_xmun character varying(30),
    dest_enderdest_cep character varying(30),
    dest_enderdest_uf character varying(30),
    cod_inf character varying(100),
    chcte character varying(300)
);


ALTER TABLE lancamento_cte OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16489)
-- Name: lancamento_cte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lancamento_cte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lancamento_cte_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 211
-- Name: lancamento_cte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lancamento_cte_id_seq OWNED BY lancamento_cte.id;


--
-- TOC entry 212 (class 1259 OID 16491)
-- Name: lancamento_notas_fiscais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lancamento_notas_fiscais (
    id integer NOT NULL,
    infnfe_id character varying(200),
    ide_cuf character varying(30),
    ide_cnf character varying(10),
    ide_natop character varying(200),
    ide_indpag character varying(30),
    ide_nnf character varying(100),
    ide_demi date,
    ide_dsaient character varying(30),
    ide_mod character varying(30),
    ide_serie character varying(30),
    ide_tpnf character varying(30),
    ide_cmunfg character varying,
    ide_tpemis character varying(30),
    ide_finnfe character varying(30),
    ide_procemi character varying(40),
    emit_cnpjcpf character varying(30),
    emit_xnome character varying(200),
    emit_xfant character varying(100),
    emit_ie character varying(50),
    emit_iest character varying(30),
    emit_im character varying(30),
    emit_cnae character varying(30),
    enderemit_xlgr character varying(300),
    enderemit_nro character varying(5),
    enderemit_xcpl character varying(200),
    enderemit_xbairro character varying(200),
    enderemit_cmun character varying(10),
    enderemit_xmun character varying,
    enderemit_uf character varying(2),
    enderemit_cep character varying(10),
    enderemit_fone character varying(30),
    dest_cnpjcpf character varying(20),
    dest_xnome character varying(300),
    dest_ie character varying(20),
    enderdest_xlgr character varying(200),
    enderdest_nro character varying(5),
    enderdest_xcpl character varying(100),
    enderdest_xbairro character varying(300),
    enderdest_cmun character varying,
    enderdest_xmun character varying(200),
    enderdest_uf character varying(2),
    enderdest_cep character varying(10),
    enderdest_fone character varying(20),
    retirada_cnpj character varying(20),
    retirada_xlgr character varying(200),
    retirada_nro character varying(10),
    retirada_xcpl character varying(100),
    retirada_xbairro character varying(300),
    retirada_cmun character varying(20),
    retirada_xmun character varying(300),
    retirada_uf character varying(2),
    entrega_cnpj character varying(200),
    entrega_xlgr character varying(200),
    entrega_nro character varying(5),
    entrega_xcpl character varying(300),
    entrega_xbairro character varying(200),
    entrega_cmun character varying(20),
    entrega_xmun character varying(300),
    entrega_uf character varying(2),
    icmstot_vbc double precision,
    icmstot_vicms double precision,
    icmstot_vbcst double precision,
    icmstot_vprod double precision,
    icmstot_vpis double precision,
    icmstot_vcofins double precision,
    icmstot_vst double precision,
    icmstot_vipi double precision,
    icmstot_vnf double precision,
    icmstot_vseg double precision,
    icmstotal_vfrete double precision,
    icmstot_voutro double precision,
    transp_modfrete character varying(200),
    transporta_cnpjcpf character varying(100),
    transporta_xnome character varying(300),
    transporta_ie character varying(100),
    transporta_xender character varying(300),
    transporta_xmun character varying(300),
    transporta_uf character varying(2),
    transporta_qvol character varying(50),
    transporta_esp character varying(50),
    infadfisco character varying(1000),
    infcpl_contrib character varying(1000),
    cdv character varying(20),
    verproc character varying(30),
    fat_nfat character varying,
    pesol double precision,
    pesob double precision,
    consumidor_final character varying(30),
    tipo_contribuinte character varying(30),
    cancelada character varying(10),
    nfantasiaid integer,
    old_codigo integer,
    ent_saida character varying(10),
    empresa_id integer
);


ALTER TABLE lancamento_notas_fiscais OWNER TO postgres;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE lancamento_notas_fiscais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lancamento_notas_fiscais IS 'notas ficais emitidas e recebidas';


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN lancamento_notas_fiscais.infnfe_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais.infnfe_id IS 'chave de acesso';


--
-- TOC entry 213 (class 1259 OID 16497)
-- Name: lancamento_notas_fiscais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lancamento_notas_fiscais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lancamento_notas_fiscais_id_seq OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 213
-- Name: lancamento_notas_fiscais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lancamento_notas_fiscais_id_seq OWNED BY lancamento_notas_fiscais.id;


--
-- TOC entry 214 (class 1259 OID 16499)
-- Name: lancamento_notas_fiscais_itens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lancamento_notas_fiscais_itens (
    id integer NOT NULL,
    num_nfe integer,
    lancamento_notas_fiscais_id integer,
    infadprod character varying(200),
    prod_nitem integer,
    prod_cprod character varying(70),
    prod_xprod character varying(500),
    prod_ncm character varying(200),
    prod_extipi character varying(200),
    prod_cfop character varying(100),
    prod_ucom character varying(200),
    prod_qcom double precision,
    prod_vuncom double precision,
    prod_vprod double precision,
    prod_utrib character varying(20),
    prod_qtrib double precision,
    prod_vuntrib double precision,
    refnfe character varying(50),
    refnf_cuf character varying(30),
    refnf_aamm character varying(30),
    refnf_cnpj character varying(30),
    refnf_modelo character varying(20),
    refnf_serie character varying(30),
    refnf_nnf character varying(30),
    ean character varying(70),
    utrib character varying(50),
    qtrib character varying(50),
    vuntrib character varying(50),
    orig character varying(50),
    csosn character varying(50),
    pcredsn character varying(50),
    vcredicmssn character varying(50),
    picms character varying(50),
    icmsbc character varying(50),
    pis_cst character varying(50),
    pis_vbc character varying(50),
    ppis character varying(50),
    vpis character varying(50),
    pconfins character varying(50),
    vconfins character varying(50),
    pedido_compra character varying,
    item_pedido_compra character varying,
    frete double precision,
    vipi double precision,
    produto_id integer,
    estoque_atual double precision,
    "nfantasiaid-" integer
);


ALTER TABLE lancamento_notas_fiscais_itens OWNER TO postgres;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE lancamento_notas_fiscais_itens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lancamento_notas_fiscais_itens IS 'itens da nota fiscal';


--
-- TOC entry 215 (class 1259 OID 16505)
-- Name: lancamento_notas_fiscais_itens_baixa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lancamento_notas_fiscais_itens_baixa (
    id integer NOT NULL,
    quantidade double precision,
    id_item integer,
    prod_nitem integer,
    id_lanc_nf integer,
    num_nf integer,
    id_item_baixado integer
);


ALTER TABLE lancamento_notas_fiscais_itens_baixa OWNER TO postgres;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.quantidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.quantidade IS 'quantidade de itens baixados no item da nota fiscal';


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.id_item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.id_item IS 'id do item da nf do lançamento saida';


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.prod_nitem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.prod_nitem IS 'numero do item da nf entrada do item ';


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.id_lanc_nf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.id_lanc_nf IS 'id do item da nota fiscal de entrada baixada';


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.num_nf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.num_nf IS 'Numero nota fiscal de entrada baixada';


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN lancamento_notas_fiscais_itens_baixa.id_item_baixado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lancamento_notas_fiscais_itens_baixa.id_item_baixado IS 'id do item de entrada baixado';


--
-- TOC entry 216 (class 1259 OID 16508)
-- Name: lancamento_notas_fiscais_itens_baixa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lancamento_notas_fiscais_itens_baixa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lancamento_notas_fiscais_itens_baixa_id_seq OWNER TO postgres;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 216
-- Name: lancamento_notas_fiscais_itens_baixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lancamento_notas_fiscais_itens_baixa_id_seq OWNED BY lancamento_notas_fiscais_itens_baixa.id;


--
-- TOC entry 217 (class 1259 OID 16510)
-- Name: lancamento_notas_fiscais_itens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lancamento_notas_fiscais_itens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lancamento_notas_fiscais_itens_id_seq OWNER TO postgres;

--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 217
-- Name: lancamento_notas_fiscais_itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lancamento_notas_fiscais_itens_id_seq OWNED BY lancamento_notas_fiscais_itens.id;


--
-- TOC entry 218 (class 1259 OID 16512)
-- Name: mala_direta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mala_direta (
    codigo integer NOT NULL,
    email character varying(400),
    apelido character varying(200),
    tipo character varying(100)
);


ALTER TABLE mala_direta OWNER TO postgres;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE mala_direta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE mala_direta IS 'Lista de emails para markenting (futuro)';


--
-- TOC entry 219 (class 1259 OID 16518)
-- Name: mala_direta_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mala_direta_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mala_direta_codigo_seq OWNER TO postgres;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 219
-- Name: mala_direta_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mala_direta_codigo_seq OWNED BY mala_direta.codigo;


--
-- TOC entry 220 (class 1259 OID 16520)
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE municipios (
    id character varying(10) NOT NULL,
    iduf character varying(3),
    nome character varying(400)
);


ALTER TABLE municipios OWNER TO postgres;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE municipios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE municipios IS 'LIsta municipios brasileiros e codigo IBGE';


--
-- TOC entry 221 (class 1259 OID 16523)
-- Name: nfe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nfe (
    codigo integer NOT NULL,
    infnfe_id character varying(200),
    ide_cuf character varying(30),
    ide_cnf character varying(10),
    ide_natop character varying(200),
    ide_indpag character varying(30),
    ide_nnf character varying(100),
    ide_demi character varying(30),
    ide_dsaient character varying(30),
    ide_tpnf character varying(30),
    ide_cmunfg character varying,
    ide_tpemis character varying(30),
    ide_tpamb character varying(30),
    ide_finnfe character varying(30),
    ide_procemi character varying(40),
    refnfe character varying(50),
    refnf_cuf character varying(30),
    refnf_aamm character varying(30),
    refnf_cnpj character varying(30),
    refnf_modelo character varying(20),
    refnf_serie character varying(30),
    refnf_nnf character varying(30),
    emit_cnpjcpf character varying(30),
    emit_xnome character varying(200),
    emit_xfant character varying(100),
    emit_ie character varying(50),
    emit_iest character varying(30),
    emit_im character varying(30),
    emit_cnae character varying(30),
    enderemit_xlgr character varying(300),
    enderemit_nro character varying(5),
    enderemit_xcpl character varying(200),
    enderemit_xbairro character varying(200),
    enderemit_cmun character varying(10),
    enderemit_xmun character varying,
    enderemit_uf character varying(2),
    enderemit_cep character varying(10),
    enderemit_fone character varying(30),
    dest_cnpjcpf character varying(20),
    dest_xnome character varying(300),
    dest_ie character varying(20),
    enderdest_xlgr character varying(200),
    enderdest_nro character varying(5),
    enderdest_xcpl character varying(100),
    enderdest_xbairro character varying(300),
    enderdest_cmun character varying,
    enderdest_xmun character varying(200),
    enderdest_uf character varying(2),
    enderdest_cep character varying(10),
    enderdest_fone character varying(20),
    retirada_cnpj character varying(20),
    retirada_xlgr character varying(200),
    retirada_nro character varying(10),
    retirada_xcpl character varying(100),
    retirada_xbairro character varying(300),
    retirada_cmun character varying(20),
    retirada_xmun character varying(300),
    retirada_uf character varying(2),
    entrega_cnpj character varying(200),
    entrega_xlgr character varying(200),
    entrega_nro character varying(5),
    entrega_xcpl character varying(300),
    entrega_xbairro character varying(200),
    entrega_cmun character varying(20),
    entrega_xmun character varying(300),
    entrega_uf character varying(2),
    icmstot_vbc double precision,
    icmstot_vicms double precision,
    icmstot_vbcst double precision,
    icmstot_vprod double precision,
    icmstot_vpis double precision,
    icmstot_vcofins double precision,
    icmstot_vnf double precision,
    transp_modfrete character varying(200),
    transporta_cnpjcpf character varying(100),
    transporta_xnome character varying(300),
    transporta_ie character varying(100),
    transporta_xender character varying(300),
    transporta_xmun character varying(300),
    transporta_uf character varying(2),
    infadfisco character varying(1000),
    infcpl_contrib character varying(1000),
    ide_tpimp character varying(30),
    cdv character varying(20),
    verproc character varying(30),
    voutro character varying(50),
    vnf character varying(50),
    modfrete character varying(50),
    transporta_qvol character varying(50),
    transporta_esp character varying(50),
    fat_nfat character varying,
    fat_infadic character varying(50),
    fat_infcpl character varying(50),
    protnfe_versao character varying(50),
    infprot_id character varying(50),
    tpamb character varying(50),
    veraplic character varying(50),
    chnfe character varying(50),
    dhrecbto character varying(50),
    nprot character varying(50),
    digval character varying(50),
    csta character varying(50),
    xmotivo character varying(50),
    pesol double precision,
    pesob double precision,
    consumidor_final character varying(30),
    tipo_contribuinte character varying(30),
    chave_acesso character varying(30)
);


ALTER TABLE nfe OWNER TO postgres;

--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE nfe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE nfe IS 'tabela do emissor de nota fiscal ';


--
-- TOC entry 222 (class 1259 OID 16529)
-- Name: nfe_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nfe_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nfe_codigo_seq OWNER TO postgres;

--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 222
-- Name: nfe_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nfe_codigo_seq OWNED BY nfe.codigo;


--
-- TOC entry 223 (class 1259 OID 16531)
-- Name: nfe_det; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nfe_det (
    codigo integer NOT NULL,
    num_nfe integer,
    infadprod character varying(200),
    prod_nitem integer,
    prod_cprod character varying(70),
    prod_xprod character varying(500),
    prod_ncm character varying(200),
    prod_extipi character varying(200),
    prod_genero character varying(200),
    prod_cfop character varying(8),
    prod_ucom character varying(200),
    prod_qcom double precision,
    prod_vuncom double precision,
    prod_vprod double precision,
    prod_utrib character varying(20),
    prod_qtrib double precision,
    prod_vuntrib double precision,
    ean character varying(70),
    utrib character varying(50),
    qtrib character varying(50),
    vuntrib character varying(50),
    indtot character varying(50),
    orig character varying(50),
    csosn character varying(50),
    pcredsn character varying(50),
    vcredicmssn character varying(50),
    pis_cst character varying(50),
    pis_vbc character varying(50),
    ppis character varying(50),
    vpis character varying(50),
    vbc character varying(50),
    pconfins character varying(50),
    vconfins character varying(50),
    pisst double precision,
    pissttc character varying,
    confinsst double precision,
    confinssttc character varying,
    pedido_compra character varying,
    item_pedido_compra character varying,
    frete double precision,
    pesounit double precision,
    cst character varying,
    vtottrib double precision
);


ALTER TABLE nfe_det OWNER TO postgres;

--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE nfe_det; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE nfe_det IS 'itens do emissor nota fiscal';


--
-- TOC entry 224 (class 1259 OID 16537)
-- Name: nfe_det_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nfe_det_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nfe_det_codigo_seq OWNER TO postgres;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 224
-- Name: nfe_det_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nfe_det_codigo_seq OWNED BY nfe_det.codigo;


--
-- TOC entry 225 (class 1259 OID 16539)
-- Name: origem_prod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE origem_prod (
    codigo integer NOT NULL,
    descricao character varying
);


ALTER TABLE origem_prod OWNER TO postgres;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE origem_prod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE origem_prod IS 'origem do produto';


--
-- TOC entry 226 (class 1259 OID 16545)
-- Name: origem_prod_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE origem_prod_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE origem_prod_codigo_seq OWNER TO postgres;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 226
-- Name: origem_prod_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE origem_prod_codigo_seq OWNED BY origem_prod.codigo;


--
-- TOC entry 227 (class 1259 OID 16547)
-- Name: os; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE os (
    codigo integer NOT NULL,
    cliente character varying(150),
    end_cli character varying(150),
    fone_clie character varying(15),
    vr_total_os double precision,
    observacao character varying,
    cond_pag character varying(50),
    vl_pecas double precision,
    vl_serv double precision,
    status character varying(30),
    tipo character varying(50),
    apelido character varying(50),
    data_emissao character varying(20),
    vencimento character varying(20),
    a_c character varying(50),
    nota1 character varying(100),
    nota2 character varying(100),
    nota character varying(100),
    nota3 character varying(100),
    nota4 character varying(100),
    nota5 character varying(100),
    total_custos_pecas double precision,
    total_custos_serv double precision,
    baixar_estoque character(1),
    requer_assin character(1),
    clie_tipo character varying(20),
    empresa character varying(200),
    referencia character varying(200),
    transport character varying(200),
    tipo_id integer,
    status_id integer,
    clienteid integer,
    empresaid integer,
    rastreamento character varying,
    status_rastreamento text,
    observacao_interna character varying,
    previsao_entrega date,
    nome_vendedor character varying,
    email_rastreamento character varying
);


ALTER TABLE os OWNER TO postgres;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE os IS 'ordens de serviço , orçamentos , pedidos etc';


--
-- TOC entry 228 (class 1259 OID 16553)
-- Name: os_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE os_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE os_codigo_seq OWNER TO postgres;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 228
-- Name: os_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_codigo_seq OWNED BY os.codigo;


--
-- TOC entry 229 (class 1259 OID 16555)
-- Name: os_pecas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE os_pecas (
    codigo integer NOT NULL,
    os integer,
    descricao text,
    quant double precision,
    vr_unit double precision,
    vr_total double precision,
    referencia_prod character varying(15),
    tipo character varying(30),
    unid_med character(2),
    dias character varying(30),
    total_custos double precision,
    custo_un_pecas double precision,
    ipi double precision,
    frete double precision,
    lucro double precision,
    peso double precision,
    plucro double precision
);


ALTER TABLE os_pecas OWNER TO postgres;

--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE os_pecas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE os_pecas IS 'itens produtos de um orçamento';


--
-- TOC entry 230 (class 1259 OID 16561)
-- Name: os_pecas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE os_pecas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE os_pecas_codigo_seq OWNER TO postgres;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 230
-- Name: os_pecas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_pecas_codigo_seq OWNED BY os_pecas.codigo;


--
-- TOC entry 231 (class 1259 OID 16563)
-- Name: os_servicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE os_servicos (
    codigo integer NOT NULL,
    os integer,
    descricao text,
    quant double precision,
    vr_unit double precision,
    vr_total double precision,
    unid_med character varying(4),
    dias character varying(30),
    lucro double precision,
    custo_servico double precision
);


ALTER TABLE os_servicos OWNER TO postgres;

--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE os_servicos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE os_servicos IS 'itens serviços de um orçamento';


--
-- TOC entry 232 (class 1259 OID 16569)
-- Name: os_servicos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE os_servicos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE os_servicos_codigo_seq OWNER TO postgres;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 232
-- Name: os_servicos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_servicos_codigo_seq OWNED BY os_servicos.codigo;


--
-- TOC entry 233 (class 1259 OID 16571)
-- Name: prazos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prazos (
    codigo integer NOT NULL,
    descricao character varying(30),
    dias integer
);


ALTER TABLE prazos OWNER TO postgres;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE prazos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE prazos IS 'lista de prazos (entrega , pagamento etc)';


--
-- TOC entry 234 (class 1259 OID 16574)
-- Name: prazos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prazos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prazos_codigo_seq OWNER TO postgres;

--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 234
-- Name: prazos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prazos_codigo_seq OWNED BY prazos.codigo;


--
-- TOC entry 235 (class 1259 OID 16576)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produtos (
    codigo integer NOT NULL,
    cod_prod character varying(50),
    descricao character varying(400),
    vl_unit double precision,
    ipi double precision,
    vl_custo double precision,
    vl_venda double precision,
    estoque_atual double precision,
    ncm character varying(50),
    peso double precision,
    foto_produto text,
    lucrotabela1 double precision,
    lucrotabela2 double precision,
    lucrotabela3 double precision,
    lucrotabela4 double precision,
    lucrotabela5 double precision,
    lucrotabela6 double precision
);


ALTER TABLE produtos OWNER TO postgres;

--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE produtos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE produtos IS 'tabela de produtos';


--
-- TOC entry 236 (class 1259 OID 16582)
-- Name: produtos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produtos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produtos_codigo_seq OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 236
-- Name: produtos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produtos_codigo_seq OWNED BY produtos.codigo;


--
-- TOC entry 237 (class 1259 OID 16584)
-- Name: produtos_composicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produtos_composicao (
    id integer NOT NULL,
    id_produto integer,
    quantidade double precision,
    id_itemproduto integer
);


ALTER TABLE produtos_composicao OWNER TO postgres;

--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE produtos_composicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE produtos_composicao IS 'id_produto,quantidade,id_itemproduto
composição do produto (lista de peças para fabricação)';


--
-- TOC entry 238 (class 1259 OID 16587)
-- Name: produtos_composicao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produtos_composicao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produtos_composicao_id_seq OWNER TO postgres;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 238
-- Name: produtos_composicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produtos_composicao_id_seq OWNED BY produtos_composicao.id;


--
-- TOC entry 239 (class 1259 OID 16589)
-- Name: produtos_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produtos_fornecedores (
    id integer NOT NULL,
    id_produto integer,
    id_cadastro integer
);


ALTER TABLE produtos_fornecedores OWNER TO postgres;

--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE produtos_fornecedores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE produtos_fornecedores IS 'fornecedores para cada produto';


--
-- TOC entry 240 (class 1259 OID 16592)
-- Name: produtos_fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produtos_fornecedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produtos_fornecedores_id_seq OWNER TO postgres;

--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 240
-- Name: produtos_fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produtos_fornecedores_id_seq OWNED BY produtos_fornecedores.id;


--
-- TOC entry 241 (class 1259 OID 16594)
-- Name: status_contas_pag_rec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_contas_pag_rec (
    codigo integer NOT NULL,
    descricao character varying(100)
);


ALTER TABLE status_contas_pag_rec OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE status_contas_pag_rec; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE status_contas_pag_rec IS 'estado das contas (a pagar , receber , etc)';


--
-- TOC entry 242 (class 1259 OID 16597)
-- Name: status_contas_pag_rec_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_contas_pag_rec_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_contas_pag_rec_codigo_seq OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 242
-- Name: status_contas_pag_rec_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_contas_pag_rec_codigo_seq OWNED BY status_contas_pag_rec.codigo;


--
-- TOC entry 243 (class 1259 OID 16599)
-- Name: status_os; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_os (
    id integer NOT NULL,
    descricao character varying(200)
);


ALTER TABLE status_os OWNER TO postgres;

--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE status_os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE status_os IS 'estado da os (aberto ,encerrado etc)';


--
-- TOC entry 244 (class 1259 OID 16602)
-- Name: status_os_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_os_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_os_id_seq OWNER TO postgres;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 244
-- Name: status_os_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_os_id_seq OWNED BY status_os.id;


--
-- TOC entry 245 (class 1259 OID 16604)
-- Name: tipo_os; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_os (
    codigo integer NOT NULL,
    descricao character varying(200),
    baixar_estoque character(1),
    requer_assin character(1)
);


ALTER TABLE tipo_os OWNER TO postgres;

--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE tipo_os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_os IS 'tipos de os (orçamento,pedido etc)';


--
-- TOC entry 246 (class 1259 OID 16607)
-- Name: tipo_os_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_os_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_os_codigo_seq OWNER TO postgres;

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_os_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_os_codigo_seq OWNED BY tipo_os.codigo;


--
-- TOC entry 247 (class 1259 OID 16609)
-- Name: uf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE uf (
    iduf character varying(10) NOT NULL,
    sigla character varying(3)
);


ALTER TABLE uf OWNER TO postgres;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE uf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE uf IS 'relação dos estados brasileiros';


--
-- TOC entry 248 (class 1259 OID 16612)
-- Name: unid_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE unid_medida (
    codigo integer NOT NULL,
    sigla character(4),
    descricao character varying(30)
);


ALTER TABLE unid_medida OWNER TO postgres;

--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE unid_medida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unid_medida IS 'unidades de medida usados no orçamento';


--
-- TOC entry 249 (class 1259 OID 16615)
-- Name: unid_medida_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unid_medida_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unid_medida_codigo_seq OWNER TO postgres;

--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 249
-- Name: unid_medida_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unid_medida_codigo_seq OWNED BY unid_medida.codigo;


--
-- TOC entry 2171 (class 2604 OID 16618)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY boleto ALTER COLUMN id SET DEFAULT nextval('boleto_id_seq'::regclass);


--
-- TOC entry 2172 (class 2604 OID 16619)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cadastro ALTER COLUMN codigo SET DEFAULT nextval('cadastro_codigo_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 16620)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cadastro_contatos ALTER COLUMN id SET DEFAULT nextval('cadastro_contatos_id_seq'::regclass);


--
-- TOC entry 2174 (class 2604 OID 16621)
-- Name: codigo_cc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY centro_custo ALTER COLUMN codigo_cc SET DEFAULT nextval('centro_custo_codigo_cc_seq'::regclass);


--
-- TOC entry 2175 (class 2604 OID 16622)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta_banco ALTER COLUMN codigo SET DEFAULT nextval('conta_banco_codigo_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 16623)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contas_pag_receb ALTER COLUMN codigo SET DEFAULT nextval('contas_pag_receb_codigo_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 16624)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN codigo SET DEFAULT nextval('empresa_codigo_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 16628)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forma_pag ALTER COLUMN codigo SET DEFAULT nextval('forma_pag_codigo_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 16629)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instrucoes_os ALTER COLUMN codigo SET DEFAULT nextval('instrucoes_os_codigo_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 16630)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_cte ALTER COLUMN id SET DEFAULT nextval('lancamento_cte_id_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 16631)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais ALTER COLUMN id SET DEFAULT nextval('lancamento_notas_fiscais_id_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 16632)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais_itens ALTER COLUMN id SET DEFAULT nextval('lancamento_notas_fiscais_itens_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 16633)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais_itens_baixa ALTER COLUMN id SET DEFAULT nextval('lancamento_notas_fiscais_itens_baixa_id_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 16634)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mala_direta ALTER COLUMN codigo SET DEFAULT nextval('mala_direta_codigo_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 16635)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nfe ALTER COLUMN codigo SET DEFAULT nextval('nfe_codigo_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 16636)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nfe_det ALTER COLUMN codigo SET DEFAULT nextval('nfe_det_codigo_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 16637)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY origem_prod ALTER COLUMN codigo SET DEFAULT nextval('origem_prod_codigo_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 16638)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os ALTER COLUMN codigo SET DEFAULT nextval('os_codigo_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 16639)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_pecas ALTER COLUMN codigo SET DEFAULT nextval('os_pecas_codigo_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 16640)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_servicos ALTER COLUMN codigo SET DEFAULT nextval('os_servicos_codigo_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 16641)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prazos ALTER COLUMN codigo SET DEFAULT nextval('prazos_codigo_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 16642)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos ALTER COLUMN codigo SET DEFAULT nextval('produtos_codigo_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 16643)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_composicao ALTER COLUMN id SET DEFAULT nextval('produtos_composicao_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 16644)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_fornecedores ALTER COLUMN id SET DEFAULT nextval('produtos_fornecedores_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 16645)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_contas_pag_rec ALTER COLUMN codigo SET DEFAULT nextval('status_contas_pag_rec_codigo_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 16646)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_os ALTER COLUMN id SET DEFAULT nextval('status_os_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 16647)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_os ALTER COLUMN codigo SET DEFAULT nextval('tipo_os_codigo_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 16648)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unid_medida ALTER COLUMN codigo SET DEFAULT nextval('unid_medida_codigo_seq'::regclass);


--
-- TOC entry 2386 (class 0 OID 16393)
-- Dependencies: 183
-- Data for Name: boleto; Type: TABLE DATA; Schema: public; Owner: postgres
--





COPY centro_custo (codigo_cc, descricao_cc) FROM stdin;
1	CARTÃO DE CREDITO
12	A VISTA NO CAIXA
6	CONTAS ANUAIS E IMPOSTOS
7	BOLETO
8	DOC.
9	TRANSF. BANCÁRIA
10	DEPOSITO EM CONTA
\.


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 190
-- Name: centro_custo_codigo_cc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('centro_custo_codigo_cc_seq', 13, true);


--
-- TOC entry 2394 (class 0 OID 16422)
-- Dependencies: 191
-- Data for Name: cfop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cfop (codigo, descricao) FROM stdin;
5101	5101 - VENDA PRODUTO DO ESTABELECIMENTO DENTRO ESTADO
5102	5102 - VENDA MERC. ADQUIRIDA TERCEIROS DENTRO ESTADO
6101	6101 - VENDA PRODUTO DO ESTABELECIMENTO FORA DO ESTADO
6102	6102 - VENDA MERC. ADQUIRIDA TERCEIROS FORA DO ESTADO
5927	5927 - BAIXA DE ESTOQUE DECORRENTE DE PERDA, ROUBO OU DETERIORACAO
2201	2201 - DEVOLUCAO DE VENDA DE PRODUTO DO ESTABELECIMENTO
6109	6109 - VENDA DE PRODUCAO DO ESTABELECIMENTO DESTINADO A ZONA FRANCA DE
6107	6107 - VENDA DE PRODUCAO DO ESTABELECIMENTO, DESTINADA A NAO CONTRIBUI
6108	6108 - VENDA DE MERCADORIA ADQUIRIDA OU RECEBIDA DE TERCEIROS, DESTINA
\.


--
-- TOC entry 2395 (class 0 OID 16425)
-- Dependencies: 192
-- Data for Name: conta_banco; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY empresa (codigo, razao_social, endereco, uf, cep, email, site, skype, nome_fantasia_1, numero, fone, cnpj, ie, msn, bairro, municipio, complemento) FROM stdin;							1							\N
1	SUA EMPRESA	AV.: SEU ENDERECO	ES	29999-999	dsdsds@suaemp.com.br	www.suaemp.com.br	suaemp	sua	1	(27)2222-2222	01.111.111/0001-11	011.111.11-0	c@hotmail.com	b 1	Ldda	LOJA 1
\.


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 197
-- Name: empresa_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_codigo_seq', 4, true);


--
-- TOC entry 2401 (class 0 OID 16473)
-- Dependencies: 206
-- Data for Name: forma_pag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY forma_pag (codigo, descricao, tes) FROM stdin;
1	BOLETO BRADESCO	T2
2	BOLETO ITAU	T1
\.


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 207
-- Name: forma_pag_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('forma_pag_codigo_seq', 3, true);


--
-- TOC entry 2403 (class 0 OID 16478)
-- Dependencies: 208
-- Data for Name: instrucoes_os; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instrucoes_os (codigo, descricao) FROM stdin;
1	* NÃO ACEITAMOS DEVOLUÇÃO DE MERCADORIA
2	* ORÇAMENTO VALIDO POR 3 DIAS
3	* FRETE INCLUSO
8	* PRAZO DE ENTREGA PODERÃO SER REVISTOS NO ATO DO FECHAMENTO DO PEDIDO
10	* VENDAS A PRAZO(28DIAS) SUJEITO A APROVAÇÃO DE CREDITO .
11	* FATURAMENTO MINIMO R$150,00 OU A VISTA QUALQUER VALOR.
\.


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 209
-- Name: instrucoes_os_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instrucoes_os_codigo_seq', 11, true);


--
-- TOC entry 2405 (class 0 OID 16483)
-- Dependencies: 210
-- Data for Name: lancamento_cte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lancamento_cte (id, ide_cuf, ide_cct, ide_cfop, ide_natop, ide_forpag, ide_mod, ide_serie, ide_nct, ide_dhemi, ide_tpimp, ide_tpemis, ide_cdv, ide_tpamb, ide_tpcte, ide_procemi, ide_verproc, ide_cmunenv, ide_xmunenv, ide_ufenv, ide_modal, ide_tpserv, ide_cmunini, ide_xmunini, ide_ufini, ide_cmunfim, ide_xmunfim, ide_uffim, ide_retira, ide_toma03_toma, compl_xcaracad, compl_xcaracser, emit_cnpj, emit_ie, emit_xnome, emit_enderemi_xlgr, emit_enderemi_nro, emit_enderemi_xcpl, emit_enderemi_xbairro, emit_enderemi_cmun, emit_enderemi_xmun, emit_enderemi_cep, emit_enderemi_uf, emit_enderemi_fone, rem_cnpj, rem_ie, rem_xnome, rem_fone, rem_enderreme_xlgr, rem_enderreme_nro, rem_enderreme_xbairro, rem_enderreme_cmun, rem_enderreme_xmun, rem_enderreme_cep, rem_enderreme_uf, dest_cnpj, dest_ie, dest_xnome, dest_fone, dest_enderdest_xlgr, dest_enderdest_nro, dest_enderdest_xbairro, dest_enderdest_cmun, dest_enderdest_xmun, dest_enderdest_cep, dest_enderdest_uf, cod_inf, chcte) FROM stdin;
\.


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 211
-- Name: lancamento_cte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--


COPY municipios (id, iduf, nome) FROM stdin;
1101500	11	Seringueiras
1100049	11	Cacoal
1100288	11	Rolim de Moura
1100379	11	Alto Alegre dos Parecis
1100502	11	Novo Horizonte do Oeste
1100908	11	Castanheiras
1101203	11	Ministro Andreazza
1100189	11	Pimenta Bueno
1100304	11	Vilhena
1100924	11	Chupinguaia
1101450	11	Parecis
1100031	11	Cabixi
1100056	11	Cerejeiras
1100064	11	Colorado do Oeste
1100072	11	Corumbiara
1101468	11	Pimenteiras do Oeste
1200203	12	Cruzeiro do Sul
1200351	12	Marechal Thaumaturgo
1200393	12	Porto Walter
1200427	12	Rodrigues Alves
1200344	12	Manoel Urbano
1200435	12	Santa Rosa do Purus
1200500	12	Sena Madureira
1200138	12	Bujari
1200179	12	Capixaba
1200401	12	Rio Branco
1200450	12	Senador Guiomard
1200807	12	Porto Acre
1200054	12	Assis Brasil
1200708	12	Xapuri
1300409	13	Barcelos
1100205	11	Porto Velho
1100452	11	Buritis
1100809	11	Candeias do Jamari
1100940	11	Cujubim
1100080	11	Costa Marques
1100023	11	Ariquemes
1100262	11	Rio Crespo
1101401	11	Monte Negro
1101757	11	Vale do Anari
1100114	11	Jaru
1100155	11	Ouro Preto do Oeste
1101005	11	Governador Jorge Teixeira
1101302	11	Mirante da Serra
1101609	11	Theobroma
1303601	13	Santa Isabel do Rio Negro
1300201	13	Atalaia do Norte
1300607	13	Benjamin Constant
1301605	13	Fonte Boa
1304062	13	Tabatinga
1304237	13	Tonantins
1301001	13	Carauari
1301506	13	Envira
1301803	13	Ipixuna
1301951	13	Itamarati
1304260	13	Uarini
1300102	13	Anori
1300631	13	Beruri
1300839	13	Caapiranga
1301209	13	Coari
1300300	13	Autazes
1301100	13	Careiro
1301852	13	Iranduba
1302504	13	Manacapuru
1302553	13	Manaquiri
1302603	13	Manaus
1303536	13	Presidente Figueiredo
1303569	13	Rio Preto da Eva
1301902	13	Itacoatiara
1302009	13	Itapiranga
1303106	13	Nova Olinda do Norte
1304005	13	Silves
1304401	13	Urucurituba
1300508	13	Barreirinha
1300680	13	Boa Vista do Ramos
1303403	13	Parintins
1300706	13	Boca do Acre
1303502	13	Pauini
1300904	13	Canutama
1300805	13	Borba
1400027	14	Amajari
1400050	14	Alto Alegre
1400100	14	Boa Vista
1400456	14	Pacaraima
1400159	14	Bonfim
1400407	14	Normandia
1400282	14	Iracema
1400233	14	Caroebe
1503002	15	Faro
1503903	15	Juruti
1100098	11	Espigao D Oeste
1100106	11	Guajara-Mirim
1100122	11	Ji-Parana
1100254	11	Presidente Medici
1100296	11	Santa Luzia D Oeste
1101104	11	Itapua do Oeste
1100338	11	Nova Mamore
1100346	11	Alvorada D Oeste
1100403	11	Alto Paraiso
1100601	11	Cacaulandia
1100700	11	Campo Novo de Rondonia
1101435	11	Nova Uniao
1101476	11	Primavera de Rondonia
1101484	11	Sao Felipe D Oeste
1101559	11	Teixeiropolis
1101708	11	Urupa
1101807	11	Vale do Paraiso
1200013	12	Acrelandia
1200104	12	Brasileia
1200252	12	Epitaciolandia
1200302	12	Feijo
1200328	12	Jordao
1200336	12	Mancio Lima
1200385	12	Placido de Castro
1200609	12	Tarauaca
1300029	13	Alvaraes
1300060	13	Amatura
1300086	13	Anama
1300144	13	Apui
1301308	13	Codajas
1301407	13	Eirunepe
1301654	13	Guajara
1301704	13	Humaita
1302108	13	Japura
1302207	13	Jurua
1302306	13	Jutai
1302405	13	Labrea
1302702	13	Manicore
1302801	13	Maraa
1303007	13	Nhamunda
1303205	13	Novo Airao
1303304	13	Novo Aripuana
1303700	13	Santo Antonio do Ica
1303809	13	Sao Gabriel da Cachoeira
1303908	13	Sao Paulo de Olivenca
1303957	13	Sao Sebastiao do Uatuma
1304104	13	Tapaua
1304203	13	Tefe
1304302	13	Urucara
1400175	14	Canta
1400209	14	Caracarai
1400308	14	Mucajai
1400472	14	Rorainopolis
1400605	14	Sao Luiz
1400704	14	Uiramuta
1100320	11	Sao Miguel do Guapore
1100148	11	Nova Brasilandia D Oeste
1507979	15	Terra Santa
1500404	15	Alenquer
1501451	15	Belterra
1504802	15	Monte Alegre
1505650	15	Placas
1506005	15	Prainha
1500503	15	Almeirim
1505908	15	Porto de Moz
1501105	15	Bagre
1505809	15	Portel
1501808	15	Breves
1502806	15	Curralinho
1502004	15	Cachoeira do Arari
1502509	15	Chaves
1505700	15	Ponta de Pedras
1506302	15	Salvaterra
1506401	15	Santa Cruz do Arari
1507904	15	Soure
1500800	15	Ananindeua
1501303	15	Barcarena
1501501	15	Benevides
1504422	15	Marituba
1501907	15	Bujaru
1502400	15	Castanhal
1503408	15	Inhangapi
1502608	15	Colares
1504406	15	Marapanim
1507961	15	Terra Alta
1508209	15	Vigia
1501600	15	Bonito
1502202	15	Capanema
1505007	15	Nova Timboteua
1505601	15	Peixe-Boi
1506104	15	Primavera
1506112	15	Quatipuru
1508035	15	Tracuateua
1500107	15	Abaetetuba
1504000	15	Limoeiro do Ajuru
1504604	15	Mocajuba
1504703	15	Moju
1503507	15	Irituia
1508308	15	Viseu
1501006	15	Aveiro
1503606	15	Itaituba
1503754	15	Jacareacanga
1505031	15	Novo Progresso
1500602	15	Altamira
1500859	15	Anapu
1501725	15	Brasil Novo
1501782	15	Breu Branco
1503705	15	Itupiranga
1504976	15	Nova Ipixuna
1505064	15	Novo Repartimento
1500131	15	Abel Figueiredo
1501576	15	Bom Jesus do Tocantins
1502939	15	Dom Eliseu
1505502	15	Paragominas
1501253	15	Bannach
1502764	15	Cumaru do Norte
1505536	15	Parauapebas
1501758	15	Brejo Grande do Araguaia
1506161	15	Rio Maria
1507755	15	Sapucaia
1508407	15	Xinguara
1503044	15	Floresta do Araguaia
1506583	15	Santa Maria das Barreiras
1506708	15	Santana do Araguaia
1600501	16	Oiapoque
1600709	16	Tartarugalzinho
1600055	16	Serra do Navio
1600154	16	Pedra Branca do Amapari
1600212	16	Cutias
1600238	16	Ferreira Gomes
1600253	16	Itaubal
1500305	15	Afua
1500347	15	Agua Azul do Norte
1500701	15	Anajas
1500909	15	Augusto Correa
1500958	15	Aurora do Para
1501204	15	Baiao
1501402	15	Belem
1501709	15	Braganca
1502103	15	Cameta
1502152	15	Canaa dos Carajas
1502301	15	Capitao Poco
1502707	15	Conceicao do Araguaia
1502756	15	Concordia do Para
1502772	15	Curionopolis
1502855	15	Curua
1502905	15	Curuca
1502954	15	Eldorado dos Carajas
1503093	15	Goianesia do Para
1503101	15	Gurupa
1503200	15	Igarape-Acu
1503309	15	Igarape-Miri
1503457	15	Ipixuna do Para
1503804	15	Jacunda
1504059	15	Mae do Rio
1504109	15	Magalhaes Barata
1504208	15	Maraba
1504307	15	Maracana
1504455	15	Medicilandia
1504505	15	Melgaco
1504901	15	Muana
1505106	15	Obidos
1505205	15	Oeiras do Para
1505304	15	Oriximina
1505403	15	Ourem
1505437	15	Ourilandia do Norte
1505486	15	Pacaja
1505494	15	Palestina do Para
1505551	15	Pau D Arco
1505635	15	Picarra
1506138	15	Redencao
1506187	15	Rondon do Para
1506195	15	Ruropolis
1506203	15	Salinopolis
1506351	15	Santa Barbara do Para
1506500	15	Santa Isabel do Para
1506559	15	Santa Luzia do Para
1506609	15	Santa Maria do Para
1506807	15	Santarem
1506906	15	Santarem Novo
1507102	15	Sao Caetano de Odivelas
1507151	15	Sao Domingos do Araguaia
1507201	15	Sao Domingos do Capim
1507300	15	Sao Felix do Xingu
1507409	15	Sao Francisco do Para
1507458	15	Sao Geraldo do Araguaia
1507466	15	Sao Joao da Ponta
1507474	15	Sao Joao de Pirabas
1507508	15	Sao Joao do Araguaia
1507607	15	Sao Miguel do Guama
1507706	15	Sao Sebastiao da Boa Vista
1507805	15	Senador Jose Porfirio
1507953	15	Tailandia
1508001	15	Tome-Acu
1508050	15	Trairao
1508084	15	Tucuma
1508100	15	Tucurui
1508126	15	Ulianopolis
1508159	15	Uruara
1508357	15	Vitoria do Xingu
1600105	16	Amapa
1600204	16	Calcoene
1600550	16	Pracuuba
1600535	16	Porto Grande
1600600	16	Santana
1600279	16	Laranjal do Jari
1701051	17	Angico
1702208	17	Araguatins
1703800	17	Buriti do Tocantins
1703826	17	Cachoeirinha
1703891	17	Carrasco Bonito
1707405	17	Esperantina
1710706	17	Itaguatins
1713809	17	Palmeiras do Tocantins
1718303	17	Praia Norte
1718550	17	Riachinho
1718808	17	Sampaio
1720002	17	Santa Terezinha do Tocantins
1701309	17	Aragominas
1702307	17	Arapoema
1703057	17	Bandeirantes do Tocantins
1705508	17	Colinas do Tocantins
1714880	17	Nova Olinda
1715705	17	Palmeirante
1701903	17	Araguacema
1703909	17	Caseara
1708304	17	Goianorte
1711803	17	Juarina
1713205	17	Miracema do Tocantins
1713304	17	Miranorte
1713700	17	Monte Santo do Tocantins
1716653	17	Pequizeiro
1718402	17	Presidente Kennedy
1718709	17	Rio dos Bois
1721257	17	Tupirama
1721307	17	Tupiratins
1704600	17	Chapada de Areia
1708205	17	Formoso do Araguaia
1717503	17	Pium
1718451	17	Pugmil
1700707	17	Alvorada
1703867	17	Cariri do Tocantins
1709500	17	Gurupi
1716604	17	Peixe
1718899	17	Santa Rita do Tocantins
1720853	17	Sucupira
1701101	17	Aparecida do Rio Negro
1703305	17	Bom Jesus do Tocantins
1709807	17	Ipueiras
1712009	17	Lajeado
1713601	17	Monte do Carmo
1716505	17	Pedro Afonso
1718204	17	Porto Nacional
1718881	17	Santa Maria do Tocantins
1721000	17	Palmas
1703073	17	Barra do Ouro
1703842	17	Campos Lindos
1709005	17	Goiatins
1710904	17	Itapiratins
1711951	17	Lagoa do Tocantins
1712405	17	Lizarda
1712702	17	Mateiros
1715101	17	Novo Acordo
1717909	17	Ponte Alta do Tocantins
1718758	17	Rio Sono
1719004	17	Santa Tereza do Tocantins
1700400	17	Almas
1702406	17	Arraias
1702703	17	Aurora do Tocantins
1705102	17	Chapada da Natividade
1705557	17	Combinado
1712157	17	Lavandeira
1714203	17	Natividade
1715150	17	Novo Alegre
1715259	17	Novo Jardim
1717008	17	Pindorama do Tocantins
1717800	17	Ponte Alta do Bom Jesus
1718006	17	Porto Alegre do Tocantins
1718907	17	Santa Rosa do Tocantins
1720903	17	Taguatinga
1720937	17	Taipas do Tocantins
1600303	16	Macapa
1600808	16	Vitoria do Jari
1700301	17	Aguiarnopolis
1700350	17	Alianca do Tocantins
1701002	17	Ananas
1702000	17	Araguacu
1702109	17	Araguaina
1702158	17	Araguana
1702554	17	Augustinopolis
1702901	17	Axixa do Tocantins
1703008	17	Babaculandia
1703107	17	Barrolandia
1703206	17	Bernardo Sayao
1703883	17	Carmolandia
1704105	17	Centenario
1705607	17	Conceicao do Tocantins
1706001	17	Couto de Magalhaes
1706100	17	Cristalandia
1706258	17	Crixas do Tocantins
1706506	17	Darcinopolis
1707009	17	Dianopolis
1707108	17	Divinopolis do Tocantins
1707207	17	Dois Irmaos do Tocantins
1707306	17	Duere
1707553	17	Fatima
1707652	17	Figueiropolis
1707702	17	Filadelfia
1708254	17	Fortaleza do Tabocao
1709302	17	Guarai
1710508	17	Itacaja
1711506	17	Jau do Tocantins
1711902	17	Lagoa da Confusao
1712454	17	Luzinopolis
1712801	17	Maurilandia do Tocantins
1713957	17	Muricilandia
1714302	17	Nazare
1715002	17	Nova Rosalandia
1715507	17	Oliveira de Fatima
1715754	17	Palmeiropolis
1716109	17	Paraiso do Tocantins
1716208	17	Parana
1716307	17	Pau D Arco
1716703	17	Colmeia
1717206	17	Piraque
1718501	17	Recursolandia
1718659	17	Rio da Conceicao
1718840	17	Sandolandia
1718865	17	Santa Fe do Araguaia
1720101	17	Sao Bento do Tocantins
1720150	17	Sao Felix do Tocantins
1720200	17	Sao Miguel do Tocantins
1720259	17	Sao Salvador do Tocantins
1720499	17	Sao Valerio da Natividade
1720655	17	Silvanopolis
1720804	17	Sitio Novo do Tocantins
1720978	17	Talisma
1721109	17	Tocantinia
1721208	17	Tocantinopolis
1722081	17	Wanderlandia
1722107	17	Xambioa
2100204	21	Alcantara
1700251	17	Abreulandia
1711100	17	Itapora do Tocantins
1703602	17	Brasilandia do Tocantins
2101301	21	Bacuri
2101350	21	Bacurituba
2103109	21	Cedral
2103703	21	Cururupu
2106805	21	Mirinzal
2109452	21	Raposa
2101251	21	Bacabeira
2102374	21	Cachoeira Grande
2105104	21	Icatu
2107100	21	Morros
2109205	21	Presidente Juscelino
2110203	21	Santa Rita
2101707	21	Barreirinhas
2105005	21	Humberto de Campos
2108058	21	Paulino Neves
2109403	21	Primeira Cruz
2100709	21	Anajatuba
2101004	21	Arari
2102507	21	Cajari
2106508	21	Matinha
2108306	21	Penalva
2108405	21	Peri Mirim
2108603	21	Pinheiro
2109270	21	Presidente Sarney
2109809	21	Santa Helena
2112803	21	Viana
2102705	21	Cantanhede
2105401	21	Itapecuru Mirim
2106755	21	Miranda do Norte
2107209	21	Nina Rodrigues
2108801	21	Pirapemas
2109304	21	Presidente Vargas
2112704	21	Vargem Grande
2101970	21	Boa Vista do Gurupi
2102903	21	Carutapera
2103158	21	Centro do Guilherme
2104305	21	Godofredo Viana
2104677	21	Governador Nunes Freire
2102002	21	Bom Jardim
2102036	21	Bom Jesus das Selvas
2102150	21	Brejo de Areia
2102325	21	Buriticupu
2104651	21	Governador Newton Bello
2105708	21	Lago da Pedra
2108108	21	Paulo Ramos
2110005	21	Santa Luzia
2113009	21	Vitorino Freire
2102358	21	Buritirana
2105302	21	Imperatriz
2105989	21	Lajeado Novo
2107001	21	Montes Altos
2109551	21	Ribamar Fiquene
2111763	21	Senador La Rocque
2101202	21	Bacabal
2101939	21	Bernardo do Mearim
2102077	21	Bom Lugar
2105807	21	Lago do Junco
2105906	21	Lago Verde
2105948	21	Lago dos Rodrigues
2106003	21	Lima Campos
2108207	21	Pedreiras
2108702	21	Pio XII
2111722	21	Satubinha
2112233	21	Trizidela do Vale
2100956	21	Arame
2101608	21	Barra do Corda
2104099	21	Formosa da Serra Negra
2105476	21	Jenipapo dos Vieiras
2112308	21	Tuntum
2103802	21	Dom Pedro
2104206	21	Fortuna
2104503	21	Governador Archer
2100600	21	Amarante do Maranhao
2100832	21	Apicum-Acu
2100873	21	Araguana
2101905	21	Bequimao
2102408	21	Cajapio
2103257	21	Cidelandia
2103125	21	Central do Maranhao
2103752	21	Davinopolis
2104008	21	Esperantinopolis
2104081	21	Fernando Falcao
2104800	21	Grajau
2104909	21	Guimaraes
2105153	21	Igarape do Meio
2105203	21	Igarape Grande
2105351	21	Itaipava do Grajau
2105500	21	Joao Lisboa
2105609	21	Joselandia
2106326	21	Maracacume
2106359	21	Maraja do Sena
2106375	21	Maranhaozinho
2106904	21	Moncao
2107456	21	Olinda Nova do Maranhao
2107506	21	Paco do Lumiar
2107605	21	Palmeirandia
2108256	21	Pedro do Rosario
2108504	21	Pindare-Mirim
2101103	21	Axixa
2101772	21	Bela Vista do Maranhao
2103174	21	Centro Novo do Maranhao
2104552	21	Governador Edison Lobao
2105427	21	Itinga do Maranhao
2105658	21	Junco do Maranhao
2105963	21	Lagoa Grande do Maranhao
2107357	21	Nova Olinda do Maranhao
2109056	21	Porto Rico do Maranhao
2109601	21	Rosario
2109908	21	Santa Ines
2110039	21	Santa Luzia do Parua
2110302	21	Santo Antonio dos Lopes
2110500	21	Sao Bento
2111029	21	Sao Joao do Caru
2110856	21	Sao Francisco do Brejao
2111201	21	Sao Jose de Ribamar
2111300	21	Sao Luis
2111409	21	Sao Luis Gonzaga do Maranhao
2111508	21	Sao Mateus do Maranhao
2111532	21	Sao Pedro da Agua Branca
2111631	21	Sao Raimundo do Doca Bezerra
2111672	21	Sao Roberto
2100402	21	Altamira do Maranhao
2100477	21	Alto Alegre do Pindare
2108900	21	Pocao de Pedras
2111003	21	Sao Joao Batista
2111706	21	Sao Vicente Ferrer
2112456	21	Turilandia
2112407	21	Turiacu
2112506	21	Tutoia
2112852	21	Vila Nova dos Martirios
2112902	21	Vitoria do Mearim
2114007	21	Ze Doca
2100550	21	Amapa do Maranhao
2106631	21	Matoes do Norte
2104628	21	Governador Luiz Rocha
2109106	21	Presidente Dutra
2111748	21	Senador Alexandre Costa
2100907	21	Araioses
2100808	21	Anapurus
2102101	21	Brejo
2102200	21	Buriti
2103208	21	Chapadinha
2106409	21	Mata Roma
2112605	21	Urbano Santos
2102754	21	Capinzal do Norte
2112100	21	Timbiras
2100105	21	Afonso Cunha
2100303	21	Aldeias Altas
2103406	21	Coelho Neto
2103901	21	Duque Bacelar
2102309	21	Buriti Bravo
2103000	21	Caxias
2107803	21	Parnarama
2112209	21	Timon
2103505	21	Colinas
2105922	21	Lagoa do Mato
2106706	21	Mirador
2107308	21	Nova Iorque
2107704	21	Paraibano
2102606	21	Candido Mendes
2104404	21	Goncalves Dias
2104701	21	Graca Aranha
2106201	21	Luis Domingues
2109239	21	Presidente Medici
2111805	21	Sitio Novo
2112274	21	Tufilandia
2107902	21	Passagem Franca
2108009	21	Pastos Bons
2111904	21	Sucupira do Norte
2102804	21	Carolina
2104057	21	Estreito
2109007	21	Porto Franco
2101400	21	Balsas
2112001	21	Tasso Fragoso
2101806	21	Benedito Leite
2104107	21	Fortaleza dos Nogueiras
2106102	21	Loreto
2107258	21	Nova Colinas
2201200	22	Barras
2201507	22	Batalha
2201770	22	Boa Hora
2201960	22	Brasileira
2203701	22	Esperantina
2205409	22	Joaquim Pires
2205458	22	Joca Marques
2205854	22	Madeiro
2206209	22	Miguel Alves
2208403	22	Piripiri
2208502	22	Porto
2202000	22	Buriti dos Lopes
2202083	22	Cajueiro da Praia
2202703	22	Cocal
2202729	22	Cocal dos Alves
2204659	22	Ilha Grande
2206696	22	Murici dos Portelas
2208304	22	Piracuruca
2200400	22	Altos
2201606	22	Beneditinos
2202737	22	Coivaras
2203255	22	Curralinhos
2205557	22	Lagoa Alegre
2206407	22	Monsenhor Gil
2211001	22	Teresina
2202026	22	Buriti dos Montes
2202208	22	Campo Maior
2202711	22	Cocal de Telha
2207900	22	Pedro II
2210656	22	Sigefredo Pacheco
2200509	22	Amarante
2201002	22	Arraial
2201408	22	Barro Duro
2204105	22	Francisco Ayres
2205250	22	Jardim do Mulato
2207504	22	Palmeirais
2200202	22	Agua Branca
2101731	21	Belagua
2101509	21	Barao de Grajau
2103604	21	Coroata
2104602	21	Governador Eugenio Barros
2105450	21	Jatoba
2106300	21	Magalhaes de Almeida
2104073	21	Feira Nova do Maranhao
2106672	21	Milagres do Maranhao
2108454	21	Peritoro
2109502	21	Riachao
2110104	21	Santa Quiteria do Maranhao
2110237	21	Santana do Maranhao
2110401	21	Sao Benedito do Rio Preto
2110609	21	Sao Bernardo
2200608	22	Angical do Piaui
2110658	21	Sao Domingos do Azeitao
2110906	21	Sao Francisco do Maranhao
2111052	21	Sao Joao do Paraiso
2111078	21	Sao Joao do Soter
2111102	21	Sao Joao dos Patos
2111573	21	Sao Pedro dos Crentes
2111607	21	Sao Raimundo das Mangabeiras
2202059	22	Cabeceiras do Piaui
2202174	22	Campo Largo do Piaui
2202539	22	Caraubas do Piaui
2202604	22	Castelo do Piaui
2202653	22	Caxingo
2100436	21	Alto Alegre do Maranhao
2200301	22	Alto Longa
2203305	22	Demerval Lobao
2204600	22	Hugo Napoleao
2205276	22	Jatoba do Piaui
2205508	22	Jose de Freitas
2205516	22	Juazeiro do Piaui
2205540	22	Lagoinha do Piaui
2205581	22	Lagoa do Piaui
2205706	22	Luis Correia
2205805	22	Luzilandia
2206100	22	Matias Olimpio
2206308	22	Miguel Leao
2206357	22	Milton Brandao
2206753	22	Nossa Senhora de Nazare
2206951	22	Novo Santo Antonio
2207108	22	Olho D Agua do Piaui
2110807	21	Sao Felix de Balsas
2201945	22	Boqueirao do Piaui
2201919	22	Bom Principio do Piaui
2202406	22	Capitao de Campos
2205573	22	Lagoa de Sao Francisco
2207793	22	Pau D Arco do Piaui
2207702	22	Parnaiba
2100501	21	Alto Parnaiba
2201051	22	Assuncao do Piaui
2209906	22	Sao Joao da Serra
2209872	22	Sao Joao da Fronteira
2209971	22	Sao Joao do Arraial
2210052	22	Sao Jose do Divino
2210409	22	Sao Miguel do Tapuio
2211100	22	Uniao
2103307	21	Codo
2106607	21	Matoes
2110708	21	Sao Domingos do Maranhao
2200905	22	Aroazes
2204709	22	Inhuma
2208106	22	Pimenteiras
2209153	22	Santa Cruz dos Milagres
2201150	22	Baixa Grande do Ribeiro
2209203	22	Santa Filomena
2203602	22	Eliseu Martins
2205607	22	Landri Sales
2206001	22	Marcos Parente
2202251	22	Canavieira
2203909	22	Floriano
2204501	22	Guadalupe
2205102	22	Itaueira
2205300	22	Jerumenha
2207850	22	Pavussu
2201903	22	Bom Jesus
2203107	22	Cristino Castro
2203230	22	Currais
2209302	22	Santa Luz
2202307	22	Canto do Buriti
2202505	22	Caracol
2203354	22	Dirceu Arcoverde
2204550	22	Guaribas
2205532	22	Jurema
2201101	22	Avelino Lopes
2202901	22	Corrente
2208858	22	Riacho Frio
2200954	22	Aroeiras do Itaim
2201804	22	Bocaina
2203404	22	Dom Expedito Lopes
2204352	22	Geminiano
2111953	21	Sucupira do Riachao
2203420	22	Domingos Mourao
2208809	22	Regeneracao
2109700	21	Sambaiba
2206803	22	Nossa Senhora dos Remedios
2207009	22	Oeiras
2208007	22	Picos
2210938	22	Sussuapara
2211704	22	Wall Ferraz
2204204	22	Francisco Santos
2208205	22	Pio IX
2202117	22	Campo Alegre do Fidalgo
2204154	22	Francisco Macedo
2204303	22	Fronteiras
2207207	22	Padre Marcos
2207306	22	Paes Landim
2207801	22	Paulistana
2207934	22	Pedro Laurentino
2207959	22	Nova Santa Rita
2208650	22	Queimada Nova
2202109	22	Campinas do Piaui
2202075	22	Cajazeiras do Piaui
2202133	22	Campo Grande do Piaui
2202554	22	Caridade do Piaui
2202778	22	Colonia do Piaui
2202802	22	Conceicao do Caninde
2202752	22	Colonia do Gurgueia
2203008	22	Cristalandia do Piaui
2203206	22	Curimata
2200251	22	Alagoinha do Piaui
2200277	22	Alegrete do Piaui
2202851	22	Coronel Jose Dias
2203271	22	Curral Novo do Piaui
2203503	22	Elesbao Veloso
2203750	22	Fartura do Piaui
2203800	22	Flores do Piaui
2203859	22	Floresta do Piaui
2204006	22	Francinopolis
2204402	22	Gilbues
2204808	22	Ipiranga do Piaui
2205003	22	Itainopolis
2204907	22	Isaias Coelho
2205201	22	Jaicos
2205359	22	Joao Costa
2205524	22	Julio Borges
2205599	22	Lagoa do Sitio
2205904	22	Manoel Emidio
2205953	22	Marcolandia
2206050	22	Massape do Piaui
2206506	22	Monsenhor Hipolito
2206605	22	Monte Alegre do Piaui
2206654	22	Morro Cabeca no Tempo
2207355	22	Pajeu do Piaui
2206704	22	Nazare do Piaui
2207405	22	Palmeira do Piaui
2200459	22	Alvorada do Gurgueia
2200707	22	Anisio de Abreu
2200806	22	Antonio Almeida
2201176	22	Barra D Alcantara
2201309	22	Barreiras do Piaui
2201556	22	Bela Vista do Piaui
2201572	22	Belem do Piaui
2201705	22	Bertolinia
2201739	22	Betania do Piaui
2201929	22	Bonfim do Piaui
2201988	22	Brejo do Piaui
2203453	22	Dom Inocencio
2205151	22	Jacobina do Piaui
2207777	22	Patos do Piaui
2207751	22	Passagem Franca do Piaui
2207603	22	Parnagua
2207553	22	Paqueta
2208551	22	Porto Alegre do Piaui
2208601	22	Prata do Piaui
2208700	22	Redencao do Gurgueia
2208874	22	Ribeira do Piaui
2208908	22	Ribeiro Goncalves
2209005	22	Rio Grande do Piaui
2209104	22	Santa Cruz do Piaui
2209351	22	Santana do Piaui
2209377	22	Santa Rosa do Piaui
2209450	22	Santo Antonio dos Milagres
2209401	22	Santo Antonio de Lisboa
2209559	22	Sao Braz do Piaui
2209500	22	Santo Inacio do Piaui
2209609	22	Sao Felix do Piaui
2209708	22	Sao Francisco do Piaui
2209757	22	Sao Goncalo do Gurgueia
2206902	22	Novo Oriente do Piaui
2209955	22	Sao Joao da Varjota
2210102	22	Sao Jose do Peixe
2210300	22	Sao Juliao
2209856	22	Sao Joao da Canabrava
2210003	22	Sao Joao do Piaui
2210201	22	Sao Jose do Piaui
2210383	22	Sao Miguel da Baixa Grande
2210375	22	Sao Luis do Piaui
2210391	22	Sao Miguel do Fidalgo
2210607	22	Sao Raimundo Nonato
2210623	22	Sebastiao Barros
2210631	22	Sebastiao Leal
2210953	22	Tamboril do Piaui
2210979	22	Tanque do Piaui
2211209	22	Urucui
2211308	22	Valenca do Piaui
2211357	22	Varzea Branca
2211407	22	Varzea Grande
2211506	22	Vera Mendes
2302057	23	Barroquinha
2302305	23	Bela Cruz
2302602	23	Camocim
2303907	23	Chaval
2304251	23	Cruz
2304707	23	Granja
2306553	23	Itarema
2307254	23	Jijoca de Jericoacoara
2307809	23	Marco
2308906	23	Morrinhos
2303402	23	Carnaubal
2305001	23	Guaraciaba do Norte
2305308	23	Ibiapina
2313609	23	Ubajara
2304509	23	Frecheirinha
2313906	23	Uruoca
2308203	23	Meruoca
2304350	23	Forquilha
2309003	23	Mucambo
2312908	23	Sobral
2305803	23	Ipu
2305902	23	Ipueiras
2310951	23	Pires Ferreira
2311009	23	Poranga
2311702	23	Reriutaba
2313955	23	Varjota
2303659	23	Catunda
2300754	23	Amontada
2306405	23	Itapipoca
2313500	23	Trairi
2310209	23	Paracuru
2310258	23	Paraipaba
2313559	23	Tururu
2313757	23	Umirim
2313807	23	Uruburetama
2304608	23	General Sampaio
2310704	23	Pentecoste
2303006	23	Caridade
2306603	23	Itatira
2310407	23	Paramoti
2209807	22	Sao Goncalo do Piaui
2210359	22	Sao Lourenco do Piaui
2210508	22	Sao Pedro do Piaui
2300150	23	Acarape
2301208	23	Aracoiaba
2301406	23	Aratuba
2302909	23	Capistrano
2305100	23	Guaramiranga
2309102	23	Mulungu
2309805	23	Pacoti
2301950	23	Barreira
2303956	23	Chorozinho
2309458	23	Ocara
2302206	23	Beberibe
2303501	23	Cascavel
2310852	23	Pindoretama
2301000	23	Aquiraz
2303709	23	Caucaia
2304400	23	Fortaleza
2306256	23	Itaitinga
2307700	23	Maranguape
2309706	23	Pacatuba
2305233	23	Horizonte
2309607	23	Pacajus
2305654	23	Ipaporanga
2308609	23	Monsenhor Tabosa
2309300	23	Nova Russas
2309409	23	Novo Oriente
2313203	23	Tamboril
2302404	23	Boa Viagem
2305266	23	Ibaretama
2307635	23	Madalena
2311405	23	Quixeramobim
2300408	23	Aiuaba
2301505	23	Arneiroz
2303600	23	Catarina
2310308	23	Parambu
2311900	23	Saboeiro
2300309	23	Acopiara
2304269	23	Deputado Irapuan Pinheiro
2310506	23	Pedra Branca
2310902	23	Piquet Carneiro
2312700	23	Senador Pompeu
2301109	23	Aracati
2304459	23	Fortim
2300705	23	Alto Santo
2305332	23	Ibicuitinga
2307007	23	Jaguaruana
2307601	23	Limoeiro do Norte
2308708	23	Morada Nova
2310001	23	Palhano
2311801	23	Russas
2313104	23	Tabuleiro do Norte
2306702	23	Jaguaretama
2306801	23	Jaguaribara
2306900	23	Jaguaribe
2306009	23	Iracema
2310803	23	Pereiro
2311231	23	Potiretama
2303808	23	Cedro
2305506	23	Iguatu
2300804	23	Antonina do Norte
2313252	23	Tarrafas
2300507	23	Alcantaras
2210706	22	Simoes
2210904	22	Socorro do Piaui
2211605	22	Vila Nova do Piaui
2300903	23	Apuiares
2301257	23	Ararenda
2301851	23	Banabuiu
2302107	23	Baturite
2302800	23	Caninde
2303105	23	Carire
2303303	23	Carius
2303931	23	Choro
2304004	23	Coreau
2304103	23	Crateus
2304236	23	Croata
2304277	23	Erere
2304285	23	Eusebio
2304657	23	Graca
2304905	23	Groairas
2304954	23	Guaiuba
2305209	23	Hidrolandia
2305357	23	Icapui
2305407	23	Ico
2306108	23	Iraucuba
2306207	23	Itaicaba
2306306	23	Itapage
2306504	23	Itapiuna
2307403	23	Jucas
2307650	23	Maracanau
2307908	23	Martinopole
2308005	23	Massape
2308351	23	Milha
2308377	23	Miraima
2308500	23	Mombaca
2308807	23	Moraujo
2309508	23	Oros
2309904	23	Pacuja
2310100	23	Palmacia
2311264	23	Quiterianopolis
2311306	23	Quixada
2311355	23	Quixelo
2311504	23	Quixere
2312007	23	Santana do Acarau
2312205	23	Santa Quiteria
2312403	23	Sao Goncalo do Amarante
2312502	23	Sao Joao do Jaguaribe
2312601	23	Sao Luis do Curu
2312809	23	Senador Sa
2313005	23	Solonopole
2313302	23	Taua
2313351	23	Tejucuoca
2313401	23	Tiangua
2314003	23	Varzea Alegre
2314102	23	Vicosa do Ceara
2301802	23	Baixio
2305704	23	Ipaumirim
2307502	23	Lavras da Mangabeira
2313708	23	Umari
2301307	23	Araripe
2302701	23	Campos Sales
2311207	23	Potengi
2311959	23	Salitre
2300606	23	Altaneira
2304301	23	Farias Brito
2304806	23	Granjeiro
2301703	23	Aurora
2302008	23	Barro
2308104	23	Mauriti
2301901	23	Barbalha
2304202	23	Crato
2307106	23	Jardim
2307304	23	Juazeiro do Norte
2309201	23	Nova Olinda
2311108	23	Porteiras
2312106	23	Santana do Cariri
2300101	23	Abaiara
2302503	23	Brejo Santo
2307205	23	Jati
2308302	23	Milagres
2310605	23	Penaforte
2401107	24	Areia Branca
2404408	24	Grossos
2411056	24	Tibau
2413359	24	Serra do Mel
2401008	24	Apodi
2403707	24	Felipe Guerra
2404309	24	Governador Dix-Sept Rosado
2401305	24	Augusto Severo
2407609	24	Messias Targino
2414456	24	Triunfo Potiguar
2414605	24	Upanema
2400703	24	Alto do Rodrigues
2402501	24	Carnaubais
2406106	24	Jucurutu
2410256	24	Porto do Mangue
2403202	24	Doutor Severiano
2403301	24	Encanto
2407252	24	Major Sales
2410801	24	Riacho de Santana
2414753	24	Venha-Ver
2400505	24	Alexandria
2403905	24	Francisco Dantas
2407302	24	Marcelino Vieira
2409407	24	Pau dos Ferros
2410207	24	Portalegre
2410504	24	Rafael Fernandes
2410702	24	Riacho da Cruz
2411007	24	Rodolfo Fernandes
2413607	24	Severiano Melo
2413805	24	Taboleiro Grande
2414100	24	Tenente Ananias
2400604	24	Almino Afonso
2404002	24	Frutuoso Gomes
2407401	24	Martins
2409308	24	Patu
2410603	24	Rafael Godeiro
2413557	24	Serrinha dos Pintos
2414506	24	Umarizal
2404101	24	Galinhos
2407203	24	Macau
2400307	24	Afonso Bezerra
2400802	24	Angicos
2403756	24	Fernando Pedroza
2405504	24	Jardim de Angicos
2406700	24	Lajes
2409605	24	Pedra Preta
2409704	24	Pedro Avelino
2406502	24	Lagoa Nova
2411403	24	Santana do Matos
2414159	24	Tenente Laurentino Cruz
2404804	24	Ipueira
2405603	24	Jardim de Piranhas
2413409	24	Serra Negra do Norte
2400109	24	Acari
2403004	24	Cruzeta
2403103	24	Currais Novos
2403400	24	Equador
2408508	24	Ouro Branco
2408904	24	Parelhas
2401602	24	Bento Fernandes
2408805	24	Parazinho
2401503	24	Barcelona
2402105	24	Campo Redondo
2402808	24	Coronel Ezequiel
2405405	24	Japi
2406403	24	Lagoa de Velhos
2406809	24	Lajes Pintadas
2407906	24	Monte das Gameleiras
2411106	24	Ruy Barbosa
2411205	24	Santa Cruz
2401701	24	Bom Jesus
2401800	24	Brejinho
2404606	24	Ielmo Marinho
2400406	24	Agua Nova
2301604	23	Assare
2303204	23	Caririacu
2308401	23	Missao Velha
2401453	24	Barauna
2401651	24	Bodo
2401909	24	Caicara do Rio do Vento
2402006	24	Caico
2402303	24	Caraubas
2402402	24	Carnauba dos Dantas
2402709	24	Cerro Cora
2402907	24	Coronel Joao Pessoa
2403806	24	Florania
2404507	24	Guamare
2404705	24	Ipanguacu
2404853	24	Itaja
2404903	24	Itau
2405009	24	Jacana
2405108	24	Jandaira
2405207	24	Janduis
2405306	24	Januario Cicco
2405702	24	Jardim do Serido
2406007	24	Jose da Penha
2405900	24	Joao Dias
2405801	24	Joao Camara
2406908	24	Lucrecia
2407005	24	Luis Gomes
2408003	24	Mossoro
2408607	24	Parana
2408706	24	Parau
2409902	24	Pendencias
2410009	24	Piloes
2410108	24	Poco Branco
2411429	24	Santana do Serido
2411601	24	Sao Bento do Norte
2412401	24	Sao Jose do Serido
2411809	24	Sao Fernando
2411908	24	Sao Francisco do Oeste
2412104	24	Sao Joao do Sabugi
2412302	24	Sao Jose do Campestre
2413300	24	Serra de Sao Bento
2412500	24	Sao Miguel
2412807	24	Sao Rafael
2412906	24	Sao Tome
2413003	24	Sao Vicente
2413706	24	Sitio Novo
2414001	24	Tangara
2414308	24	Timbauba dos Batistas
2414902	24	Vicosa
2406304	24	Lagoa de Pedras
2406601	24	Lagoa Salgada
2407807	24	Monte Alegre
2408300	24	Nova Cruz
2409100	24	Passa e Fica
2409209	24	Passagem
2409332	24	Santa Maria
2410306	24	Presidente Juscelino
2410900	24	Riachuelo
2413508	24	Serrinha
2414803	24	Vera Cruz
2407500	24	Maxaranguape
2408953	24	Rio do Fogo
2409506	24	Pedra Grande
2410405	24	Pureza
2413904	24	Taipu
2414407	24	Touros
2403251	24	Parnamirim
2403608	24	Extremoz
2408102	24	Natal
2402204	24	Canguaretama
2404200	24	Goianinha
2407708	24	Montanhas
2409803	24	Pedro Velho
2413201	24	Senador Georgino Avelino
2414209	24	Tibau do Sul
2415008	24	Vila Flor
2502300	25	Bom Sucesso
2502805	25	Brejo do Cruz
2502904	25	Brejo dos Santos
2508109	25	Lagoa
2509370	25	Mato Grosso
2512804	25	Riacho dos Cavalos
2502052	25	Bernardino Batista
2502201	25	Bom Jesus
2503704	25	Cajazeiras
2504108	25	Carrapateira
2509602	25	Monte Horebe
2513307	25	Santa Helena
2516805	25	Triunfo
2500775	25	Aparecida
2503753	25	Cajazeirinhas
2504504	25	Condado
2505501	25	Vista Serrana
2508406	25	Lastro
2508802	25	Malta
2510006	25	Nazarezinho
2510907	25	Paulista
2512101	25	Pombal
2513208	25	Santa Cruz
2503308	25	Cachoeira dos Indios
2516201	25	Sousa
2503407	25	Cacimba de Areia
2510709	25	Passagem
2510808	25	Patos
2513802	25	Santa Teresinha
2500205	25	Aguiar
2502607	25	Igaracy
2504207	25	Catingueira
2504801	25	Coremas
2505907	25	Emas
2510204	25	Nova Olinda
2513604	25	Santana dos Garrotes
2502102	25	Boa Ventura
2505303	25	Curral Velho
2505600	25	Diamante
2506608	25	Ibiara
2507002	25	Itaporanga
2511004	25	Pedra Branca
2513505	25	Santana de Mangueira
2515708	25	Serra Grande
2503555	25	Cacimbas
2505402	25	Desterro
2506707	25	Imaculada
2508000	25	Juru
2512309	25	Princesa Isabel
2516607	25	Tavares
2516706	25	Teixeira
2513000	25	Salgadinho
2513406	25	Santa Luzia
2505006	25	Cubati
2506202	25	Frei Martinho
2507705	25	Juazeirinho
2510303	25	Nova Palmeira
2511103	25	Pedra Lavrada
2500734	25	Amparo
2504702	25	Congo
2504850	25	Coxixola
2508505	25	Livramento
2509701	25	Monteiro
2510600	25	Ouro Velho
2510659	25	Parari
2512200	25	Prata
2401206	24	Ares
2401404	24	Baia Formosa
2402600	24	Ceara-Mirim
2403509	24	Espirito Santo
2406155	24	Jundia
2406205	24	Lagoa d Anta
2407104	24	Macaiba
2408201	24	Nisia Floresta
2411502	24	Santo Antonio
2412203	24	Sao Jose de Mipibu
2412559	24	Sao Miguel do Gostoso
2412609	24	Sao Paulo do Potengi
2412708	24	Sao Pedro
2413102	24	Senador Eloi de Souza
2414704	24	Varzea
2500700	25	Sao Joao do Rio do Peixe
2501153	25	Areia de Baraunas
2501351	25	Assuncao
2501534	25	Barauna
2502003	25	Belem do Brejo do Cruz
2502409	25	Bonito de Santa Fe
2503902	25	Camalau
2504306	25	Catole do Rocha
2504405	25	Conceicao
2507408	25	Jerico
2507804	25	Junco do Serido
2509156	25	Marizopolis
2509396	25	Matureia
2510402	25	Olho d Agua
2511301	25	Pianco
2511400	25	Picui
2512077	25	Poco de Jose de Moura
2512606	25	Quixaba
2513356	25	Santa Ines
2513653	25	Santarem
2513901	25	Sao Bento
2513927	25	Sao Bentinho
2513968	25	Sao Domingos de Pombal
2513984	25	Sao Francisco
2514206	25	Sao Jose da Lagoa Tapada
2514305	25	Sao Jose de Caiana
2514503	25	Sao Jose de Piranhas
2514552	25	Sao Jose de Princesa
2514602	25	Sao Jose do Bonfim
2514651	25	Sao Jose do Brejo do Cruz
2514701	25	Sao Jose do Sabugi
2514800	25	Sao Jose dos Cordeiros
2514909	25	Sao Mamede
2515401	25	Serido
2516755	25	Tenorio
2516904	25	Uirauna
2517100	25	Varzea
2517209	25	Vieiropolis
2515500	25	Serra Branca
2500536	25	Alcantil
2501575	25	Barra de Santana
2503100	25	Cabaceiras
2500908	25	Arara
2501609	25	Barra de Santa Rosa
2510105	25	Nova Floresta
2510501	25	Olivedos
2512002	25	Pocinhos
2516102	25	Soledade
2501005	25	Araruna
2503506	25	Cacimba de Dentro
2504157	25	Casserengue
2516409	25	Campo de Santana
2501203	25	Areial
2509503	25	Montadas
2500304	25	Alagoa Grande
2500403	25	Alagoa Nova
2501104	25	Areia
2501500	25	Bananeiras
2502706	25	Borborema
2509339	25	Matinhas
2515906	25	Serraria
2500502	25	Alagoinha
2505204	25	Cuitegi
2505808	25	Duas Estradas
2506301	25	Guarabira
2508208	25	Lagoa de Dentro
2508554	25	Logradouro
2509800	25	Mulungu
2511806	25	Pirpirituba
2515609	25	Serra da Raiz
2502151	25	Boa Vista
2504009	25	Campina Grande
2506103	25	Fagundes
2508307	25	Lagoa Seca
2509206	25	Massaranduba
2512507	25	Queimadas
2515807	25	Serra Redonda
2506905	25	Itabaiana
2507200	25	Itatuba
2509404	25	Mogeiro
2501302	25	Aroeiras
2506251	25	Gado Bravo
2509909	25	Natuba
2517001	25	Umbuzeiro
2504033	25	Capim
2505279	25	Curral de Cima
2507101	25	Itapororoca
2508901	25	Mamanguape
2509305	25	Mataraca
2512903	25	Rio Tinto
2507903	25	Juripiranga
2509107	25	Mari
2509057	25	Marcacao
2514107	25	Sao Joao do Tigre
2504900	25	Cruz do Espirito Santo
2509008	25	Manaira
2511509	25	Pilar
2515971	25	Sobrado
2501807	25	Bayeux
2503209	25	Cabedelo
2504603	25	Conde
2508604	25	Lucena
2513703	25	Santa Rita
2500601	25	Alhandra
2511202	25	Pedras de Fogo
2511905	25	Pitimbu
2601102	26	Araripina
2605301	26	Exu
2606309	26	Granito
2607307	26	Ipubi
2609907	26	Ouricuri
2612455	26	Santa Cruz
2612554	26	Santa Filomena
2615607	26	Trindade
2604304	26	Cedro
2609303	26	Mirandiba
2610400	26	Parnamirim
2612208	26	Salgueiro
2614006	26	Serrita
2616100	26	Verdejante
2600104	26	Afogados da Ingazeira
2602506	26	Brejinho
2603405	26	Calumbi
2605608	26	Flores
2606903	26	Iguaraci
2607109	26	Ingazeira
2607703	26	Itapetim
2611533	26	Quixaba
2612471	26	Santa Cruz da Baixa Verde
2612802	26	Santa Terezinha
2613909	26	Serra Talhada
2614600	26	Tabira
2615706	26	Triunfo
2615904	26	Tuparetama
2601201	26	Arcoverde
2606606	26	Ibimirim
2609154	26	Manari
2500577	25	Algodao de Jandaira
2500809	25	Aracagi
2501401	25	Baia da Traicao
2501708	25	Barra de Sao Miguel
2501906	25	Belem
2502508	25	Boqueirao
2503001	25	Caapora
2503605	25	Caicara
2503803	25	Caldas Brandao
2504074	25	Caraubas
2504355	25	Caturite
2505105	25	Cuite
2505352	25	Damiao
2505709	25	Dona Ines
2506400	25	Gurinhem
2506509	25	Gurjao
2506806	25	Inga
2507309	25	Jacarau
2507507	25	Joao Pessoa
2507606	25	Juarez Tavora
2511608	25	Piloes
2511707	25	Piloezinhos
2512408	25	Puxinana
2512705	25	Remigio
2512721	25	Pedro Regis
2512747	25	Riachao
2512754	25	Riachao do Bacamarte
2512788	25	Riacho de Santo Antonio
2513158	25	Santa Cecilia
2513851	25	Santo Andre
2514453	25	Sao Jose dos Ramos
2515005	25	Sao Miguel de Taipu
2515203	25	Sao Sebastiao do Umbuzeiro
2515302	25	Sape
2515930	25	Sertaozinho
2516003	25	Solanea
2516151	25	Sossego
2516300	25	Sume
2516508	25	Taperoa
2517407	25	Zabele
2601805	26	Betania
2602001	26	Bodoco
2603009	26	Cabrobo
2603900	26	Carnaiba
2605103	26	Custodia
2607000	26	Inaja
2613503	26	Sao Jose do Belmonte
2613602	26	Sao Jose do Egito
2614105	26	Sertania
2614303	26	Moreilandia
2614402	26	Solidao
2605152	26	Dormentes
2608750	26	Lagoa Grande
2611101	26	Petrolina
2612604	26	Santa Maria da Boa Vista
2615201	26	Terra Nova
2603926	26	Carnaubeira da Penha
2605707	26	Floresta
2607406	26	Itacuruba
2614808	26	Tacaratu
2610806	26	Pedra
2615805	26	Tupanatinga
2616001	26	Venturosa
2600609	26	Alagoinha
2601706	26	Belo Jardim
2601904	26	Bezerros
2602605	26	Brejo da Madre de Deus
2603108	26	Cachoeirinha
2603801	26	Capoeiras
2604106	26	Caruaru
2610905	26	Pesqueira
2611705	26	Riacho das Almas
2604155	26	Casinhas
2605806	26	Frei Miguelinho
2612505	26	Santa Cruz do Capibaribe
2614501	26	Surubim
2615003	26	Taquaritinga do Norte
2615409	26	Toritama
2616209	26	Vertentes
2602209	26	Bom Jardim
2604908	26	Cumaru
2605400	26	Feira Nova
2608909	26	Limoeiro
2609105	26	Machados
2610509	26	Passira
2612109	26	Salgadinho
2601003	26	Angelim
2602100	26	Bom Conselho
2603702	26	Canhotinho
2604700	26	Correntes
2606002	26	Garanhuns
2606507	26	Iati
2608255	26	Jucati
2608305	26	Jupi
2608404	26	Jurema
2608602	26	Lagoa do Ouro
2608800	26	Lajedo
2610103	26	Palmeirina
2610301	26	Paranatama
2615102	26	Terezinha
2600302	26	Agrestina
2600807	26	Altinho
2601300	26	Barra de Guabiraba
2602308	26	Bonito
2605004	26	Cupira
2606705	26	Ibirajuba
2608701	26	Lagoa dos Gatos
2610202	26	Panelas
2602704	26	Buenos Aires
2603603	26	Camutanga
2604007	26	Carpina
2513109	25	Salgado de Sao Felix
2514008	25	Sao Joao do Cariri
2611200	26	Pocao
2611002	26	Petrolandia
2604601	26	Condado
2605509	26	Ferreiros
2606200	26	Goiana
2607802	26	Itaquitinga
2608453	26	Lagoa do Carro
2608503	26	Lagoa do Itaenga
2609006	26	Macaparana
2610608	26	Paudalho
2611309	26	Pombos
2600906	26	Amaraji
2601409	26	Barreiros
2604205	26	Catende
2605202	26	Escada
2605905	26	Gameleira
2607950	26	Jaqueira
2608206	26	Joaquim Nabuco
2609204	26	Maraial
2610004	26	Palmares
2611408	26	Primavera
2611903	26	Rio Formoso
2606804	26	Igarassu
2607752	26	Itapissuma
2600054	26	Abreu e Lima
2603454	26	Camaragibe
2609402	26	Moreno
2609600	26	Olinda
2610707	26	Paulista
2611606	26	Recife
2602902	26	Cabo de Santo Agostinho
2607208	26	Ipojuca
2605459	26	Fernando de Noronha
2701605	27	Canapi
2703304	27	Inhapi
2705002	27	Mata Grande
2706422	27	Pariconha
2702405	27	Delmiro Gouveia
2707107	27	Piranhas
2701803	27	Carneiros
2702504	27	Dois Riachos
2704609	27	Maravilha
2706109	27	Ouro Branco
2706208	27	Palestina
2600401	26	Agua Preta
2600500	26	Aguas Belas
2600708	26	Alianca
2601508	26	Belem de Maria
2602407	26	Brejao
2602803	26	Buique
2603207	26	Caetes
2603306	26	Calcado
2603504	26	Camocim de Sao Felix
2604403	26	Cha de Alegria
2604502	26	Cha Grande
2604809	26	Cortes
2606101	26	Gloria do Goita
2606408	26	Gravata
2607505	26	Itaiba
2607653	26	Itambe
2608008	26	Jatauba
2608057	26	Jatoba
2608107	26	Joao Alfredo
2609501	26	Nazare da Mata
2609808	26	Oroco
2609709	26	Orobo
2611507	26	Quipapa
2611804	26	Ribeirao
2612000	26	Saire
2612307	26	Saloa
2612406	26	Sanharo
2612703	26	Santa Maria do Cambuca
2612901	26	Sao Benedito do Sul
2613008	26	Sao Bento do Una
2613107	26	Sao Caitano
2613206	26	Sao Joao
2613404	26	Sao Jose da Coroa Grande
2613701	26	Sao Lourenco da Mata
2613800	26	Sao Vicente Ferrer
2614204	26	Sirinhaem
2614709	26	Tacaimbo
2614857	26	Tamandare
2615300	26	Timbauba
2615508	26	Tracunhaem
2616183	26	Vertente do Lerio
2616308	26	Vicencia
2616407	26	Vitoria de Santo Antao
2616506	26	Xexeu
2705804	27	Olho d Agua do Casado
2706406	27	Pao de Acucar
2708006	27	Santana do Ipanema
2708956	27	Senador Rui Palmeira
2700706	27	Batalha
2700904	27	Belo Monte
2703700	27	Jaramataia
2704401	27	Major Isidoro
2701209	27	Cacimbinhas
2702553	27	Estrela de Alagoas
2703106	27	Igaci
2704807	27	Maribondo
2704906	27	Mar Vermelho
2706604	27	Paulo Jacinto
2707602	27	Quebrangulo
2700300	27	Arapiraca
2701506	27	Campo Grande
2702603	27	Feira Grande
2702900	27	Girau do Ponciano
2704104	27	Lagoa da Canoa
2704203	27	Limoeiro de Anadia
2709103	27	Taquarana
2709202	27	Traipu
2703007	27	Ibateguara
2707008	27	Pindoba
2700409	27	Atalaia
2701100	27	Branquinha
2701308	27	Cajueiro
2701357	27	Campestre
2701704	27	Capela
2702801	27	Flexeiras
2703809	27	Joaquim Gomes
2705101	27	Matriz de Camaragibe
2705200	27	Messias
2705507	27	Murici
2705606	27	Novo Lino
2707305	27	Porto Calvo
2703601	27	Japaratinga
2704500	27	Maragogi
2706505	27	Passo de Camaragibe
2707404	27	Porto de Pedras
2702207	27	Coqueiro Seco
2704708	27	Marechal Deodoro
2706448	27	Paripueira
2706901	27	Pilar
2707701	27	Rio Largo
2707909	27	Santa Luzia do Norte
2708907	27	Satuba
2700201	27	Anadia
2701001	27	Boca da Mata
2701407	27	Campo Alegre
2702306	27	Coruripe
2704005	27	Junqueiro
2707800	27	Roteiro
2702702	27	Feliz Deserto
2703205	27	Igreja Nova
2706703	27	Penedo
2802205	28	Feira Nova
2802403	28	Gararu
2802601	28	Gracho Cardoso
2803104	28	Itabi
2804201	28	Monte Alegre de Sergipe
2805604	28	Porto da Folha
2801405	28	Carira
2607901	26	Jaboatao dos Guararapes
2706307	27	Palmeira dos Indios
2707206	27	Poco das Trincheiras
2804508	28	Nossa Senhora da Gloria
2802304	28	Frei Paulo
2804458	28	Nossa Senhora Aparecida
2805000	28	Pedra Mole
2801900	28	Cumbe
2803807	28	Malhada dos Bois
2804300	28	Muribeca
2804607	28	Nossa Senhora das Dores
2800506	28	Areia Branca
2801009	28	Campo do Brito
2802908	28	Itabaiana
2803708	28	Macambira
2803906	28	Malhador
2804102	28	Moita Bonita
2807402	28	Tobias Barreto
2803500	28	Lagarto
2800704	28	Brejo Grande
2801108	28	Canhoba
2802700	28	Ilha das Flores
2804706	28	Nossa Senhora de Lourdes
2807303	28	Telha
2801306	28	Capela
2802007	28	Divina Pastora
2806503	28	Santa Rosa de Lima
2807204	28	Siriri
2803302	28	Japaratuba
2804904	28	Pacatuba
2805307	28	Pirambu
2802502	28	General Maynard
2803609	28	Laranjeiras
2804003	28	Maruim
2805901	28	Riachuelo
2806602	28	Santo Amaro das Brotas
2800308	28	Aracaju
2800605	28	Barra dos Coqueiros
2804805	28	Nossa Senhora do Socorro
2700508	27	Barra de Santo Antonio
2700607	27	Barra de Sao Miguel
2700805	27	Belem
2701902	27	Cha Preta
2702009	27	Coite do Noia
2702355	27	Craibas
2703403	27	Jacare dos Homens
2703502	27	Jacuipe
2703759	27	Jequia da Praia
2703908	27	Jundia
2704302	27	Maceio
2705309	27	Minador do Negrao
2705408	27	Monteiropolis
2705705	27	Olho d Agua das Flores
2705903	27	Olho d Agua Grande
2706000	27	Olivenca
2706802	27	Piacabucu
2707503	27	Porto Real do Colegio
2708105	27	Santana do Mundau
2708204	27	Sao Bras
2708303	27	Sao Jose da Laje
2708402	27	Sao Jose da Tapera
2708600	27	Sao Miguel dos Campos
2708709	27	Sao Miguel dos Milagres
2708808	27	Sao Sebastiao
2709004	27	Tanque d Arca
2709152	27	Teotonio Vilela
2709301	27	Uniao dos Palmares
2709400	27	Vicosa
2800209	28	Aquidaba
2801504	28	Carmopolis
2803401	28	Japoata
2804409	28	Neopolis
2805208	28	Pinhao
2805406	28	Poco Redondo
2805505	28	Poco Verde
2805703	28	Propria
2805802	28	Riachao do Dantas
2806008	28	Ribeiropolis
2806404	28	Santana do Sao Francisco
2806800	28	Sao Domingos
2806909	28	Sao Francisco
2807006	28	Sao Miguel do Aleixo
2807105	28	Simao Dias
2800670	28	Boquim
2803005	28	Itabaianinha
2805109	28	Pedrinhas
2806206	28	Salgado
2807501	28	Tomar do Geru
2802809	28	Indiaroba
2806305	28	Santa Luzia do Itanhy
2903201	29	Barreiras
2911105	29	Formosa do Rio Preto
2901403	29	Angical
2909406	29	Cotegipe
2930907	29	Tabocas do Brejo Velho
2933455	29	Wanderley
2908101	29	Cocos
2909109	29	Coribe
2909307	29	Correntina
2917359	29	Jaborandi
2928208	29	Santana
2930303	29	Serra Dourada
2905909	29	Campo Alegre de Lourdes
2907202	29	Casa Nova
2918407	29	Juazeiro
2926004	29	Remanso
2930774	29	Sobradinho
2924009	29	Paulo Afonso
2927101	29	Rodelas
2902708	29	Barra
2904753	29	Buritirama
2913200	29	Ibotirama
2933604	29	Xique-Xique
2903904	29	Bom Jesus da Lapa
2907103	29	Carinhanha
2910776	29	Feira da Mata
2923704	29	Paratinga
2930154	29	Serra do Ramalho
2901353	29	Andorinha
2906006	29	Campo Formoso
2917706	29	Jaguarari
2930105	29	Senhor do Bonfim
2932457	29	Umburanas
2903003	29	Barra do Mendes
2903235	29	Barro Alto
2905305	29	Cafarnaum
2906204	29	Canarana
2907608	29	Central
2911303	29	Gentio do Ouro
2912400	29	Ibipeba
2914406	29	Iraquara
2918506	29	Jussara
2922052	29	Mulungu do Morro
2925600	29	Presidente Dutra
2919157	29	Lapao
2919900	29	Macurure
2920452	29	Mansidao
2921609	29	Morpara
2924405	29	Pilao Arcado
2926202	29	Riachao das Neves
2801207	28	Caninde de Sao Francisco
2801603	28	Cedro de Sao Joao
2922250	29	Muquem de Sao Francisco
2928901	29	Sao Desiderio
2929057	29	Sao Felix do Coribe
2929255	29	Sao Gabriel
2901809	29	Antonio Goncalves
2907400	29	Catolandia
2924603	29	Pindobacu
2928109	29	Santa Maria da Vitoria
2928406	29	Santa Rita de Cassia
2930204	29	Sento Se
2930758	29	Sitio do Mato
2930808	29	Souto Soares
2906873	29	Capim Grosso
2917508	29	Jacobina
2921203	29	Miguel Calmon
2921401	29	Mirangaba
2924801	29	Piritiba
2925253	29	Ponto Novo
2925931	29	Quixabeira
2902609	29	Baixa Grande
2903805	29	Boa Vista do Tupim
2912608	29	Ibiquera
2914703	29	Itaberaba
2919009	29	Lajedinho
2919603	29	Macajuba
2920106	29	Mairi
2922102	29	Mundo Novo
2927200	29	Ruy Barbosa
2901502	29	Anguera
2910800	29	Feira de Santana
2916856	29	Itatim
2924652	29	Pintadas
2925956	29	Rafael Jambeiro
2928505	29	Santa Teresinha
2930402	29	Serra Preta
2931103	29	Tanquinho
2931400	29	Teodoro Sampaio
2918100	29	Jeremoabo
2924207	29	Pedro Alexandre
2906824	29	Canudos
2910701	29	Euclides da Cunha
2921500	29	Monte Santo
2900405	29	Agua Fria
2901155	29	America Dourada
2800407	28	Araua
2801702	28	Cristinapolis
2802106	28	Estancia
2803203	28	Itaporanga d Ajuda
2806701	28	Sao Cristovao
2807600	28	Umbauba
2902500	29	Baianopolis
2904407	29	Brejolandia
2905107	29	Caem
2905503	29	Caldeirao Grande
2906105	29	Canapolis
2906808	29	Cansancao
2907707	29	Chorrocho
2908200	29	Conceicao da Feira
2908507	29	Conceicao do Jacuipe
2908903	29	Coracao de Maria
2909208	29	Coronel Joao Sa
2909703	29	Cristopolis
2909901	29	Curaca
2910859	29	Filadelfia
2911402	29	Gloria
2911907	29	Iacu
2913101	29	Ibitita
2913804	29	Ipecaeta
2914000	29	Ipira
2914505	29	Irara
2914604	29	Irece
2915353	29	Itaguacu da Bahia
2917003	29	Itiuba
2922656	29	Nordestina
2925808	29	Queimadas
2925907	29	Quijingue
2931905	29	Tucano
2900355	29	Adustina
2901601	29	Antas
2916500	29	Itapicuru
2922904	29	Nova Soure
2923050	29	Novo Triunfo
2923100	29	Olindina
2923803	29	Paripiranga
2926509	29	Ribeira do Amparo
2926608	29	Ribeira do Pombal
2902104	29	Araci
2903276	29	Barrocas
2903607	29	Biritinga
2906402	29	Candeal
2906857	29	Capela do Alto Alegre
2913309	29	Ichu
2928000	29	Santaluz
2930501	29	Serrinha
2933000	29	Valente
2900306	29	Acajutiba
2900702	29	Alagoinhas
2902203	29	Aramari
2913705	29	Inhambupe
2927002	29	Rio Real
2907004	29	Cardeal da Silva
2908606	29	Conde
2910503	29	Entre Rios
2910602	29	Esplanada
2907509	29	Catu
2915908	29	Itanagra
2925204	29	Pojuca
2931707	29	Terra Nova
2904902	29	Cachoeira
2907301	29	Castro Alves
2909802	29	Cruz das Almas
2910206	29	Dom Macedo Costa
2911600	29	Governador Mangabeira
2917805	29	Jaguaripe
2920601	29	Maragogipe
2922201	29	Muniz Ferreira
2922300	29	Muritiba
2927309	29	Salinas da Margarida
2928604	29	Santo Amaro
2929750	29	Saubara
2933174	29	Varzedo
2906501	29	Candeias
2916104	29	Itaparica
2919207	29	Lauro de Freitas
2919926	29	Madre de Deus
2927408	29	Salvador
2933208	29	Vera Cruz
2904100	29	Boquira
2907558	29	Caturama
2912509	29	Ibipitanga
2921005	29	Mata de Sao Joao
2921708	29	Morro do Chapeu
2922508	29	Nazare
2922730	29	Nova Fatima
2923308	29	Ouricangas
2923357	29	Ourolandia
2924058	29	Pe de Serra
2924108	29	Pedrao
2926103	29	Retirolandia
2926301	29	Riachao do Jacuipe
2928802	29	Santo Estevao
2928950	29	Sao Domingos
2929008	29	Sao Felix
2929206	29	Sao Francisco do Conde
2929305	29	Sao Goncalo dos Campos
2929370	29	Sao Jose do Jacuipe
2927507	29	Santa Barbara
2929503	29	Sao Sebastiao do Passe
2927606	29	Santa Brigida
2928307	29	Santanopolis
2928703	29	Santo Antonio de Jesus
2929602	29	Sapeacu
2929701	29	Satiro Dias
2929800	29	Saude
2930600	29	Serrolandia
2930709	29	Simoes Filho
2930766	29	Sitio do Quinto
2931301	29	Tapiramuta
2931509	29	Teofilandia
2932002	29	Uaua
2932408	29	Uibai
2933109	29	Varzea do Poco
2933158	29	Varzea Nova
2913002	29	Ibitiara
2914109	29	Ipupiara
2923035	29	Novo Horizonte
2923209	29	Oliveira dos Brejinhos
2931053	29	Tanque Novo
2902807	29	Barra da Estiva
2904001	29	Boninal
2904050	29	Bonito
2912202	29	Ibicoara
2918605	29	Jussiape
2923506	29	Palmeiras
2926707	29	Rio de Contas
2929909	29	Seabra
2932804	29	Utinga
2933406	29	Wagner
2900603	29	Aiquara
2901007	29	Amargosa
2901957	29	Apuarema
2914208	29	Irajuba
2914307	29	Iramaia
2915106	29	Itagi
2916708	29	Itaquara
2917607	29	Jaguaquara
2918704	29	Lafaiete Coutinho
2918803	29	Laje
2919058	29	Lajedo do Tabocal
2921302	29	Milagres
2922805	29	Nova Itarana
2924900	29	Planaltino
2919504	29	Livramento de Nossa Senhora
2923605	29	Paramirim
2926905	29	Rio do Pires
2906600	29	Candiba
2911709	29	Guanambi
2917409	29	Jacaraci
2901304	29	Andarai
2900504	29	Erico Cardoso
2901908	29	Apora
2902054	29	Aracas
2902302	29	Aratuipe
2902658	29	Banzae
2904209	29	Botupora
2904308	29	Brejoes
2904506	29	Brotas de Macaubas
2904852	29	Cabaceiras do Paraguacu
2905008	29	Cacule
2905206	29	Caetite
2905701	29	Camacari
2907806	29	Cicero Dantas
2907905	29	Cipo
2908309	29	Conceicao do Almeida
2908408	29	Conceicao do Coite
2908804	29	Contendas do Sincora
2909505	29	Cravolandia
2909604	29	Crisopolis
2910057	29	Dias d Avila
2910107	29	Dom Basilio
2910750	29	Fatima
2911857	29	Heliopolis
2912004	29	Ibiassuce
2913408	29	Igapora
2915007	29	Itaete
2916906	29	Itirucu
2917334	29	Iuiu
2917904	29	Jandaira
2918001	29	Jequie
2918209	29	Jiquirica
2918308	29	Jitauna
2918753	29	Lagoa Real
2920205	29	Malhada
2921054	29	Matina
2921807	29	Mortugaba
2923407	29	Palmas de Monte Alto
2926400	29	Riacho de Santana
2932606	29	Urandi
2902005	29	Aracatu
2904605	29	Brumado
2909000	29	Cordeiros
2911659	29	Guajeru
2919959	29	Maetinga
2920304	29	Malhada de Pedras
2931806	29	Tremedal
2903508	29	Belo Campo
2903706	29	Boa Nova
2903953	29	Bom Jesus da Serra
2904803	29	Caatiba
2905156	29	Caetanos
2920403	29	Manoel Vitorino
2921450	29	Mirante
2925006	29	Planalto
2910404	29	Encruzilhada
2916401	29	Itapetinga
2916807	29	Itarantim
2919702	29	Macarani
2920007	29	Maiquinique
2905404	29	Cairu
2905800	29	Camamu
2925758	29	Presidente Tancredo Neves
2900900	29	Almadina
2902252	29	Arataca
2902401	29	Aurelino Leal
2903102	29	Barra do Rocha
2903300	29	Barro Preto
2903409	29	Belmonte
2904704	29	Buerarema
2905602	29	Camacan
2906303	29	Canavieiras
2908002	29	Coaraci
2910909	29	Firmino Alves
2911006	29	Floresta Azul
2911204	29	Gandu
2911501	29	Gongogi
2912707	29	Ibirapitanga
2912905	29	Ibirataia
2914802	29	Itabuna
2915700	29	Itamari
2916302	29	Itapebi
2916609	29	Itapitanga
2918555	29	Jussari
2920908	29	Mascote
2923902	29	Pau Brasil
2928059	29	Santa Luzia
2932200	29	Ubaitaba
2932507	29	Una
2919801	29	Macaubas
2920502	29	Maracas
2920700	29	Marau
2920809	29	Marcionilio Souza
2921906	29	Mucuge
2922409	29	Mutuipe
2922607	29	Nilo Pecanha
2922706	29	Nova Canaa
2922755	29	Nova Ibia
2922854	29	Nova Redencao
2924306	29	Piata
2924504	29	Pindai
2924678	29	Pirai do Norte
2924702	29	Piripa
2925105	29	Pocoes
2925402	29	Potiragua
2926657	29	Ribeirao do Largo
2929354	29	Sao Jose da Vitoria
2929404	29	Sao Miguel das Matas
2930006	29	Sebastiso Laranjeiras
2932309	29	Ubata
2906899	29	Caraibas
2926806	29	Rio do Antonio
2927804	29	Santa Cruz da Vitoria
2927903	29	Santa Ines
2931004	29	Tanhacu
2931202	29	Taperoa
2931608	29	Teolandia
2932101	29	Ubaira
2932903	29	Valenca
2933307	29	Vitoria da Conquista
2906907	29	Caravelas
2911808	29	Guaratinga
2914653	29	Itabela
2915304	29	Itagimirim
2915601	29	Itamaraju
2921104	29	Medeiros Neto
2922003	29	Mucuri
2925303	29	Porto Seguro
2925501	29	Prado
2931350	29	Teixeira de Freitas
2933257	29	Vereda
3104502	31	Arinos
3109303	31	Buritis
3109451	31	Cabeceira Grande
3122470	31	Dom Bosco
3126208	31	Formoso
3170479	31	Uruana de Minas
3128600	31	Guarda-Mor
3137106	31	Lagamar
3137536	31	Lagoa Grande
3147006	31	Paracatu
3153400	31	Presidente Olegario
3170404	31	Unai
3171006	31	Vazante
3108255	31	Bonito de Minas
3132107	31	Itacarambi
3139300	31	Manga
3140852	31	Matias Cardoso
3149150	31	Pedras de Maria da Cruz
3170529	31	Urucuia
3115474	31	Catuti
2901205	29	Anage
2902906	29	Barra do Choca
2906709	29	Candido Sales
2908705	29	Condeuba
2910008	29	Dario Meira
2912103	29	Ibicarai
2912301	29	Ibicui
2912806	29	Ibirapua
2913457	29	Igrapiuna
2913507	29	Iguai
2913606	29	Ilheus
2913903	29	Ipiau
2914901	29	Itacare
2915205	29	Itagiba
2915403	29	Itaju do Colonia
2915502	29	Itajuipe
2915809	29	Itambe
2916005	29	Itanhem
2916203	29	Itape
2917102	29	Itororo
2917201	29	Ituacu
2917300	29	Itubera
3124302	31	Espinosa
3127339	31	Gameleiras
3139250	31	Mamonas
3141009	31	Mato Verde
3142908	31	Monte Azul
3145059	31	Nova Porteirinha
3146552	31	Pai Pedro
3152204	31	Porteirinha
3154507	31	Riacho dos Machados
3106655	31	Berizal
3120870	31	Curral de Dentro
3122355	31	Divisa Alegre
3127073	31	Fruta de Leite
3130655	31	Indaiabira
3143450	31	Montezuma
3144656	31	Ninheira
3145372	31	Novorizonte
3155603	31	Rio Pardo de Minas
3156502	31	Rubelita
3157005	31	Salinas
3157377	31	Santa Cruz de Salinas
3168002	31	Taiobeiras
3170651	31	Vargem Grande do Rio Pardo
3109402	31	Buritizeiro
3137304	31	Lagoa dos Patos
3138104	31	Lassance
3151206	31	Pirapora
3154457	31	Riachinho
3111150	31	Campo Azul
3129657	31	Ibiracatu
3135357	31	Japonvar
3136801	31	Juramento
3138658	31	Lontra
3142007	31	Mirabela
3143302	31	Montes Claros
3147956	31	Patis
3152131	31	Ponto Chique
3108503	31	Botumirim
3132008	31	Itacambira
3146255	31	Padre Carvalho
3123809	31	Engenheiro Navarro
3126604	31	Francisco Dumont
3128253	31	Guaraciama
3121001	31	Datas
3121605	31	Diamantina
3127602	31	Gouveia
3153301	31	Presidente Kubitschek
2918902	29	Lajedao
2923001	29	Nova Vicosa
2933505	29	Wenceslau Guimaraes
3112703	31	Capitao Eneas
3120102	31	Couto de Magalhaes de Minas
3127800	31	Grao Mogol
3136306	31	Joao Pinheiro
3161106	31	Sao Francisco
3161700	31	Sao Goncalo do Abaete
3162252	31	Sao Joao da Lagoa
3162401	31	Sao Joao da Ponte
3162450	31	Sao Joao das Missoes
3162658	31	Sao Joao do Pacui
3162708	31	Sao Joao do Paraiso
3164209	31	Sao Romao
3170750	31	Varjao de Minas
3145455	31	Olhos-d Agua
2927705	29	Santa Cruz Cabralia
2932705	29	Urucuca
3107307	31	Bocaiuva
3108552	31	Brasilandia de Minas
3108602	31	Brasilia de Minas
3116159	31	Chapada Gaucha
3116506	31	Claro dos Pocoes
3117836	31	Conego Marinho
3104452	31	Aricanduva
3106507	31	Berilo
3112307	31	Capelinha
3113503	31	Carbonita
3116100	31	Chapada do Norte
3132503	31	Itamarandiba
3135456	31	Jenipapo de Minas
3138351	31	Leme do Prado
3141801	31	Minas Novas
3169703	31	Turmalina
3171071	31	Veredinha
3119500	31	Coronel Murta
3134004	31	Itinga
3145307	31	Novo Cruzeiro
3152170	31	Ponto dos Volantes
3171600	31	Virgem da Lapa
3117009	31	Comercinho
3133303	31	Itaobim
3141405	31	Medina
3148707	31	Pedra Azul
3101706	31	Almenara
3105202	31	Bandeira
3125408	31	Felicio dos Santos
3125507	31	Sao Goncalo do Rio Preto
3126505	31	Francisco Badaro
3126703	31	Francisco Sa
3127354	31	Glaucilandia
3129608	31	Ibiai
3130051	31	Icarai de Minas
3135050	31	Jaiba
3135100	31	Janauba
3135209	31	Januaria
3135605	31	Jequitai
3136520	31	Jose Goncalves de Minas
3136579	31	Josenopolis
3136959	31	Juvenilia
3138682	31	Luislandia
3142254	31	Miravania
3142700	31	Montalvania
3146305	31	Padre Paraiso
3150570	31	Pintopolis
3160454	31	Santo Antonio do Retiro
3165909	31	Senador Modestino Goncalves
3166956	31	Serranopolis de Minas
3170008	31	Ubai
3170800	31	Varzea da Palma
3170909	31	Varzelandia
3171030	31	Verdelandia
3125606	31	Felisburgo
3134707	31	Jacinto
3135803	31	Jequitinhonha
3140555	31	Mata Verde
3143153	31	Monte Formoso
3155108	31	Rio do Prado
3156601	31	Rubim
3157104	31	Salto da Divisa
3158102	31	Santa Maria do Salto
3115458	31	Catuji
3126802	31	Frei Gaspar
3137007	31	Ladainha
3139201	31	Malacacheta
3145356	31	Novo Oriente de Minas
3146206	31	Ouro Verde de Minas
3165552	31	Setubinha
3113701	31	Carlos Chagas
3127057	31	Fronteira dos Vales
3138906	31	Machacalis
3144300	31	Nanuque
3157658	31	Santa Helena de Minas
3170305	31	Umburatiba
3109808	31	Cachoeira Dourada
3134202	31	Ituiutaba
3101003	31	Aguas Vermelhas
3102852	31	Angelandia
3103504	31	Araguari
3115003	31	Cascalho Rico
3115805	31	Centralina
3142809	31	Monte Alegre de Minas
3152808	31	Prata
3169604	31	Tupaciguara
3100104	31	Abadia dos Dourados
3119302	31	Coromandel
3120706	31	Cruzeiro da Fortaleza
3123502	31	Douradoquara
3124807	31	Estrela do Sul
3127909	31	Grupiara
3143104	31	Monte Carmelo
3156403	31	Romaria
3166808	31	Serra do Salitre
3137502	31	Lagoa Formosa
3141207	31	Matutina
3148004	31	Patos de Minas
3159704	31	Santa Rosa da Serra
3168903	31	Tiros
3111101	31	Campina Verde
3114550	31	Carneirinho
3116902	31	Comendador Gomes
3127008	31	Fronteira
3127107	31	Frutal
3133402	31	Itapagipe
3134400	31	Iturama
3138625	31	Limeira do Oeste
3150703	31	Pirajuba
3151602	31	Planura
3111408	31	Campo Florido
3118205	31	Conquista
3121258	31	Delta
3170107	31	Uberaba
3111507	31	Campos Altos
3145000	31	Nova Ponte
3149804	31	Perdizes
3153004	31	Pratinha
3156908	31	Sacramento
3157708	31	Santa Juliana
3168101	31	Tapira
3107000	31	Biquinhas
3143500	31	Morada Nova de Minas
3146404	31	Paineiras
3104809	31	Augusto de Lima
3119104	31	Corinto
3120904	31	Curvelo
3131109	31	Inimutaba
3142502	31	Monjolos
3153202	31	Presidente Juscelino
3107406	31	Bom Despacho
3103751	31	Arapora
3129103	31	Gurinhata
3148509	31	Pavao
3161304	31	Sao Francisco de Sales
3162104	31	Sao Gotardo
3170438	31	Uniao de Minas
3102704	31	Cachoeira de Pajeu
3103405	31	Aracuai
3103801	31	Arapua
3103900	31	Araujos
3104007	31	Araxa
3104700	31	Ataleia
3106606	31	Bertopolis
3109204	31	Buenopolis
3111804	31	Canapolis
3112604	31	Capinopolis
3113008	31	Carai
3115607	31	Cedro do Abaete
3137205	31	Lagoa da Prata
3138302	31	Leandro Ferreira
3138807	31	Luz
3140506	31	Martinho Campos
3142403	31	Moema
3153707	31	Quartel Geral
3166600	31	Serra da Saudade
3105004	31	Baldim
3109600	31	Cachoeira da Prata
3112505	31	Capim Branco
3118908	31	Cordisburgo
3126406	31	Fortuna de Minas
3134608	31	Jaboticatubas
3139706	31	Maravilhas
3141108	31	Matozinhos
3146909	31	Papagaios
3147402	31	Paraopeba
3149606	31	Pequi
3153608	31	Prudente de Morais
3158508	31	Santana de Pirapama
3159001	31	Santana do Riacho
3167202	31	Sete Lagoas
3102407	31	Alvorada de Minas
3118106	31	Congonhas do Norte
3122454	31	Divisopolis
3123205	31	Dores do Indaia
3124708	31	Estrela do Indaia
3125705	31	Felixlandia
3126752	31	Franciscopolis
3127206	31	Funilandia
3129509	31	Ibia
3130705	31	Indianopolis
3131000	31	Inhauma
3131406	31	Ipiacu
3131604	31	Irai de Minas
3132305	31	Itaipe
3135308	31	Japaraiba
3135704	31	Jequitiba
3136009	31	Joaima
3136405	31	Joaquim Felicio
3136504	31	Jordania
3143609	31	Morro da Garca
3146750	31	Palmopolis
3148103	31	Patrocinio
3149200	31	Pedrinopolis
3152006	31	Pompeu
3152402	31	Pote
3159803	31	Santa Vitoria
3160306	31	Santo Antonio do Jacinto
3160603	31	Santo Hipolito
3166709	31	Serra dos Aimores
3168606	31	Teofilo Otoni
3169356	31	Tras Marias
3170206	31	Uberlandia
3171105	31	Verissimo
3122603	31	Dom Joaquim
3143708	31	Morro do Pilar
3156007	31	Rio Vermelho
3166501	31	Serra Azul de Minas
3167103	31	Serro
3126000	31	Florestal
3151404	31	Pitangui
3106200	31	Belo Horizonte
3106705	31	Betim
3109006	31	Brumadinho
3117876	31	Confins
3118601	31	Contagem
3124104	31	Esmeraldas
3136652	31	Juatuba
3137601	31	Lagoa Santa
3140704	31	Mateus Leme
3144805	31	Nova Lima
3149309	31	Pedro Leopoldo
3153905	31	Raposos
3154804	31	Rio Acima
3157807	31	Santa Luzia
3165537	31	Sarzedo
3100708	31	Agua Comprida
3171204	31	Vespasiano
3106002	31	Bela Vista de Minas
3107703	31	Bom Jesus do Amparo
3115359	31	Catas Altas
3125903	31	Ferros
3131703	31	Itabira
3144706	31	Nova Era
3155702	31	Rio Piracicaba
3158003	31	Santa Maria de Itabira
3106408	31	Belo Vale
3108107	31	Bonfim
3132206	31	Itaguara
3135407	31	Jeceaba
3142304	31	Moeda
3150406	31	Piedade dos Gerais
3155306	31	Rio Manso
3121704	31	Diogo de Vasconcelos
3131901	31	Itabirito
3140001	31	Mariana
3146107	31	Ouro Preto
3114907	31	Casa Grande
3115409	31	Catas Altas da Noruega
3118007	31	Congonhas
3118304	31	Conselheiro Lafaiete
3120409	31	Cristiano Otoni
3121407	31	Desterro de Entre Rios
3123908	31	Entre Rios de Minas
3133907	31	Itaverava
3145901	31	Ouro Branco
3153806	31	Queluzito
3159100	31	Santana dos Montes
3116803	31	Coluna
3127503	31	Gonzaga
3148400	31	Paulistas
3166105	31	Senhora do Porto
3112059	31	Cantagalo
3126950	31	Frei Lagonegro
3101805	31	Alpercata
3119203	31	Coroaci
3122108	31	Divino das Laranjeiras
3123700	31	Engenheiro Caldas
3125804	31	Fernandes Tourinho
3127701	31	Governador Valadares
3132701	31	Itambacuri
3112653	31	Capitao Andrade
3117504	31	Conceicao do Mato Dentro
3123106	31	Dores de Guanhaes
3128006	31	Guanhaes
3136207	31	Joao Monlevade
3136603	31	Nova Uniao
3154606	31	Ribeirao das Neves
3160900	31	Sao Bras do Suacui
3161007	31	Sao Domingos do Prata
3161908	31	Sao Goncalo do Rio Abaixo
3162807	31	Sao Joao Evangelista
3162922	31	Sao Joaquim de Bicas
3163102	31	Sao Jose da Varginha
3162955	31	Sao Jose da Lapa
3163409	31	Sao Jose do Goiabal
3163508	31	Sao Jose do Jacuri
3164100	31	Sao Pedro do Suacui
3164803	31	Sao Sebastiao do Rio Preto
3103207	31	Aracai
3108800	31	Braunas
3109907	31	Caetanopolis
3110004	31	Caete
3110806	31	Campanario
3113800	31	Carmesia
3133204	31	Itanhomi
3135076	31	Jampruca
3140100	31	Marilac
3144201	31	Nacip Raydan
3150000	31	Pescador
3169505	31	Tumiritinga
3171501	31	Mathias Lobato
3115706	31	Central de Minas
3131802	31	Itabirinha
3139607	31	Mantena
3141504	31	Mendes Pimentel
3106309	31	Belo Oriente
3119401	31	Coronel Fabriciano
3131307	31	Ipatinga
3141702	31	Mesquita
3144359	31	Naque
3149952	31	Periquito
3107802	31	Bom Jesus do Galho
3109253	31	Bugre
3113404	31	Caratinga
3122504	31	Dom Cavati
3123858	31	Entre Folhas
3129301	31	Iapu
3120607	31	Crucilandia
3121803	31	Dionisio
3126901	31	Frei Inocencio
3127305	31	Galileia
3129806	31	Ibirite
3130101	31	Igarape
3130556	31	Imbe de Minas
3132800	31	Itambe do Mato Dentro
3133709	31	Itatiaiucu
3135001	31	Jaguaracu
3136108	31	Joanesia
3136553	31	Jose Raydan
3140159	31	Mario Campos
3140308	31	Marlieria
3140605	31	Materlandia
3144672	31	Nova Belem
3144904	31	Nova Modica
3145802	31	Onca de Pitangui
3147105	31	Para de Minas
3147501	31	Passabem
3148608	31	Pecanha
3156700	31	Sabara
3156809	31	Sabinopolis
3157203	31	Santa Barbara
3158201	31	Santa Maria do Suacui
3158953	31	Santana do Paraiso
3160207	31	Santo Antonio do Itambe
3160504	31	Santo Antonio do Rio Abaixo
3165503	31	Sardoa
3167707	31	Sobralia
3168309	31	Taquaracu de Minas
3168705	31	Timoteo
3171808	31	Virginopolis
3171907	31	Virgolandia
3130903	31	Inhapim
3131158	31	Ipaba
3150158	31	Piedade de Caratinga
3159357	31	Santa Rita de Minas
3168408	31	Tarumirim
3170057	31	Ubaporanga
3170578	31	Vargem Alegre
3102209	31	Alvarenga
3118403	31	Conselheiro Pena
3120839	31	Cuparaque
3127370	31	Goiabeira
3131208	31	Ipanema
3134103	31	Itueta
3144003	31	Mutum
3151909	31	Pocrane
3154309	31	Resplendor
3159506	31	Santa Rita do Itueto
3168051	31	Taparuba
3100609	31	Agua Boa
3101102	31	Aimores
3102308	31	Alvinopolis
3130309	31	Iguatama
3141306	31	Medeiros
3151503	31	Piumhi
3170602	31	Vargem Bonita
3114204	31	Carmo do Cajuru
3130200	31	Igaratinga
3145208	31	Nova Serrana
3104205	31	Arcos
3110400	31	Camacho
3126109	31	Formiga
3133501	31	Itapecerica
3146503	31	Pains
3150505	31	Pimenta
3100807	31	Aguanil
3111200	31	Campo Belo
3111903	31	Cana Verde
3112000	31	Candeias
3120201	31	Cristais
3108008	31	Bom Sucesso
3114006	31	Carmo da Mata
3130002	31	Ibituruna
3145604	31	Oliveira
3147709	31	Passa Tempo
3150604	31	Piracema
3107604	31	Bom Jesus da Penha
3112406	31	Capetinga
3116407	31	Claraval
3126307	31	Fortaleza de Minas
3129707	31	Ibiraci
3147907	31	Passos
3104106	31	Arceburgo
3109501	31	Cabo Verde
3132909	31	Itamogi
3136900	31	Juruaia
3143005	31	Monte Belo
3143203	31	Monte Santo de Minas
3144102	31	Muzambinho
3145109	31	Nova Resende
3101607	31	Alfenas
3102001	31	Alterosa
3104304	31	Areado
3114402	31	Carmo do Rio Claro
3122405	31	Divisa Nova
3125200	31	Fama
3139003	31	Machado
3166907	31	Serrania
3117405	31	Conceicao de Ipanema
3117603	31	Conceicao do Para
3149705	31	Perdigao
3160959	31	Sao Domingos das Dores
3161056	31	Sao Felix de Minas
3161205	31	Sao Francisco de Paula
3161601	31	Sao Geraldo da Piedade
3161650	31	Sao Geraldo do Baixio
3161809	31	Sao Goncalo do Para
3162203	31	Sao Joao Batista do Gloria
3162575	31	Sao Joao do Manteninha
3162609	31	Sao Joao do Oriente
3163003	31	Sao Jose da Safira
3162948	31	Sao Jose da Barra
3163300	31	Sao Jose do Divino
3164308	31	Sao Roque de Minas
3164472	31	Sao Sebastiao do Anta
3164605	31	Sao Sebastiao do Oeste
3164704	31	Sao Sebastiao do Paraiso
3165107	31	Sao Tomas de Aquino
3150539	31	Pingo-d Agua
3147204	31	Paraguacu
3103009	31	Antonio Dias
3105103	31	Bambui
3107109	31	Boa Esperanca
3112802	31	Capitolio
3114501	31	Carmopolis de Minas
3114709	31	Carvalhopolis
3115102	31	Cassia
3116605	31	Claudio
3119807	31	Corrego Danta
3110905	31	Campanha
3111309	31	Campo do Meio
3111606	31	Campos Gerais
3113909	31	Carmo da Cachoeira
3118700	31	Coqueiral
3142601	31	Monsenhor Paulo
3158300	31	Santana da Vargem
3170701	31	Varginha
3101409	31	Albertina
3102605	31	Andradas
3105301	31	Bandeira do Sul
3108404	31	Botelhos
3110301	31	Caldas
3111002	31	Campestre
3130606	31	Inconfidentes
3134905	31	Jacutinga
3146008	31	Ouro Fino
3159209	31	Santa Rita de Caldas
3107901	31	Bom Repouso
3108305	31	Borda da Mata
3110509	31	Camanducaia
3117900	31	Congonhal
3124500	31	Estiva
3125101	31	Extrema
3133600	31	Itapeva
3119955	31	Corrego Fundo
3121209	31	Delfinopolis
3122306	31	Divinopolis
3123403	31	Doresopolis
3123601	31	Eloi Mendes
3124401	31	Espirito Santo do Dourado
3127404	31	Goncalves
3128105	31	Guape
3128303	31	Guaranesia
3128709	31	Guaxupe
3129905	31	Ibitiura de Minas
3130507	31	Ilicinea
3131505	31	Ipuiuna
3133808	31	Itauna
3134806	31	Jacui
3148905	31	Pedra do Indaia
3149903	31	Perdoes
3151701	31	Poco Fundo
3151800	31	Pocos de Caldas
3152907	31	Pratapolis
3157252	31	Santa Barbara do Leste
3158805	31	Santana do Jacare
3159902	31	Santo Antonio do Amparo
3160405	31	Santo Antonio do Monte
3168200	31	Tapirai
3169307	31	Tres Coracoes
3169406	31	Tres Pontas
3143807	31	Munhoz
3152501	31	Pouso Alegre
3165578	31	Senador Amaral
3169059	31	Tocos do Moji
3169109	31	Toledo
3109709	31	Cachoeira de Minas
3129202	31	Heliodora
3149101	31	Pedralva
3101300	31	Alagoa
3104908	31	Baependi
3110707	31	Cambuquira
3114105	31	Carmo de Minas
3115508	31	Caxambu
3133006	31	Itamonte
3133105	31	Itanhandu
3137809	31	Lambari
3147600	31	Passa Quatro
3152600	31	Pouso Alto
3167806	31	Soledade de Minas
3101201	31	Aiuruoca
3103603	31	Arantina
3107208	31	Bocaina de Minas
3107505	31	Bom Jardim de Minas
3114808	31	Carvalhos
3138500	31	Liberdade
3141900	31	Minduri
3147808	31	Passa-Vinte
3166402	31	Seritinga
3167004	31	Serranos
3120508	31	Cristina
3121100	31	Delfim Moreira
3151008	31	Piranguinho
3172202	31	Wenceslau Braz
3114600	31	Carrancas
3130408	31	Ijaci
3134301	31	Itumirim
3134509	31	Itutinga
3138203	31	Lavras
3144607	31	Nepomuceno
3119708	31	Coronel Xavier Chaves
3123007	31	Dores de Campos
3137403	31	Lagoa Dourada
3139102	31	Madre de Deus de Minas
3144508	31	Nazareno
3150307	31	Piedade do Rio Grande
3152709	31	Prados
3154200	31	Resende Costa
3157336	31	Santa Cruz de Minas
3168804	31	Tiradentes
3101631	31	Alfredo Vasconcelos
3105608	31	Barbacena
3105905	31	Barroso
3112208	31	Capela Nova
3121506	31	Desterro do Melo
3129400	31	Ibertioga
3154408	31	Ressaquinha
3100401	31	Acaiaca
3105707	31	Barra Longa
3128204	31	Guaraciaba
3135506	31	Jequeri
3150208	31	Piedade de Ponte Nova
3152105	31	Ponte Nova
3154002	31	Raul Soares
3154903	31	Rio Casca
3155009	31	Rio Doce
3115201	31	Conceicao da Barra de Minas
3117207	31	Conceicao das Pedras
3117702	31	Conceicao do Rio Verde
3117801	31	Conceicao dos Ouros
3118502	31	Consolacao
3143401	31	Monte Siao
3154705	31	Ribeirao Vermelho
3160801	31	Sao Bento Abade
3162005	31	Sao Goncalo do Sapucai
3162302	31	Sao Joao da Mata
3162500	31	Sao Joao del Rei
3163201	31	Sao Jose do Alegre
3163706	31	Sao Lourenco
3164902	31	Sao Sebastiao do Rio Verde
3165008	31	Sao Tiago
3165206	31	Sao Thome das Letras
3165305	31	Sao Vicente de Minas
3108909	31	Brasopolis
3110608	31	Cambui
3113107	31	Caranaiba
3113206	31	Carandai
3113602	31	Careacu
3119005	31	Cordislandia
3157401	31	Santa Cruz do Escalvado
3165560	31	Sem-Peixe
3166303	31	Sericita
3171154	31	Vermelho Novo
3100302	31	Abre Campo
3112901	31	Caputira
3137700	31	Lajinha
3138674	31	Luisburgo
3139508	31	Manhumirim
3140530	31	Martins Soares
3148756	31	Pedra Bonita
3154150	31	Reduto
3157906	31	Santa Margarida
3102100	31	Alto Rio Doce
3102506	31	Amparo do Serra
3103702	31	Araponga
3110202	31	Cajuri
3116704	31	Coimbra
3137908	31	Lamim
3148806	31	Pedra do Anta
3150802	31	Piranga
3152303	31	Porto Firme
3153103	31	Presidente Bernardes
3155207	31	Rio Espera
3166006	31	Senhora de Oliveira
3168507	31	Teixeiras
3110103	31	Caiana
3113305	31	Carangola
3122009	31	Divino
3124203	31	Espera Feliz
3122702	31	Dom Silverio
3122801	31	Dom Vicoso
3123528	31	Durande
3124005	31	Ervalia
3130804	31	Ingai
3132404	31	Itajuba
3135902	31	Jesuania
3138708	31	Luminarias
3139409	31	Manhuacu
3139904	31	Maria da Fe
3140407	31	Marmelopolis
3140902	31	Matipo
3144409	31	Natercia
3145851	31	Oratorios
3147303	31	Paraisopolis
3148301	31	Paula Candido
3150901	31	Pirangucu
3156106	31	Ritapolis
3158706	31	Santana do Garambeu
3158904	31	Santana do Manhuacu
3159605	31	Santa Rita do Sapucai
3160108	31	Santo Antonio do Grama
3165404	31	Sapucai-Mirim
3165800	31	Senador Jose Bento
3166204	31	Senhora dos Remedios
3167400	31	Silvianipolis
3167608	31	Simonesia
3169802	31	Turvolandia
3170503	31	Urucania
3171303	31	Vicosa
3125309	31	Faria Lemos
3125952	31	Fervedouro
3142106	31	Miradouro
3149002	31	Pedra Dourada
3169208	31	Tombos
3171402	31	Vieiras
3104601	31	Astolfo Dutra
3153509	31	Alto Jequitiba
3102803	31	Andrelandia
3102902	31	Antonio Carlos
3123304	31	Dores do Turvo
3128402	31	Guarani
3128808	31	Guidoval
3129004	31	Guiricema
3155801	31	Rio Pomba
3156304	31	Rodeiro
3165701	31	Senador Firmino
3167905	31	Tabuleiro
3169000	31	Tocantins
3172004	31	Visconde do Rio Branco
3103306	31	Aracitaba
3106101	31	Belmiro Braga
3106804	31	Bias Fortes
3106903	31	Bicas
3116209	31	Chiador
3119609	31	Coronel Pacheco
3121308	31	Descoberto
3136702	31	Juiz de Fora
3138609	31	Lima Duarte
3139805	31	Mar de Espanha
3140803	31	Matias Barbosa
3145406	31	Olaria
3145703	31	Oliveira Fortes
3146602	31	Paiva
3149408	31	Pedro Teixeira
3149507	31	Pequeri
3150109	31	Piau
3155405	31	Rio Novo
3155900	31	Rio Preto
3156205	31	Rochedo de Minas
3158607	31	Santana do Deserto
3159308	31	Santa Rita de Jacutinga
3159407	31	Santa Rita de Ibitipoca
3160702	31	Santos Dumont
3165602	31	Senador Cortes
3104403	31	Argirita
3115300	31	Cataguases
3124609	31	Estrela Dalva
3132602	31	Itamarati de Minas
3138005	31	Laranjal
3138401	31	Leopoldina
3146701	31	Palma
3151107	31	Pirapetinga
3154101	31	Recreio
3158409	31	Santana de Cataguases
3172103	31	Volta Grande
3202108	32	Ecoporanga
3200359	32	Alto Rio Novo
3200805	32	Baixo Guandu
3201506	32	Colatina
3202256	32	Governador Lindenberg
3204005	32	Pancas
3203502	32	Montanha
3203601	32	Mucurici
3204104	32	Pinheiros
3204252	32	Ponto Belo
3111705	31	Canaa
3162906	31	Sao Joao Nepomuceno
3161502	31	Sao Geraldo
3161403	31	Sao Francisco do Gloria
3162559	31	Sao Joao do Manhuacu
3163607	31	Sao Jose do Mantimento
3163805	31	Sao Miguel do Anta
3164001	31	Sao Pedro dos Ferros
3164431	31	Sao Sebastiao da Vargem Alegre
3167509	31	Simao Pereira
3200904	32	Barra de Sao Francisco
3201605	32	Conceicao da Barra
3204708	32	Sao Gabriel da Palha
3205150	32	Vila Pavao
3103108	31	Antonio Prado de Minas
3108701	31	Bras Pires
3112109	31	Caparao
3115904	31	Chacara
3116001	31	Chale
3116308	31	Cipotanea
3200607	32	Aracruz
3203205	32	Linhares
3204351	32	Rio Bananal
3205010	32	Sooretama
3201159	32	Brejetuba
3201902	32	Domingos Martins
3203163	32	Laranja da Terra
3203346	32	Marechal Floriano
3205069	32	Venda Nova do Imigrante
3202900	32	Itarana
3204500	32	Santa Leopoldina
3204609	32	Santa Teresa
3201308	32	Cariacica
3205002	32	Serra
3205101	32	Viana
3205200	32	Vila Velha
3200300	32	Alfredo Chaves
3200409	32	Anchieta
3202405	32	Guarapari
3202603	32	Iconha
3204401	32	Rio Novo do Sul
3200201	32	Alegre
3202009	32	Dores do Rio Preto
3202454	32	Ibatiba
3202553	32	Ibitirama
3202652	32	Irupi
3203700	32	Muniz Freire
3200706	32	Atilio Vivacqua
3201100	32	Bom Jesus do Norte
3201209	32	Cachoeiro de Itapemirim
3201407	32	Castelo
3203403	32	Mimoso do Sul
3203809	32	Muqui
3205036	32	Vargem Alta
3122900	31	Dona Eusebia
3124906	31	Eugenopolis
3125002	31	Ewbank da Camara
3127388	31	Goiana
3128501	31	Guarara
3141603	31	Merces
3142205	31	Mirai
3143906	31	Muriae
3145877	31	Orizania
3148202	31	Patrocinio do Muriae
3151305	31	Pirauba
3156452	31	Rosario da Limeira
3157278	31	Santa Barbara do Monte Verde
3160009	31	Santo Antonio do Aventureiro
3167301	31	Silveirania
3169901	31	Uba
3200508	32	Apiaca
3201001	32	Boa Esperanca
3202306	32	Guacui
3202504	32	Ibiracu
3203007	32	Iuna
3203304	32	Mantenopolis
3203353	32	Marilandia
3203908	32	Nova Venecia
3204054	32	Pedro Canario
3204203	32	Piuma
3204559	32	Santa Maria de Jetiba
3205176	32	Vila Valerio
3205309	32	Vitoria
3202801	32	Itapemirim
3204302	32	Presidente Kennedy
3300605	33	Bom Jesus do Itabapoana
3302056	33	Italva
3302205	33	Itaperuna
3303104	33	Natividade
3306156	33	Varre-Sai
3300902	33	Cambuci
3302106	33	Itaocara
3303005	33	Miracema
3200169	32	Agua Doce do Norte
3200136	32	Aguia Branca
3101508	31	Alem Paraiba
3301009	33	Campos dos Goytacazes
3301157	33	Cardoso Moreira
3300936	33	Carapebus
3300225	33	Areal
3300951	33	Comendador Levy Gasparian
3305406	33	Sapucaia
3301108	33	Cantagalo
3301207	33	Carmo
3301504	33	Cordeiro
3302452	33	Macuco
3300506	33	Bom Jardim
3301603	33	Duas Barras
3303401	33	Nova Friburgo
3305703	33	Sumidouro
3304607	33	Santa Maria Madalena
3305901	33	Trajano de Morais
3301306	33	Casimiro de Abreu
3304524	33	Rio das Ostras
3305604	33	Silva Jardim
3300209	33	Araruama
3300258	33	Arraial do Cabo
3300704	33	Cabo Frio
3301876	33	Iguaba Grande
3305505	33	Saquarema
3300407	33	Barra Mansa
3302254	33	Itatiaia
3303955	33	Pinheiral
3304110	33	Porto Real
3304128	33	Quatis
3304201	33	Resende
3304409	33	Rio Claro
3306305	33	Volta Redonda
3304508	33	Rio das Flores
3300100	33	Angra dos Reis
3303807	33	Parati
3301801	33	Engenheiro Paulo de Frontin
3302809	33	Mendes
3302908	33	Miguel Pereira
3303609	33	Paracambi
3303856	33	Paty do Alferes
3306206	33	Vassouras
3300803	33	Cachoeiras de Macacu
3304300	33	Rio Bonito
3302601	33	Mangaratiba
3300456	33	Belford Roxo
3301702	33	Duque de Caxias
3301850	33	Guapimirim
3302270	33	Japeri
3302858	33	Mesquita
3304144	33	Queimados
3304557	33	Rio de Janeiro
3201803	32	Divino de Sao Lourenco
3202207	32	Fundao
3203130	32	Joao Neiva
3204807	32	Sao Jose do Calcado
3204906	32	Sao Mateus
3300233	33	Armacao dos Buzios
3301405	33	Conceicao de Macabu
3304151	33	Quissama
3304755	33	Sao Francisco de Itabapoana
3304805	33	Sao Fidelis
3304904	33	Sao Goncalo
3305000	33	Sao Joao da Barra
3305109	33	Sao Joao de Meriti
3305133	33	Sao Jose de Uba
3305158	33	Sao Jose do Vale do Rio Preto
3305208	33	Sao Pedro da Aldeia
3305307	33	Sao Sebastiao do Alto
3502606	35	Aparecida d Oeste
3202702	32	Itaguacu
3203056	32	Jaguare
3302007	33	Itaguai
3303500	33	Nova Iguacu
3513850	35	Dirce Reis
3524808	35	Jales
3540259	35	Pontalinda
3540408	35	Populina
3545704	35	Santa Albertina
3547205	35	Santana da Ponte Pensa
3547650	35	Santa Salete
3529609	35	Meridiano
3530003	35	Mira Estrela
3534757	35	Ouroeste
3555307	35	Turmalina
3510708	35	Cardoso
3512902	35	Cosmorama
3536257	35	Parisi
3540309	35	Pontes Gestal
3556107	35	Valentim Gentil
3557105	35	Votuporanga
3500204	35	Adolfo
3500907	35	Altair
3504602	35	Bady Bassitt
3511300	35	Cedral
3517901	35	Guaraci
3524501	35	Jaci
3530300	35	Mirassol
3533007	35	Nova Granada
3534005	35	Onda Verde
3300159	33	Aperibe
3301900	33	Itaborai
3302304	33	Laje do Muriae
3302403	33	Macae
3302502	33	Mage
3302700	33	Marice
3303203	33	Nilopolis
3303302	33	Niteroi
3303708	33	Paraiba do Sul
3303906	33	Petropolis
3304003	33	Pirai
3304102	33	Porciuncula
3305554	33	Seropedica
3305752	33	Tangua
3305802	33	Teresopolis
3306008	33	Tres Rios
3306107	33	Valenca
3503950	35	Aspasia
3504800	35	Balsamo
3535002	35	Palestina
3536604	35	Paulo de Faria
3539608	35	Planalto
3540804	35	Potirendaba
3553401	35	Tanabi
3555356	35	Ubarana
3555604	35	Uchoa
3544202	35	Riolandia
3501202	35	Alvares Florence
3501806	35	Americo de Campos
3557154	35	Zacarias
3503703	35	Ariranha
3509304	35	Cajobi
3511102	35	Catanduva
3533254	35	Novais
3535101	35	Palmares Paulista
3538105	35	Pindorama
3504206	35	Auriflama
3515905	35	Floreal
3516903	35	General Salgado
3529500	35	Mendonca
3532801	35	Nova Alianca
3514205	35	Dolcinopolis
3514924	35	Elisiario
3514957	35	Embauba
3518909	35	Guzolandia
3519402	35	Ibira
3519808	35	Icem
3521150	35	Ipigua
3525706	35	Jose Bonifacio
3528205	35	Macedonia
3529104	35	Marinopolis
3529658	35	Mesopolis
3530409	35	Mirassolandia
3533908	35	Olimpia
3534203	35	Orindiuva
3535705	35	Paraiso
3536901	35	Pedranopolis
3545605	35	Santa Adelia
3546603	35	Santa Fe do Sul
3551900	35	Severinia
3555802	35	Urania
3556958	35	Vitoria Brasil
3528304	35	Magda
3532868	35	Nova Castilho
3528106	35	Macaubal
3532504	35	Neves Paulista
3532603	35	Nhandeara
3539905	35	Poloni
3521903	35	Itajobi
3528858	35	Marapoama
3533502	35	Novo Horizonte
3544806	35	Sales
3505500	35	Barretos
3512001	35	Colina
3524204	35	Jaborandi
3531902	35	Morro Agudo
3533601	35	Nuporanga
3544905	35	Sales Oliveira
3503000	35	Aramina
3508207	35	Buritizal
3520103	35	Igarapava
3524105	35	Ituverava
3513207	35	Cristais Paulista
3516200	35	Franca
3525409	35	Jeriquara
3537008	35	Pedregulho
3542701	35	Restinga
3543600	35	Rifaina
3506102	35	Bebedouro
3515608	35	Fernando Prestes
3518602	35	Guariba
3524303	35	Jaboticabal
3531308	35	Monte Alto
3531506	35	Monte Azul Paulista
3539004	35	Pirangi
3539509	35	Pitangueiras
3546504	35	Santa Ernestina
3553658	35	Taquaral
3553708	35	Taquaritinga
3554409	35	Terra Roxa
3556800	35	Viradouro
3556909	35	Vista Alegre do Alto
3505609	35	Barrinha
3507803	35	Brodowski
3513108	35	Cravinhos
3514601	35	Dumont
3520707	35	Indiapora
3521309	35	Ipua
3521507	35	Irapua
3523701	35	Itirapua
3532702	35	Nipoa
3515202	35	Estrela d Oeste
3518008	35	Guarani d Oeste
3535200	35	Palmeira d Oeste
3535903	35	Paranapua
3546108	35	Santa Clara d Oeste
3547403	35	Santa Rita d Oeste
3543105	35	Ribeirao Corrente
3549003	35	Sao Francisco
3549201	35	Sao Joao das Duas Pontes
3549250	35	Sao Joao de Iracema
3549409	35	Sao Joaquim da Barra
3549508	35	Sao Jose da Bela Vista
3549805	35	Sao Jose do Rio Preto
3552601	35	Tabapua
3555703	35	Uniao Paulista
3540200	35	Pontal
3547502	35	Santa Rita do Passa Quatro
3547601	35	Santa Rosa de Viterbo
3551405	35	Serra Azul
3551504	35	Serrana
3505906	35	Batatais
3509403	35	Cajuru
3502101	35	Andradina
3511003	35	Castilho
3520442	35	Ilha Solteira
3523008	35	Itapura
3532108	35	Murutinga do Sul
3537404	35	Pereira Barreto
3552304	35	Sud Mennucci
3506201	35	Bento de Abreu
3518206	35	Guararapes
3501103	35	Alto Alegre
3504404	35	Avanhandava
3505104	35	Barbosa
3506409	35	Bilac
3506508	35	Birigui
3507753	35	Brejo Alegre
3508108	35	Buritama
3511904	35	Clementina
3512506	35	Coroados
3516507	35	Gabriel Monteiro
3527256	35	Lourdes
3537701	35	Piacatu
3508801	35	Cafelandia
3510104	35	Candido Rodrigues
3510906	35	Cassia dos Coqueiros
3511201	35	Catigua
3517000	35	Getulina
3527108	35	Lins
3544608	35	Sabino
3500709	35	Agudos
3503406	35	Arealva
3504701	35	Balbinos
3506003	35	Bauru
3507456	35	Borebi
3544400	35	Rubiacea
3507704	35	Brauna
3514502	35	Duartina
3519105	35	Iacanga
3539400	35	Piratininga
3541109	35	Presidente Alves
3555505	35	Ubirajara
3555901	35	Uru
3505203	35	Bariri
3505302	35	Barra Bonita
3506805	35	Bocaina
3517802	35	Guaracai
3526803	35	Lencois Paulista
3531001	35	Moncoes
3512100	35	Colombia
3517109	35	Glicerio
3517307	35	Guaimbe
3517406	35	Guaira
3517703	35	Guara
3518859	35	Guatapara
3525102	35	Jardinopolis
3525805	35	Julio Mesquita
3526506	35	Lavinia
3527603	35	Luis Antonio
3527702	35	Luiziania
3529708	35	Miguelopolis
3530102	35	Mirandopolis
3531407	35	Monte Aprazivel
3533205	35	Nova Independencia
3533304	35	Nova Luzitania
3534302	35	Orlandia
3536307	35	Patrocinio Paulista
3536570	35	Paulistania
3537305	35	Penapolis
3538907	35	Pirajui
3540101	35	Pongai
3540903	35	Pradopolis
3542503	35	Reginopolis
3547908	35	Santo Antonio da Alegria
3548054	35	Santo Antonio do Aracangua
3548401	35	Santopolis do Aguapei
3551306	35	Sebastianopolis do Sul
3552551	35	Suzanapolis
3553104	35	Taiacu
3553203	35	Taiuva
3555208	35	Turiuba
3556008	35	Urupes
3556305	35	Valparaiso
3522000	35	Itaju
3528007	35	Macatuba
3536703	35	Pederneiras
3503109	35	Arandu
3519253	35	Iaras
3523503	35	Itatinga
3535804	35	Paranapanema
3502309	35	Anhembi
3506904	35	Bofete
3507506	35	Botucatu
3512308	35	Conchas
3536109	35	Pardinho
3503208	35	Araraquara
3507407	35	Borborema
3514007	35	Dobrada
3519600	35	Ibitinga
3532058	35	Motuca
3532900	35	Nova Europa
3552700	35	Tabatinga
3554755	35	Trabiju
3513702	35	Descalvado
3514304	35	Dourado
3507902	35	Brotas
3523602	35	Itirapina
3543907	35	Rio Claro
3554706	35	Torrinha
3503307	35	Araras
3512209	35	Conchal
3526704	35	Leme
3526902	35	Limeira
3546702	35	Santa Gertrudes
3510401	35	Capivari
3511706	35	Charqueada
3525854	35	Jumirim
3530904	35	Mombuca
3538709	35	Piracicaba
3542107	35	Rafard
3544004	35	Rio das Pedras
3545159	35	Saltinho
3547007	35	Santa Maria da Serra
3539301	35	Pirassununga
3540705	35	Porto Ferreira
3546306	35	Santa Cruz das Palmeiras
3508702	35	Caconde
3510807	35	Casa Branca
3523800	35	Itobi
3518107	35	Guaranta
3529302	35	Matao
3541604	35	Promissao
3542909	35	Ribeirao Bonito
3546207	35	Santa Cruz da Conceicao
3548906	35	Sao Carlos
3550100	35	Sao Manuel
3550407	35	Sao Pedro
3550902	35	Sao Simao
3551702	35	Sertaozinho
3530508	35	Mococa
3553609	35	Tapiratiba
3556404	35	Vargem Grande do Sul
3503802	35	Artur Nogueira
3515152	35	Engenheiro Coelho
3522604	35	Itapira
3530805	35	Moji Mirim
3557303	35	Estiva Gerbi
3501608	35	Americana
3509502	35	Campinas
3514908	35	Elias Fausto
3519055	35	Holambra
3520509	35	Indaiatuba
3531803	35	Monte Mor
3533403	35	Nova Odessa
3537107	35	Pedreira
3556206	35	Valinhos
3556701	35	Vinhedo
3501905	35	Amparo
3531209	35	Monte Alegre do Sul
3536802	35	Pedra Bela
3538204	35	Pinhalzinho
3551603	35	Serra Negra
3552106	35	Socorro
3514403	35	Dracena
3531605	35	Monte Castelo
3533106	35	Nova Guataporanga
3534807	35	Ouro Verde
3535408	35	Panorama
3547106	35	Santa Mercedes
3555109	35	Tupi Paulista
3500105	35	Adamantina
3515806	35	Flora Rica
3521606	35	Irapuru
3534609	35	Osvaldo Cruz
3504305	35	Avai
3504503	35	Avare
3506706	35	Boa Esperanca do Sul
3508306	35	Cabralia Paulista
3511409	35	Cerqueira Cesar
3500402	35	Aguas da Prata
3500501	35	Aguas de Lindoia
3500550	35	Aguas de Santa Barbara
3500600	35	Aguas de Sao Pedro
3543709	35	Rincao
3501707	35	Americo Brasiliense
3502002	35	Analandia
3507308	35	Boraceia
3534906	35	Pacaembu
3540853	35	Pracinha
3544707	35	Sagres
3500808	35	Alfredo Marcondes
3502408	35	Anhumas
3508900	35	Caiabu
3515301	35	Estrela do Norte
3515350	35	Euclides da Cunha Paulista
3520608	35	Indiana
3530201	35	Mirante do Paranapanema
3532207	35	Narandiba
3538303	35	Piquerobi
3539202	35	Pirapozinho
3541208	35	Presidente Bernardes
3541406	35	Presidente Prudente
3530706	35	Mogi Guacu
3512704	35	Corumbatai
3512803	35	Cosmopolis
3513900	35	Divinolandia
3514106	35	Dois Corregos
3515129	35	Emilianopolis
3515186	35	Espirito Santo do Pinhal
3516002	35	Florida Paulista
3519071	35	Hortolandia
3519303	35	Ibate
3520806	35	Inubia Paulista
3521101	35	Ipeuna
3521408	35	Iracemapolis
3521804	35	Itai
3522703	35	Itapolis
3522901	35	Itapui
3524709	35	Jaguariuna
3525300	35	Jau
3526001	35	Junqueiropolis
3527009	35	Lindoia
3527405	35	Lucelia
3528908	35	Mariapolis
3529203	35	Martinopolis
3529807	35	Mineiros do Tiete
3536406	35	Pauliceia
3536505	35	Paulinia
3541059	35	Pratania
3541307	35	Presidente Epitacio
3546900	35	Santa Lucia
3548005	35	Santo Antonio de Posse
3548104	35	Santo Antonio do Jardim
3552403	35	Sumare
3553302	35	Tambau
3554508	35	Tiete
3541505	35	Presidente Venceslau
3542206	35	Rancharia
3544251	35	Rosana
3545506	35	Sandovalina
3548302	35	Santo Expedito
3552908	35	Taciba
3553906	35	Tarabai
3554300	35	Teodoro Sampaio
3505807	35	Bastos
3519204	35	Iacri
3541802	35	Queiroz
3542008	35	Quintana
3534104	35	Oriente
3534500	35	Oscar Bressane
3556602	35	Vera Cruz
3504008	35	Assis
3509809	35	Campos Novos Paulista
3519501	35	Ibirarema
3532157	35	Nantes
3535309	35	Palmital
3537156	35	Pedrinhas Paulista
3539707	35	Platina
3506300	35	Bernardino de Campos
3510153	35	Canitar
3515400	35	Fartura
3520905	35	Ipaussu
3528601	35	Manduri
3534708	35	Ourinhos
3538808	35	Piraju
3545407	35	Salto Grande
3546405	35	Santa Cruz do Rio Pardo
3554607	35	Timburi
3557204	35	Chavantes
3508009	35	Buri
3512605	35	Coronel Macedo
3514700	35	Echapora
3515657	35	Fernao
3525607	35	Joao Ramalho
3536000	35	Parapua
3543204	35	Ribeirao do Sul
3543238	35	Ribeirao dos indios
3549102	35	Sao Joao da Boa Vista
3549300	35	Sao Joao do Pau d Alho
3549706	35	Sao Jose do Rio Pardo
3550506	35	Sao Pedro do Turvo
3550803	35	Sao Sebastiao da Grama
3553955	35	Taruma
3555000	35	Tupa
3522406	35	Itapeva
3522802	35	Itaporanga
3532827	35	Nova Campina
3543501	35	Riversul
3553807	35	Taquarituba
3500758	35	Alambari
3502200	35	Angatuba
3509452	35	Campina do Monte Alegre
3522307	35	Itapetininga
3507001	35	Boituva
3511508	35	Cerquilho
3526407	35	Laranjal Paulista
3537503	35	Pereiras
3540507	35	Porangaba
3541653	35	Quadra
3554656	35	Torre de Pedra
3517604	35	Guapiara
3521200	35	Iporanga
3542800	35	Ribeira
3537800	35	Piedade
3537909	35	Pilar do Sul
3510302	35	Capela do Alto
3523909	35	Itu
3528403	35	Mairinque
3540606	35	Porto Feliz
3545209	35	Salto
3545308	35	Salto de Pirapora
3552205	35	Sorocaba
3557006	35	Votorantim
3509601	35	Campo Limpo Paulista
3524006	35	Itupeva
3527306	35	Louveira
3504107	35	Atibaia
3523404	35	Itatiba
3545100	35	Salmourao
3501152	35	Aluminio
3502705	35	Apiai
3502903	35	Aracoiaba da Serra
3503356	35	Arco-iris
3505351	35	Barra do Chapeu
3507100	35	Bom Jesus dos Perdoes
3507159	35	Bom Sucesso de Itarare
3507605	35	Braganca Paulista
3509106	35	Caiua
3510005	35	Candido Mota
3511607	35	Cesario Lange
3501400	35	Alvaro de Carvalho
3501509	35	Alvinlandia
3507209	35	Bora
3508405	35	Cabreuva
3525201	35	Jarinu
3532009	35	Morungaba
3538600	35	Piracaia
3554953	35	Tuiuti
3556354	35	Vargem
3531704	35	Monteiro Lobato
3538006	35	Pindamonhangaba
3546009	35	Santa Branca
3502507	35	Aparecida
3508603	35	Cachoeira Paulista
3509957	35	Canas
3513405	35	Cruzeiro
3526605	35	Lavrinhas
3527207	35	Lorena
3538501	35	Piquete
3540754	35	Potim
3541901	35	Queluz
3544301	35	Roseira
3503505	35	Areias
3533700	35	Ocaucu
3513306	35	Cruzalia
3516101	35	Florinia
3516606	35	Galia
3518404	35	Guaratingueta
3518503	35	Guarei
3519006	35	Herculandia
3519709	35	Ibiuna
3519907	35	Iepe
3520202	35	Igarata
3521002	35	Ipero
3521705	35	Itabera
3522158	35	Itaoca
3523206	35	Itarare
3524402	35	Jacarei
3525508	35	Joanopolis
3525904	35	Jundiai
3527801	35	Lupercio
3527900	35	Lutecia
3528809	35	Maracai
3529005	35	Marilia
3533809	35	Oleo
3535507	35	Paraguacu Paulista
3540002	35	Pompeia
3541703	35	Quata
3542404	35	Regente Feijo
3547700	35	Santo Anastacio
3548203	35	Santo Antonio do Pinhal
3551108	35	Sarapui
3551207	35	Sarutaia
3553005	35	Taguai
3553500	35	Tapirai
3553856	35	Taquarivai
3554003	35	Tatui
3554102	35	Taubate
3554201	35	Tejupa
3556503	35	Varzea Paulista
3504909	35	Bananal
3552007	35	Silveiras
3513603	35	Cunha
3524907	35	Jambeiro
3526308	35	Lagoinha
3532306	35	Natividade da Serra
3535606	35	Paraibuna
3510500	35	Caraguatatuba
3520400	35	Ilhabela
3555406	35	Ubatuba
3505401	35	Barra do Turvo
3509254	35	Cajati
3514809	35	Eldorado
3520301	35	Iguape
3520426	35	Ilha Comprida
3524600	35	Jacupiranga
3529906	35	Miracatu
3542602	35	Registro
3551801	35	Sete Barras
3523305	35	Itariri
3537206	35	Pedro de Toledo
3505708	35	Barueri
3509205	35	Cajamar
3522505	35	Itapevi
3525003	35	Jandira
3534401	35	Osasco
3539103	35	Pirapora do Bom Jesus
3509007	35	Caieiras
3516309	35	Francisco Morato
3516408	35	Franco da Rocha
3518800	35	Guarulhos
3546801	35	Santa Isabel
3513009	35	Cotia
3515004	35	Embu
3522208	35	Itapecerica da Serra
3526209	35	Juquitiba
3556453	35	Vargem Grande Paulista
3513801	35	Diadema
3544103	35	Rio Grande da Serra
3510203	35	Capao Bonito
3522653	35	Itapirapua Paulista
3528502	35	Mairipora
3542305	35	Redencao da Serra
3543006	35	Ribeirao Branco
3543303	35	Ribeirao Pires
3548609	35	Sao Bento do Sapucai
3548708	35	Sao Bernardo do Campo
3549607	35	Sao Jose do Barreiro
3549904	35	Sao Jose dos Campos
3549953	35	Sao Lourenco da Serra
3550001	35	Sao Luis do Paraitinga
3550209	35	Sao Miguel Arcanjo
3550605	35	Sao Roque
3552809	35	Taboao da Serra
3550704	35	Sao Sebastiao
3506607	35	Biritiba-Mirim
3515707	35	Ferraz de Vasconcelos
3518305	35	Guararema
3523107	35	Itaquaquecetuba
3530607	35	Mogi das Cruzes
3552502	35	Suzano
3506359	35	Bertioga
3541000	35	Praia Grande
3548500	35	Santos
4106704	41	Cruzeiro do Sul
4107108	41	Diamante do Norte
4112603	41	Jardim Olinda
4113502	41	Loanda
4115002	41	Marilena
4115903	41	Mirador
4117107	41	Nova Londrina
4118105	41	Paranacity
4118303	41	Paranapoema
4120200	41	Porto Rico
4123303	41	Santa Cruz de Monte Castelo
4126702	41	Tamboara
4127304	41	Terra Rica
4100707	41	Alto Piquiri
4103479	41	Cafezal do Sul
4106605	41	Cruzeiro do Oeste
4107256	41	Douradina
4108320	41	Francisco Alves
4114708	41	Maria Helena
4115101	41	Mariluz
4118857	41	Perobal
3545001	35	Salesopolis
4100608	41	Alto Parana
4100905	41	Amapora
4126900	41	Tapira
4128104	41	Umuarama
3503901	35	Aruja
3508504	35	Cacapava
3509908	35	Cananeia
3510609	35	Carapicuiba
4105508	41	Cianorte
4109104	41	Guaporema
4113007	41	Jussara
4122602	41	Rondon
4126801	41	Tapejara
4127908	41	Tuneiras do Oeste
4103909	41	Campina da Lagoa
4112959	41	Juranda
4116109	41	Moreira Sales
4116802	41	Nova Cantu
4101705	41	Araruna
4102505	41	Barbosa Ferraz
4107553	41	Farol
4110805	41	Iretama
4113734	41	Luiziana
4118808	41	Peabiru
4121109	41	Quinta do Sol
4122503	41	Roncador
4127205	41	Terra Boa
4102109	41	Astorga
4102208	41	Atalaia
3518701	35	Guaruja
3522109	35	Itanhaem
3526100	35	Juquia
3529401	35	Maua
3531100	35	Mongagua
3536208	35	Pariquera-Acu
3537602	35	Peruibe
3539806	35	Poa
3547809	35	Santo Andre
4103008	41	Boa Esperanca
4103370	41	Brasilandia do Sul
4105607	41	Cidade Gaucha
4106555	41	Corumbatai do Sul
4107520	41	Esperanca Nova
4107702	41	Fenix
4108601	41	Goioere
4108908	41	Guairaca
4109906	41	Icaraima
4110300	41	Inaja
4110409	41	Indianopolis
4111308	41	Itauna do Sul
4111555	41	Ivate
4112207	41	Janiopolis
4112405	41	Japura
4114005	41	Mambore
4117206	41	Nova Olimpia
4118006	41	Paraiso do Norte
4118402	41	Paranavai
4118907	41	Perola
4119707	41	Planaltina do Parana
4120655	41	Quarto Centenario
4121000	41	Querencia do Norte
4123709	41	Santa Isabel do Ivai
4123956	41	Santa Monica
4124202	41	Santo Antonio do Caiua
4128807	41	Xambre
4103404	41	Cafeara
4105904	41	Colorado
4109203	41	Guaraci
4113601	41	Lobato
4116307	41	Munhoz de Melo
4120408	41	Presidente Castelo Branco
4128302	41	Uniflor
4100806	41	Alvorada do Sul
4116000	41	Miraselva
4120002	41	Porecatu
4120333	41	Prado Ferreira
4120507	41	Primeiro de Maio
4107306	41	Doutor Camargo
4107900	41	Floresta
4111605	41	Ivatuba
4117404	41	Ourizona
4114203	41	Mandaguari
4114807	41	Marialva
4126256	41	Sarandi
4101408	41	Apucarana
4101507	41	Arapongas
4103800	41	Cambira
4112108	41	Jandaia do Sul
4117297	41	Novo Itacolomi
4113700	41	Londrina
4119657	41	Pitangueiras
4121356	41	Rancho Alegre D Oeste
3548807	35	Sao Caetano do Sul
3550308	35	Sao Paulo
3551009	35	Sao Vicente
4107504	41	Engenheiro Beltrao
4109807	41	Ibipora
4110607	41	Ipora
4111902	41	Jaguapita
4124608	41	Sao Carlos do Ivai
4124905	41	Sao Joao do Caiua
4125308	41	Sao Jorge do Ivai
4125357	41	Sao Jorge do Patrocinio
4125555	41	Sao Manoel do Parana
4125902	41	Sao Pedro do Parana
4126108	41	Sao Tome
4128005	41	Ubirata
4126678	41	Tamarana
4103206	41	Bom Sucesso
4106852	41	Cruzmaltina
4107603	41	Faxinal
4115507	41	Marumbi
4122107	41	Rio Bom
4108551	41	Godoy Moreira
4108700	41	Grandes Rios
4112504	41	Jardim Alegre
4113759	41	Lunardelli
4114500	41	Manoel Ribas
4117271	41	Nova Tebas
4112702	41	Jataizinho
4121307	41	Rancho Alegre
4102406	41	Bandeirantes
4106001	41	Congonhinhas
4123907	41	Santa Mariana
4126405	41	Sertaneja
4111803	41	Jacarezinho
4106100	41	Conselheiro Mairinck
4107751	41	Figueira
4109708	41	Ibaiti
4100459	41	Altamira do Parana
4128625	41	Alto Paraiso
4101101	41	Andira
4101150	41	Angulo
4111704	41	Jaboti
4112306	41	Japira
4126207	41	Sapopema
4109005	41	Guapirama
4126603	41	Siqueira Campos
4127809	41	Tomazina
4128500	41	Wenceslau Braz
4117305	41	Ortigueira
4121703	41	Reserva
4127502	41	Tibagi
4128534	41	Ventania
4101606	41	Arapoti
4104907	41	Castro
4117701	41	Palmeira
4119905	41	Ponta Grossa
4102000	41	Assis Chateaubriand
4107538	41	Entre Rios do Oeste
4108205	41	Formosa do Oeste
4110656	41	Iracema do Oeste
4115853	41	Mercedes
4117222	41	Nova Santa Rosa
4117453	41	Ouro Verde do Oeste
4117909	41	Palotina
4101903	41	Assai
4102703	41	Barra do Jacare
4102802	41	Bela Vista do Paraiso
4103305	41	Borrazopolis
4103503	41	California
4103602	41	Cambara
4103701	41	Cambe
4104402	41	Candido de Abreu
4104659	41	Carambei
4104709	41	Carlopolis
4105102	41	Centenario do Sul
4106407	41	Cornelio Procopio
4107009	41	Curiuva
4107801	41	Florai
4108007	41	Florestopolis
4108106	41	Florida
4108809	41	Guaira
4110003	41	Iguaracu
4110078	41	Imbau
4111001	41	Itambaraca
4111100	41	Itambe
4112009	41	Jaguariaiva
4112751	41	Jesuitas
4112801	41	Joaquim Tavora
4112900	41	Jundiai do Sul
4113106	41	Kalore
4113403	41	Leopolis
4113429	41	Lidianopolis
4113809	41	Lupionopolis
4114104	41	Mandaguacu
4114609	41	Marechal Candido Rondon
4114906	41	Marilandia do Sul
4115200	41	Maringa
4115358	41	Maripa
4116406	41	Nossa Senhora das Gracas
4116604	41	Nova America da Colina
4116901	41	Nova Esperanca
4117008	41	Nova Fatima
4117214	41	Nova Santa Barbara
4117503	41	Paicandu
4119400	41	Pirai do Sul
4120705	41	Quatigua
4122172	41	Rio Branco do Ivai
4122404	41	Rolandia
4122651	41	Rosario do Ivai
4122701	41	Sabaudia
4122909	41	Salto do Itarare
4123105	41	Santa Amelia
4123402	41	Santa Fe
4123600	41	Santa Ines
4124004	41	Santana do Itarare
4124103	41	Santo Antonio da Platina
4124301	41	Santo Antonio do Paraiso
4124509	41	Santo Inacio
4126306	41	Senges
4126504	41	Sertanopolis
4127106	41	Telemaco Borba
4128401	41	Urai
4118451	41	Pato Bragado
4120853	41	Quatro Pontes
4123501	41	Santa Helena
4127403	41	Terra Roxa
4127700	41	Toledo
4101051	41	Anahy
4103057	41	Boa Vista da Aparecida
4103354	41	Braganey
4104055	41	Campo Bonito
4104808	41	Cascavel
4105003	41	Catanduvas
4107124	41	Diamante do Sul
4109757	41	Ibema
4110052	41	Iguatu
4113452	41	Lindoeste
4116703	41	Nova Aurora
4124020	41	Santa Tereza do Oeste
4115804	41	Medianeira
4116059	41	Missal
4124053	41	Santa Terezinha de Itaipu
4128559	41	Vera Cruz do Oeste
4102752	41	Bela Vista da Caroba
4104501	41	Capanema
4119806	41	Planalto
4120358	41	Pranchita
4121406	41	Realeza
4123808	41	Santa Izabel do Oeste
4103156	41	Bom Jesus do Sul
4107207	41	Dois Vizinhos
4107850	41	Flor da Serra do Sul
4101655	41	Arapua
4119004	41	Perola d Oeste
4102604	41	Barracao
4111506	41	Ivaipora
4119202	41	Pinhalao
4121802	41	Ribeirao Claro
4121901	41	Ribeirao do Pinhal
4123204	41	Santa Cecilia do Pavao
4124707	41	Sao Jeronimo da Serra
4125001	41	Sao Joao do Ivai
4125407	41	Sao Jose da Boa Vista
4125456	41	Sao Jose das Palmeiras
4125704	41	Sao Miguel do Iguacu
4125753	41	Sao Pedro do Iguacu
4125803	41	Sao Pedro do Ivai
4126009	41	Sao Sebastiao da Amoreira
4127957	41	Tupassi
4115408	41	Marmeleiro
4122800	41	Salgado Filho
4123006	41	Salto do Lontra
4103222	41	Bom Sucesso do Sul
4105409	41	Chopinzinho
4106506	41	Coronel Vivida
4118501	41	Pato Branco
4126652	41	Sulina
4128708	41	Vitorino
4113254	41	Laranjal
4115739	41	Mato Rico
4117800	41	Palmital
4119608	41	Pitanga
4123857	41	Santa Maria do Oeste
4104451	41	Cantagalo
4108650	41	Goioxim
4109401	41	Guarapuava
4113304	41	Laranjeiras do Sul
4115457	41	Marquinho
4117057	41	Nova Laranjeiras
4120150	41	Porto Barreiro
4127965	41	Turvo
4128658	41	Virmond
4106456	41	Coronel Domingos Soares
4114401	41	Mangueirinha
4117602	41	Palmas
4107736	41	Fernandes Pinheiro
4108957	41	Guamiranga
4110102	41	Imbituva
4110508	41	Ipiranga
4127007	41	Teixeira Soares
4110706	41	Irati
4113908	41	Mallet
4122008	41	Rio Azul
4102901	41	Bituruna
4106803	41	Cruz Machado
4108502	41	General Carneiro
4118600	41	Paula Freitas
4118709	41	Paulo Frontin
4105201	41	Cerro Azul
4128633	41	Doutor Ulysses
4113205	41	Lapa
4120101	41	Porto Amazonas
4102307	41	Balsa Nova
4104006	41	Campina Grande do Sul
4104204	41	Campo Largo
4104253	41	Campo Magro
4105805	41	Colombo
4106209	41	Contenda
4106902	41	Curitiba
4107652	41	Fazenda Rio Grande
4114302	41	Mandirituba
4119152	41	Pinhais
4119509	41	Piraquara
4120804	41	Quatro Barras
4122206	41	Rio Branco do Sul
4101200	41	Antonina
4109609	41	Guaratuba
4115705	41	Matinhos
4116208	41	Morretes
4100301	41	Agudos do Sul
4104105	41	Campo do Tenente
4101804	41	Araucaria
4103024	41	Boa Esperanca do Iguacu
4103107	41	Bocaiuva do Sul
4103453	41	Cafelandia
4104428	41	Candoi
4105300	41	Ceu Azul
4105706	41	Clevelandia
4106308	41	Corbelia
4106571	41	Cruzeiro do Iguacu
4107405	41	Eneas Marques
4108304	41	Foz do Iguacu
4109302	41	Guaraniacu
4109500	41	Guaraquecaba
4109658	41	Honorio Serpa
4110201	41	Inacio Martins
4110953	41	Itaipulandia
4111258	41	Itaperucu
4111407	41	Ivai
4115309	41	Mariopolis
4115606	41	Matelandia
4116950	41	Nova Esperanca do Sudoeste
4117255	41	Nova Prata do Iguacu
4118204	41	Paranagua
4119103	41	Pien
4119954	41	Pontal do Parana
4120309	41	Porto Vitoria
4120606	41	Prudentopolis
4120903	41	Quedas do Iguacu
4121257	41	Ramilandia
4121505	41	Reboucas
4121604	41	Renascenca
4121752	41	Reserva do Iguacu
4122156	41	Rio Bonito do Iguacu
4123824	41	Santa Lucia
4126272	41	Saudade do Iguacu
4127858	41	Tres Barras do Parana
4127882	41	Tunas do Parana
4128609	41	Vere
4121208	41	Quitandinha
4122305	41	Rio Negro
4127601	41	Tijucas do Sul
4200804	42	Anchieta
4202081	42	Bandeirante
4202099	42	Barra Bonita
4202156	42	Belmonte
4204905	42	Descanso
4206405	42	Guaraciaba
4208401	42	Itapiranga
4212007	42	Palma Sola
4214151	42	Princesa
4215075	42	Riqueza
4215554	42	Santa Helena
4202578	42	Bom Jesus do Oeste
4203105	42	Caibi
4204103	42	Caxambu do Sul
4204350	42	Cordilheira Alta
4204400	42	Coronel Freitas
4205431	42	Formosa do Sul
4207759	42	Iraceminha
4207858	42	Irati
4210506	42	Maravilha
4210902	42	Modelo
4211405	42	Nova Erechim
4211454	42	Nova Itaberaba
4211652	42	Novo Horizonte
4212106	42	Palmitos
4212908	42	Pinhalzinho
4213153	42	Planalto Alegre
4111209	41	Itapejara d Oeste
4125209	41	Sao Jorge d Oeste
4207650	42	Ipora do Oeste
4216255	42	Sao Joao do Oeste
4103040	41	Boa Ventura de Sao Roque
4103958	41	Campina do Simao
4108452	41	Foz do Jordao
4108403	41	Francisco Beltrao
4107546	41	Espigao Alto do Iguacu
4119251	41	Pinhal de Sao Bento
4119301	41	Pinhao
4124806	41	Sao Joao
4125506	41	Sao Jose dos Pinhais
4125605	41	Sao Mateus do Sul
4128203	41	Uniao da Vitoria
4204707	42	Cunha Pora
4205357	42	Flor do Sertao
4216701	42	Sao Jose do Cedro
4217204	42	Sao Miguel do Oeste
4214201	42	Quilombo
4215356	42	Saltinho
4215687	42	Santa Terezinha do Progresso
4215695	42	Santiago do Sul
4217303	42	Saudades
4217550	42	Serra Alta
4217758	42	Sul Brasil
4217956	42	Tigrinhos
4200101	42	Abelardo Luz
4202537	42	Bom Jesus
4204459	42	Coronel Martins
4205175	42	Entre Rios
4205308	42	Faxinal dos Guedes
4209458	42	Lajeado Grande
4210555	42	Marema
4211850	42	Ouro Verde
4212270	42	Passos Maia
4213401	42	Ponte Serrada
4219705	42	Xaxim
4201604	42	Arroio Trinta
4203154	42	Calmon
4203907	42	Capinzal
4204004	42	Catanduvas
4205209	42	Erval Velho
4205506	42	Fraiburgo
4206751	42	Ibiam
4210035	42	Luzerna
4210050	42	Macieira
4210704	42	Matos Costa
4211801	42	Ouro
4213005	42	Pinheiro Preto
4214409	42	Rio das Antas
4215406	42	Salto Veloso
4219176	42	Vargem Bonita
4200408	42	Agua Doce
4200507	42	Aguas de Chapeco
4200556	42	Aguas Frias
4219309	42	Videira
4200754	42	Alto Bela Vista
4201653	42	Arvoredo
4207601	42	Ipira
4207700	42	Ipumirim
4207809	42	Irani
4211876	42	Paial
4212601	42	Peritiba
4213104	42	Piratuba
4213906	42	Presidente Castello Branco
4217501	42	Seara
4219606	42	Xavantina
4202131	42	Bela Vista do Toldo
4203808	42	Canoinhas
4210100	42	Mafra
4210308	42	Major Vieira
4211108	42	Monte Castelo
4212205	42	Papanduva
4215679	42	Santa Terezinha
4203303	42	Campo Alegre
4215000	42	Rio Negrinho
4201307	42	Araquari
4205803	42	Garuva
4206504	42	Guaramirim
4209102	42	Joinville
4210605	42	Massaranduba
4217402	42	Schroeder
4200051	42	Abdon Batista
4203600	42	Campos Novos
4204806	42	Curitibanos
4211058	42	Monte Carlo
4213302	42	Ponte Alta
4203006	42	Cacador
4207684	42	Ipuacu
4209003	42	Joacaba
4202875	42	Brunopolis
4203501	42	Campo Ere
4204202	42	Chapeco
4204301	42	Concordia
4204509	42	Corupa
4204756	42	Cunhatai
4205001	42	Dionisio Cerqueira
4205555	42	Frei Rogerio
4206603	42	Guaruja do Sul
4206652	42	Guatambu
4206801	42	Ibicare
4207577	42	Iomere
4207908	42	Irineopolis
4208005	42	Ita
4208104	42	Itaiopolis
4208450	42	Itapoa
4208609	42	Jabora
4208955	42	Jardinopolis
4209177	42	Jupia
4209201	42	Lacerdopolis
4209706	42	Lebon Regis
4209854	42	Lindoia do Sul
4211009	42	Mondai
4212239	42	Paraiso
4215208	42	Romelandia
4217907	42	Tangara
4218251	42	Timbo Grande
4218301	42	Tres Barras
4218509	42	Treze Tilias
4218756	42	Tunapolis
4219507	42	Xanxere
4213351	42	Ponte Alta do Norte
4219150	42	Vargem
4201000	42	Anita Garibaldi
4202438	42	Bocaina do Sul
4202503	42	Bom Jardim da Serra
4202602	42	Bom Retiro
4203402	42	Campo Belo do Sul
4204152	42	Celso Ramos
4204178	42	Cerro Negro
4204558	42	Correia Pinto
4209300	42	Lages
4211892	42	Painel
4212056	42	Palmeira
4215059	42	Rio Rufino
4218905	42	Urubici
4218954	42	Urupema
4201901	42	Aurora
4205100	42	Dona Emma
4206900	42	Ibirama
4209508	42	Laurentino
4209904	42	Lontras
4210852	42	Mirim Doce
4213708	42	Pouso Redondo
4214102	42	Presidente Nereu
4214508	42	Rio do Campo
4214607	42	Rio do Oeste
4214805	42	Rio do Sul
4215307	42	Salete
4218608	42	Trombudo Central
4219358	42	Vitor Meireles
4219408	42	Witmarsum
4201703	42	Ascurra
4202206	42	Benedito Novo
4202404	42	Blumenau
4202909	42	Brusque
4201273	42	Arabuta
4203253	42	Capao Alto
4205605	42	Galvao
4213609	42	Porto Uniao
4215752	42	Sao Bernardino
4215802	42	Sao Bento do Sul
4216008	42	Sao Carlos
4216107	42	Sao Domingos
4216206	42	Sao Francisco do Sul
4216503	42	Sao Joaquim
4216800	42	Sao Jose do Cerrito
4216909	42	Sao Lourenco do Oeste
4217154	42	Sao Miguel da Boa Vista
4218855	42	Uniao do Oeste
4219101	42	Vargeao
4205159	42	Doutor Pedrinho
4205902	42	Gaspar
4206306	42	Guabiruba
4207502	42	Indaial
4210001	42	Luiz Alves
4213203	42	Pomerode
4214706	42	Rio dos Cedros
4215109	42	Rodeio
4202107	42	Barra Velha
4202453	42	Bombinhas
4207106	42	Ilhota
4208302	42	Itapema
4211306	42	Navegantes
4212502	42	Penha
4213500	42	Porto Belo
4201802	42	Atalanta
4207403	42	Imbuia
4208500	42	Ituporanga
4219200	42	Vidal Ramos
4200903	42	Angelina
4203709	42	Canelinha
4209805	42	Leoberto Leal
4210209	42	Major Gercino
4211504	42	Nova Trento
4218004	42	Tijucas
4206009	42	Governador Celso Ramos
4212304	42	Paulo Lopes
4215703	42	Santo Amaro da Imperatriz
4200705	42	Alfredo Wagner
4214300	42	Rancho Queimado
4203956	42	Capivari de Baixo
4205704	42	Garopaba
4206207	42	Gravatal
4200309	42	Agronomica
4200606	42	Aguas Mornas
4201109	42	Anitapolis
4201208	42	Antonio Carlos
4207304	42	Imbituba
4208807	42	Jaguaruna
4209409	42	Laguna
4211702	42	Orleans
4212403	42	Pedras Grandes
4214904	42	Rio Fortuna
4215604	42	Santa Rosa de Lima
4218400	42	Treze de Maio
4204251	42	Cocal do Sul
4205456	42	Forquilhinha
4209607	42	Lauro Muller
4211603	42	Nova Veneza
4218350	42	Treviso
4219002	42	Urussanga
4205191	42	Ermo
4208708	42	Jacinto Machado
4210803	42	Meleiro
4211256	42	Morro Grande
4212254	42	Passo de Torres
4213807	42	Praia Grande
4215653	42	Santa Rosa do Sul
4217709	42	Sombrio
4218806	42	Turvo
4300307	43	Alecrim
4313425	43	Novo Machado
4315008	43	Porto Lucena
4315073	43	Porto Vera Cruz
4317202	43	Santa Rosa
4317905	43	Santo Cristo
4322103	43	Tucunduva
4322301	43	Tuparendi
4301859	43	Barra do Guarita
4201257	42	Apiuna
4201406	42	Ararangua
4201505	42	Armazem
4201950	42	Balneario Arroio do Silva
4211207	42	Morro da Fumaca
4202073	42	Balneario Gaivota
4202305	42	Biguacu
4202701	42	Botuvera
4202800	42	Braco do Norte
4203204	42	Camboriu
4204608	42	Criciuma
4205407	42	Florianopolis
4207205	42	Imarui
4208203	42	Itajai
4209151	42	Josa Boiteux
4210407	42	Maracaja
4202008	42	Balneario Camboriu
4211751	42	Otacilio Costa
4211900	42	Palhoca
4212700	42	Petrolandia
4212809	42	Balneario Picarras
4214003	42	Presidente Getulio
4215505	42	Santa Cecilia
4217600	42	Sideropolis
4217808	42	Taio
4218103	42	Timbe do Sul
4218202	42	Timbo
4219853	42	Zortea
4304309	43	Candido Godoi
4310405	43	Independencia
4315057	43	Porto Maua
4302378	43	Bom Progresso
4302600	43	Braga
4304002	43	Campo Novo
4306007	43	Crissiumal
4306320	43	Derrubadas
4309605	43	Horizontina
4315404	43	Redentora
4320230	43	Sede Nova
4321402	43	Tenente Portela
4321477	43	Tiradentes do Sul
4300505	43	Alpestre
4300646	43	Ametista do Sul
4305801	43	Constantina
4306072	43	Cristal do Sul
4306924	43	Engenho Velho
4307302	43	Erval Seco
4308508	43	Frederico Westphalen
4309126	43	Gramado dos Loureiros
4311601	43	Liberato Salzano
4312708	43	Nonoai
4313441	43	Novo Tiradentes
4313466	43	Novo Xingu
4313805	43	Palmitinho
4314498	43	Pinheirinho do Vale
4314704	43	Planalto
4315909	43	Rodeio Bonito
4316204	43	Rondinha
4320206	43	Seberi
4321956	43	Trindade do Sul
4323101	43	Vicente Dutra
4206108	42	Grao Para
4215455	42	Sangao
4215901	42	Sao Bonifacio
4216305	42	Sao Joao Batista
4216354	42	Sao Joao do Itaperiu
4216602	42	Sao Jose
4321808	43	Tres de Maio
4321857	43	Tres Palmeiras
4321907	43	Tres Passos
4323705	43	Vista Gaucha
4216404	42	Sao Joao do Sul
4217006	42	Sao Ludgero
4217105	42	Sao Martinho
4217253	42	Sao Pedro de Alcantara
4218707	42	Tubarao
4306429	43	Dois Irmaos das Missoes
4318499	43	Sao Jose do Inhacora
4319109	43	Sao Martinho
4323507	43	Vista Alegre
4300901	43	Aratiba
4301925	43	Barra do Rio Azul
4302055	43	Benjamin Constant do Sul
4303806	43	Campinas do Sul
4304853	43	Carlos Gomes
4306130	43	Cruzaltense
4306957	43	Entre Rios do Sul
4306973	43	Erebango
4307005	43	Erechim
4307203	43	Erval Grande
4308052	43	Faxinalzinho
4308250	43	Floriano Peixoto
4308706	43	Gaurama
4310462	43	Ipiranga do Sul
4310702	43	Itatiba do Sul
4310900	43	Jacutinga
4311908	43	Marcelino Ramos
4312005	43	Mariano Moro
4314134	43	Paulo Bento
4314787	43	Ponte Preta
4320602	43	Severiano de Almeida
4322905	43	Viadutos
4303202	43	Cacique Doble
4311700	43	Machadinho
4312203	43	Maximiliano de Almeida
4313607	43	Paim Filho
4316600	43	Sananduva
4317954	43	Santo Expedito do Sul
4322186	43	Tupanci do Sul
4305207	43	Cerro Largo
4312179	43	Mato Queimado
4315107	43	Porto Xavier
4316303	43	Roque Gonzales
4320578	43	Sete de Setembro
4302501	43	Bossoroca
4306353	43	Dezesseis de Novembro
4315958	43	Rolador
4320321	43	Senador Salgado Filho
4322343	43	Ubiretama
4300208	43	Ajuricaba
4300455	43	Alegria
4301503	43	Augusto Pestana
4302584	43	Bozano
4305405	43	Chiapetta
4305702	43	Condor
4305871	43	Coronel Barros
4305900	43	Coronel Bicaco
4313334	43	Nova Ramada
4313904	43	Panambi
4317806	43	Santo Augusto
4301958	43	Barra Funda
4304705	43	Carazinho
4305157	43	Cerro Grande
4305306	43	Chapada
4305850	43	Coqueiros do Sul
4310850	43	Jaboticaba
4311429	43	Lajeado do Bugre
4312955	43	Nova Boa Vista
4313490	43	Novo Barreiro
4314456	43	Pinhal
4320107	43	Sarandi
4303558	43	Camargo
4304903	43	Casca
4304952	43	Caseiros
4305371	43	Charrua
4305975	43	Coxilha
4306304	43	David Canabarro
4307054	43	Ernestina
4308854	43	Gentil
4302154	43	Boa Vista das Missoes
4303301	43	Caibate
4303400	43	Caicara
4305009	43	Catuipe
4305116	43	Centenario
4305504	43	Ciriaco
4306734	43	Doutor Mauricio Cardoso
4306932	43	Entre-Ijuis
4307450	43	Esperanca do Sul
4307831	43	Eugenio de Castro
4308904	43	Getulio Vargas
4309001	43	Girua
4309506	43	Guarani das Missoes
4309704	43	Humaita
4309803	43	Ibiaca
4310207	43	Ijui
4310413	43	Inhacora
4310504	43	Irai
4312302	43	Miraguai
4313011	43	Nova Candelaria
4313706	43	Palmeira das Missoes
4314308	43	Pejucara
4314555	43	Pirapo
4315552	43	Rio dos Indios
4309902	43	Ibiraiaras
4311809	43	Marau
4312138	43	Mato Castelhano
4312625	43	Muliterno
4312674	43	Nicolau Vergueiro
4314100	43	Passo Fundo
4316105	43	Ronda Alta
4320909	43	Tapejara
4322558	43	Vanini
4323408	43	Vila Maria
4300554	43	Alto Alegre
4302220	43	Boa Vista do Cadeado
4302238	43	Boa Vista do Incra
4304101	43	Campos Borges
4306106	43	Cruz Alta
4307500	43	Espumoso
4308458	43	Fortaleza dos Valos
4310876	43	Jacuizinho
4315354	43	Quinze de Novembro
4316436	43	Saldanha Marinho
4305603	43	Colorado
4320305	43	Selbach
4321006	43	Tapera
4321469	43	Tio Hugo
4323200	43	Victor Graeff
4302006	43	Barros Cassal
4308300	43	Fontoura Xavier
4301800	43	Barracao
4307559	43	Estacao
4309951	43	Ibirapuita
4312658	43	Nao-Me-Toque
4314779	43	Pontao
4315313	43	Quatro Irmaos
4318424	43	Sao Joao da Urtiga
4318457	43	Sao Jose das Missoes
4318606	43	Sao Jose do Ouro
4318903	43	Sao Luiz Gonzaga
4316451	43	Salto do Jacui
4316477	43	Salvador das Missoes
4316709	43	Santa Barbara do Sul
4316733	43	Santa Cecilia do Sul
4317509	43	Santo Angelo
4317558	43	Santo Antonio do Palma
4321634	43	Tres Arroios
4317756	43	Santo Antonio do Planalto
4317707	43	Santo Antonio das Missoes
4323358	43	Vila Langaro
4323754	43	Vitoria das Missoes
4319158	43	Sao Miguel das Missoes
4319208	43	Sao Nicolau
4319307	43	Sao Paulo das Missoes
4319364	43	Sao Pedro das Missoes
4319372	43	Sao Pedro do Butia
4319703	43	Sao Valentim
4319737	43	Sao Valerio do Sul
4320503	43	Sertao
4320800	43	Soledade
4322152	43	Tunas
4300703	43	Anta Gorda
4301404	43	Arvorezinha
4306452	43	Dois Lajeados
4309258	43	Guabiju
4310579	43	Itapuca
4312351	43	Montauri
4312757	43	Nova Alvorada
4312906	43	Nova Bassano
4313300	43	Nova Prata
4315206	43	Putinga
4323606	43	Vista Alegre do Prata
4302303	43	Bom Jesus
4303673	43	Campestre da Serra
4307401	43	Esmeralda
4311122	43	Jaquirana
4311304	43	Lagoa Vermelha
4312377	43	Monte Alegre dos Campos
4314464	43	Pinhal da Serra
4322509	43	Vacaria
4302253	43	Boa Vista do Sul
4304804	43	Carlos Barbosa
4305108	43	Caxias do Sul
4305934	43	Coronel Pilar
4307864	43	Fagundes Varela
4307906	43	Farroupilha
4308201	43	Flores da Cunha
4308607	43	Garibaldi
4312385	43	Monte Belo do Sul
4300471	43	Almirante Tamandare do Sul
4300661	43	Andre da Rocha
4313359	43	Nova Roma do Sul
4317251	43	Santa Tereza
4323309	43	Vila Flores
4310553	43	Itacurubi
4311130	43	Jari
4314472	43	Pinhal Grande
4315321	43	Quevedos
4317400	43	Santiago
4322376	43	Unistalda
4302907	43	Cacequi
4306379	43	Dilermando de Aguiar
4310538	43	Itaara
4311106	43	Jaguari
4312104	43	Mata
4316907	43	Santa Maria
4321493	43	Toropi
4323457	43	Vila Nova do Sul
4300109	43	Agudo
4306700	43	Dona Francisca
4308003	43	Faxinal do Soturno
4308409	43	Formigueiro
4313102	43	Nova Palma
4315503	43	Restinga Seca
4320651	43	Silveira Martins
4301206	43	Arroio do Tigre
4307815	43	Estrela Velha
4309159	43	Gramado Xavier
4309571	43	Herveiras
4309753	43	Ibarama
4311239	43	Lagoa Bonita do Sul
4314068	43	Passa Sete
4316808	43	Santa Cruz do Sul
4320263	43	Segredo
4320677	43	Sinimbu
4320701	43	Sobradinho
4322533	43	Vale do Sol
4322707	43	Vera Cruz
4301008	43	Arroio do Meio
4302402	43	Bom Retiro do Sul
4304614	43	Canudos do Vale
4305587	43	Colinas
4305835	43	Coqueiro Baixo
4306205	43	Cruzeiro do Sul
4306759	43	Doutor Ricardo
4306809	43	Encantado
4307807	43	Estrela
4308078	43	Fazenda Vilanova
4302105	43	Bento Goncalves
4303608	43	Cambara do Sul
4304200	43	Candelaria
4309407	43	Guapore
4310009	43	Ibiruba
4310306	43	Ilopolis
4310439	43	Ipe
4310751	43	Ivora
4311155	43	Joia
4311205	43	Julio de Castilhos
4312427	43	Mormaco
4312617	43	Muitos Capoes
4312807	43	Nova Araca
4313037	43	Nova Esperanca do Sul
4313086	43	Nova Padua
4314001	43	Parai
4315172	43	Protasio Alves
4308433	43	Forquetinha
4310363	43	Imigrante
4311403	43	Lajeado
4312054	43	Marques de Souza
4314159	43	Paverama
4315131	43	Pouso Novo
4315156	43	Progresso
4315453	43	Relvado
4315800	43	Roca Sales
4316758	43	Santa Clara do Sul
4321303	43	Taquari
4321626	43	Travesseiro
4322855	43	Vespasiano Correa
4323770	43	Westfalia
4303004	43	Cachoeira do Sul
4305132	43	Cerro Branco
4313391	43	Novo Cabrais
4313953	43	Pantano Grande
4314076	43	Passo do Sobrado
4315701	43	Rio Pardo
4300570	43	Alto Feliz
4302659	43	Brochier
4304689	43	Capela de Santana
4308102	43	Feliz
4309555	43	Harmonia
4311643	43	Linha Nova
4302451	43	Boqueirao do Leao
4304622	43	Capao Bonito do Sul
4304655	43	Capao do Cipo
4304697	43	Capitao
4305959	43	Cotipora
4311254	43	Lagoao
4312153	43	Mato Leitao
4318432	43	Sao Joao do Polesine
4318440	43	Sao Jorge
4318465	43	Sao Jose do Herval
4318622	43	Sao Jose dos Ausentes
4319000	43	Sao Marcos
4319125	43	Sao Martinho da Serra
4319406	43	Sao Pedro do Sul
4319604	43	Sao Sepe
4319711	43	Sao Valentim do Sul
4320453	43	Serio
4320859	43	Tabai
4322608	43	Venancio Aires
4322806	43	Veranopolis
4319802	43	Sao Vicente do Sul
4322202	43	Tupancireta
4322350	43	Uniao da Serra
4312401	43	Montenegro
4314035	43	Pareci Novo
4316501	43	Salvador do Sul
4322251	43	Tupandi
4322541	43	Vale Real
4304408	43	Canela
4309100	43	Gramado
4310108	43	Igrejinha
4310801	43	Ivoti
4311627	43	Lindolfo Collor
4312476	43	Morro Reuter
4315149	43	Presidente Lucena
4315750	43	Riozinho
4316006	43	Rolante
4316956	43	Santa Maria do Herval
4321204	43	Taquara
4301107	43	Arroio dos Ratos
4305355	43	Charqueadas
4322004	43	Triunfo
4322525	43	Vale Verde
4300604	43	Alvorada
4303103	43	Cachoeirinha
4303905	43	Campo Bom
4304606	43	Canoas
4306767	43	Eldorado do Sul
4307708	43	Esteio
4309050	43	Glorinha
4311981	43	Mariana Pimentel
4313060	43	Nova Hartz
4313375	43	Nova Santa Rita
4313409	43	Novo Hamburgo
4314902	43	Porto Alegre
4319901	43	Sapiranga
4320008	43	Sapucaia do Sul
4301057	43	Arroio do Sal
4304671	43	Capivari do Sul
4305454	43	Cidreira
4310652	43	Itati
4311734	43	Mampituba
4312443	43	Morrinhos do Sul
4312500	43	Mostardas
4313656	43	Palmares do Sul
4321352	43	Tavares
4321436	43	Terra de Areia
4321501	43	Torres
4301909	43	Barra do Ribeiro
4305173	43	Cerro Grande do Sul
4305447	43	Chuvisca
4306502	43	Dom Feliciano
4320354	43	Sentinela do Sul
4321105	43	Tapes
4300406	43	Alegrete
4308656	43	Garruchos
4310603	43	Itaqui
4311759	43	Manoel Viana
4322400	43	Uruguaiana
4316972	43	Santa Margarida do Sul
4317103	43	Santana do Livramento
4306601	43	Dom Pedrito
4309654	43	Hulha Negra
4311502	43	Lavras do Sul
4300638	43	Amaral Ferrador
4304358	43	Candiota
4306908	43	Encruzilhada do Sul
4314175	43	Pedras Altas
4314506	43	Pinheiro Machado
4314605	43	Piratini
4317004	43	Santana da Boa Vista
4301073	43	Arroio do Padre
4305124	43	Cerrito
4306056	43	Cristal
4300877	43	Ararica
4301602	43	Bage
4301875	43	Barra do Quarai
4302352	43	Bom Principio
4302709	43	Butia
4302808	43	Cacapava do Sul
4304507	43	Cangucu
4304713	43	Caraa
4306551	43	Dom Pedro de Alcantara
4307609	43	Estancia Velha
4308805	43	General Camara
4309209	43	Gravatai
4309308	43	Guaiba
4310330	43	Imbe
4311718	43	Macambara
4311775	43	Maquine
4311791	43	Marata
4312609	43	Mucum
4313201	43	Nova Petropolis
4313508	43	Osorio
4314027	43	Paraiso do Sul
4314050	43	Parobe
4314423	43	Picada Cafe
4314753	43	Poco das Antas
4315305	43	Quarai
4312450	43	Morro Redondo
4314407	43	Pelotas
4301305	43	Arroio Grande
4307104	43	Herval
4315602	43	Rio Grande
5006903	50	Porto Murtinho
5001102	50	Aquidauana
5005608	50	Miranda
5003306	50	Coxim
5006408	50	Pedro Gomes
5007406	50	Rio Verde de Mato Grosso
5007935	50	Sonora
5001508	50	Bandeirantes
5002704	50	Campo Grande
5003108	50	Corguinho
5004908	50	Jaraguari
5007307	50	Rio Negro
5007505	50	Rochedo
4303509	43	Camaqua
4304630	43	Capao da Canoa
4304663	43	Capao do Leao
4306403	43	Dois Irmaos
4311007	43	Jaguarao
4312252	43	Minas do Leao
4314803	43	Portao
4318002	43	Sao Borja
4318309	43	Sao Gabriel
4318408	43	Sao Jeronimo
4318481	43	Sao Jose do Hortencio
4318507	43	Sao Jose do Norte
4318614	43	Sao Jose do Sul
4318705	43	Sao Leopoldo
4318804	43	Sao Lourenco do Sul
4319356	43	Sao Pedro da Serra
4319505	43	Sao Sebastiao do Cai
4319752	43	Sao Vendelino
4320552	43	Sertao Santana
4323002	43	Viamao
5002605	50	Camapua
5003488	50	Dois Irmaos do Buriti
5003900	50	Figueirao
5007695	50	Sao Gabriel do Oeste
5008008	50	Terenos
4317301	43	Santa Vitoria do Palmar
4317608	43	Santo Antonio da Patrulha
4321600	43	Tramandai
4321667	43	Tres Cachoeiras
4321709	43	Tres Coroas
4321832	43	Tres Forquilhas
4322327	43	Turucu
5003207	50	Corumba
5005202	50	Ladario
5007901	50	Sidrolandia
5003256	50	Costa Rica
5001003	50	Aparecida do Taboado
5007109	50	Ribas do Rio Pardo
5007554	50	Santa Rita do Pardo
5001904	50	Bataguassu
5006200	50	Nova Andradina
5007976	50	Taquarussu
5002100	50	Bela Vista
5002159	50	Bodoquena
5002209	50	Bonito
5002803	50	Caracol
5004106	50	Guia Lopes da Laguna
5005004	50	Jardim
5005806	50	Nioaque
5001243	50	Aral Moreira
5003504	50	Douradina
5003702	50	Dourados
5005152	50	Juti
5005400	50	Maracaju
5006002	50	Nova Alvorada do Sul
5007208	50	Rio Brilhante
5008404	50	Vicentina
5003157	50	Coronel Sapucaia
5003751	50	Eldorado
5004304	50	Iguatemi
5004700	50	Ivinhema
5005681	50	Mundo Novo
5000203	50	Agua Clara
5000252	50	Alcinopolis
5000609	50	Amambai
5000807	50	Anaurilandia
5000856	50	Angelica
5006259	50	Novo Horizonte do Sul
5006358	50	Paranhos
5007703	50	Sete Quedas
5007950	50	Tacuru
5101902	51	Brasnorte
5102850	51	Castanheira
5103254	51	Colniza
5105176	51	Juruena
5100250	51	Alta Floresta
5102793	51	Carlinda
5106158	51	Nova Bandeirantes
5108956	51	Nova Monte Verde
5106265	51	Novo Mundo
5106422	51	Peixoto de Azevedo
5108055	51	Terra Nova do Norte
5108808	51	Nova Guarita
5102637	51	Campo Novo do Parecis
5103304	51	Comodoro
5103502	51	Diamantino
5107875	51	Sapezal
5105101	51	Juara
5106273	51	Novo Horizonte do Norte
5104526	51	Ipiranga do Norte
5105259	51	Lucas do Rio Verde
5105903	51	Nobres
5106224	51	Nova Mutum
5107768	51	Santa Rita do Trivelato
5107925	51	Sorriso
5108006	51	Tapurah
5103700	51	Feliz Natal
5106190	51	Nova Santa Helena
5107248	51	Santa Carmem
5107909	51	Sinop
5108501	51	Vera
5106307	51	Paranatinga
5106455	51	Planalto da Serra
5100359	51	Alto Boa Vista
5101852	51	Bom Jesus do Araguaia
5102694	51	Canabrava do Norte
5103353	51	Confresa
5106778	51	Porto Alegre do Norte
5107743	51	Santa Cruz do Xingu
5107776	51	Santa Terezinha
5107883	51	Serra Nova Dourada
5108600	51	Vila Rica
5102702	51	Canarana
5106257	51	Nova Xavantina
5101001	51	Araguaiana
5103106	51	Cocalinho
5106182	51	Nova Lacerda
5106752	51	Pontes e Lacerda
5101704	51	Barra do Bugres
5103452	51	Denise
5106851	51	Porto Estrela
5101258	51	Araputanga
5105002	51	Jauru
5103809	51	Figueiropolis D Oeste
5103957	51	Gloria D Oeste
5000906	50	Antonio Joao
5002001	50	Bataypora
5002951	50	Chapadao do Sul
5004502	50	Itapora
5004809	50	Japora
5005251	50	Laguna Carapa
5006606	50	Ponta Pora
5101407	51	Aripuana
5106216	51	Nova Canaa do Norte
5106240	51	Nova Ubirata
5106281	51	Novo Sao Joaquim
5107180	51	Ribeirao Cascalheira
5107305	51	Sao Jose do Rio Claro
5107354	51	Sao Jose do Xingu
5107859	51	Sao Felix do Araguaia
5107941	51	Tabapora
5108303	51	Uniao do Sul
5108352	51	Vale de Sao Domingos
5107206	51	Rio Branco
5100508	51	Alto Paraguai
5002407	50	Caarapo
5003454	50	Deodapolis
5003801	50	Fatima do Sul
5004007	50	Gloria de Dourados
5004403	50	Inocencia
5004601	50	Itaquirai
5005103	50	Jatei
5005707	50	Navirai
5006309	50	Paranaiba
5007802	50	Selviria
5008305	50	Tres Lagoas
5100805	51	Apiacas
5101803	51	Barra do Garcas
5102603	51	Campinapolis
5103056	51	Claudia
5103205	51	Colider
5103379	51	Cotriguacu
5103858	51	Gaucha do Norte
5104500	51	Indiavai
5104542	51	Itanhanga
5104559	51	Itauba
5105150	51	Juina
5105309	51	Luciara
5105507	51	Vila Bela da Santissima Trindade
5105580	51	Marcelandia
5105606	51	Matupa
5106174	51	Nova Nazare
5106208	51	Nova Brasilandia
5106232	51	Nova Olimpia
5106299	51	Paranaita
5106802	51	Porto dos Gauchos
5107065	51	Querencia
5107156	51	Reserva do Cabacal
5107578	51	Rondolandia
5107750	51	Salto do Ceu
5107792	51	Santo Antonio do Leste
5107958	51	Tangara da Serra
5108907	51	Nova Maringa
5107263	51	Santo Afonso
5100102	51	Acorizal
5104906	51	Jangada
5106109	51	Nossa Senhora do Livramento
5102678	51	Campo Verde
5107040	51	Primavera do Leste
5101209	51	Araguainha
5103908	51	General Carneiro
5104203	51	Guiratinga
5106653	51	Pontal do Araguaia
5106703	51	Ponte Branca
5108105	51	Tesouro
5103601	51	Dom Aquino
5104609	51	Itiquira
5104807	51	Jaciara
5105200	51	Juscimeira
5106372	51	Pedra Preta
5100300	51	Alto Araguaia
5100607	51	Alto Taquari
5214051	52	Mundo Novo
5100409	51	Alto Garcas
5215256	52	Novo Planalto
5221577	52	Uirapuru
5202155	52	Araguapaz
5207535	52	Faina
5212204	52	Jussara
5203104	52	Baliza
5207105	52	Diorama
5217203	52	Piranhas
5200555	52	Alto Horizonte
5200829	52	Amaralina
5204706	52	Campinorte
5204953	52	Campos Verdes
5207501	52	Estrela do Norte
5208103	52	Formoso
5212808	52	Mara Rosa
5213772	52	Montividiu do Norte
5218003	52	Porangatu
5221452	52	Trombas
5204904	52	Campos Belos
5205307	52	Cavalcante
5205521	52	Colinas do Sul
5214903	52	Nova Roma
5203203	52	Barro Alto
5205000	52	Carmo do Rio Verde
5205406	52	Ceres
5209457	52	Guarinos
5209804	52	Hidrolina
5210901	52	Itapaci
5211206	52	Itapuranga
5218607	52	Rialma
5218904	52	Rubiataba
5219357	52	Santa Isabel
5219456	52	Santa Rita do Novo Destino
5221700	52	Uruana
5203609	52	Brazabrantes
5210000	52	Inhumas
5210562	52	Itaguari
5210604	52	Itaguaru
5215009	52	Nova Veneza
5207600	52	Fazenda Nova
5212006	52	Jaupaci
5215207	52	Novo Brasil
5200852	52	Americano do Brasil
5201306	52	Anicuns
5105622	51	Mirassol d Oeste
5107701	51	Rosario Oeste
5107198	51	Ribeiraozinho
5103007	51	Chapada dos Guimaraes
5106828	51	Porto Esperidiao
5101605	51	Barao de Melgaco
5107297	51	Sao Jose do Povo
5107404	51	Sao Pedro da Cipa
5202502	52	Aruana
5211008	52	Itapirapua
5212956	52	Matrincha
5219902	52	Sao Francisco de Goias
5220009	52	Sao Joao d Alianca
5220157	52	Sao Luiz do Norte
5220207	52	Sao Miguel do Araguaia
5220280	52	Sao Patricio
5204557	52	Caldazinha
5102504	51	Caceres
5103403	51	Cuiaba
5103437	51	Curvelandia
5106000	51	Nortelandia
5106505	51	Pocone
5107008	51	Poxoreo
5107602	51	Rondonopolis
5107800	51	Santo Antonio do Leverger
5108204	51	Torixoreu
5108402	51	Varzea Grande
5108857	51	Nova Marilandia
5201603	52	Aracu
5201702	52	Aragarcas
5201801	52	Aragoiania
5202353	52	Arenopolis
5202601	52	Aurilandia
5202809	52	Avelinopolis
5203302	52	Bela Vista de Goias
5203401	52	Bom Jardim de Goias
5203559	52	Bonfinopolis
5203575	52	Bonopolis
5203807	52	Britania
5203939	52	Buriti de Goias
5204201	52	Cachoeira de Goias
5204656	52	Campinacu
5204854	52	Campo Limpo de Goias
5205208	52	Caturai
5205703	52	Corrego do Ouro
5206404	52	Crixas
5206800	52	Damolandia
5207808	52	Firminopolis
5208608	52	Goianesia
5208905	52	Goias
5209291	52	Guaraita
5209606	52	Heitorai
5210208	52	Ipora
5210307	52	Israelandia
5210406	52	Itaberai
5211404	52	Itaucu
5211602	52	Ivolandia
5211800	52	Jaragua
5212055	52	Jesipolis
5213087	52	Minacu
5213400	52	Moipora
5213509	52	Monte Alegre de Goias
5213707	52	Montes Claros de Goias
5213855	52	Morro Agudo de Goias
5213905	52	Mossamedes
5214002	52	Mozarlandia
5214101	52	Mutunopolis
5214408	52	Nazario
5214705	52	Nova America
5214838	52	Nova Crixas
5214861	52	Nova Gloria
5214879	52	Nova Iguacu de Goias
5215405	52	Ouro Verde de Goias
5216809	52	Petrolina de Goias
5216908	52	Pilar de Goias
5218706	52	Rianapolis
5219001	52	Sanclerlandia
5219100	52	Santa Barbara de Goias
5219258	52	Santa Fe de Goias
5219506	52	Santa Rosa de Goias
5219704	52	Santa Terezinha de Goias
5208806	52	Goianira
5220454	52	Senador Canedo
5221403	52	Trindade
5200803	52	Alvorada do Norte
5209903	52	Iaciara
5218300	52	Posse
5204003	52	Cabeceiras
5205497	52	Cidade Ocidental
5206206	52	Cristalina
5208004	52	Formosa
5200100	52	Abadiania
5200159	52	Adelandia
5200175	52	Agua Fria de Goias
5200258	52	Aguas Lindas de Goias
5200308	52	Alexania
5221601	52	Uruacu
5221502	52	Turvania
5221080	52	Teresina de Goias
5221007	52	Taquaral de Goias
5200605	52	Alto Paraiso de Goias
5220686	52	Simolandia
5220702	52	Sitio d Abadia
5200902	52	Amorinopolis
5201108	52	Anapolis
5215231	52	Novo Gama
5215603	52	Padre Bernardo
5217609	52	Planaltina
5222203	52	Vila Boa
5201454	52	Aparecida do Rio Doce
5213103	52	Mineiros
5213756	52	Montividiu
5218805	52	Rio Verde
5219407	52	Santa Rita do Araguaia
5205455	52	Cezarina
5207352	52	Edealina
5209952	52	Indiara
5211701	52	Jandaia
5203906	52	Buriti Alegre
5204250	52	Cachoeira Dourada
5204508	52	Caldas Novas
5209101	52	Goiatuba
5211503	52	Itumbiara
5212600	52	Mairipotaba
5213806	52	Morrinhos
5217104	52	Piracanjuba
5217708	52	Pontalina
5218391	52	Professor Jamil
5218789	52	Rio Quente
5215306	52	Orizona
5215801	52	Palmelo
5217401	52	Pires do Rio
5201207	52	Anhanguera
5206602	52	Cumari
5208509	52	Goiandira
5210109	52	Ipameri
5214804	52	Nova Aurora
5215504	52	Ouvidor
5204102	52	Cachoeira Alta
5212253	52	Lagoa Santa
5216304	52	Paranaiguara
1100015	11	Alta Floresta D Oeste
1100130	11	Machadinho D Oeste
1302900	13	Maues
1400506	14	Sao Joao da Baliza
1500206	15	Acara
1501956	15	Cachoeira do Piria
1507003	15	Santo Antonio do Taua
1600402	16	Mazagao
1703701	17	Brejinho de Nazare
1712504	17	Marianopolis do Tocantins
1720309	17	Sao Sebastiao do Tocantins
2100055	21	Acailandia
5200050	52	Abadia de Goias
3100203	31	Abaete
2900108	29	Abaira
2900207	29	Abare
4100103	41	Abatia
2300200	23	Acarau
2200053	22	Acaua
5205471	52	Chapadao do Ceu
5211305	52	Itaruma
5212907	52	Marzagao
5218052	52	Porteirao
5219803	52	Sao Domingos
5220058	52	Sao Joao da Parauna
5220264	52	Sao Miguel do Passa Quatro
5220405	52	Sao Simao
1504950	15	Nova Esperanca do Piria
4300034	43	Acegua
5200134	52	Acreuna
2400208	24	Acu
3100500	31	Acucena
4100202	41	Adrianopolis
3200102	32	Afonso Claudio
2600203	26	Afranio
2200103	22	Agricolandia
4200200	42	Agrolandia
5100201	51	Agua Boa
5203962	52	Buritinopolis
5204300	52	Cacu
5204409	52	Caiaponia
5204607	52	Campestre de Goias
5204805	52	Campo Alegre de Goias
5205059	52	Castelandia
5205513	52	Cocalzinho de Goias
5205802	52	Corumba de Goias
5205901	52	Corumbaiba
5206305	52	Cristianopolis
5206503	52	Crominia
5206701	52	Damianopolis
5206909	52	Davinopolis
5207253	52	Doverlandia
5207402	52	Edeia
5207907	52	Flores de Goias
5208152	52	Gameleira de Goias
5208400	52	Goianapolis
5208707	52	Goiania
5209150	52	Gouvelandia
5209200	52	Guapo
5209408	52	Guarani de Goias
5209705	52	Hidrolandia
5209937	52	Inaciolandia
5210802	52	Itaja
5211909	52	Jatai
5212105	52	Joviania
5212303	52	Leopoldo de Bulhoes
5212501	52	Luziania
5212709	52	Mambai
5213004	52	Maurilandia
5213053	52	Mimoso de Goias
5214507	52	Neropolis
5215652	52	Palestina de Goias
5215702	52	Palmeiras de Goias
5215900	52	Palminopolis
5216007	52	Panama
5216403	52	Parauna
5216452	52	Perolandia
5218102	52	Portelandia
5218508	52	Quirinopolis
5219209	52	Santa Cruz de Goias
5219308	52	Santa Helena de Goias
5219712	52	Santo Antonio da Barra
5219753	52	Santo Antonio do Descoberto
5220504	52	Serranopolis
5220603	52	Silvania
5222054	52	Vicentinopolis
5222302	52	Vila Propicio
5219738	52	Santo Antonio de Goias
1503077	15	Garrafao do Norte
1101492	11	Sao Francisco do Guapore
5300108	53	Brasilia
2700102	27	Agua Branca
2100154	21	Agua Doce do Maranhao
2107407	21	Olho d Agua das Cunhas
2500106	25	Agua Branca
2110278	21	Santo Amaro do Maranhao
2111250	21	Sao Jose dos Basilios
3500303	35	Aguai
5200209	52	Agua Limpa
4300059	43	Agua Santa
3100906	31	Aguas Formosas
2900801	29	Alcobaca
4100400	41	Almirante Tamandare
5200506	52	Aloandia
3101904	31	Alpinopolis
3501004	35	Altinopolis
3102050	31	Alto Caparao
4100509	41	Altonia
2205565	22	Lagoa do Barro do Piaui
2206670	22	Morro do Chapeu do Piaui
2202455	22	Capitao Gervasio Oliveira
3544509	35	Rubineia
3543808	35	Rinopolis
5222005	52	Vianopolis
5221908	52	Varjao
5221858	52	Valparaiso de Goias
5221809	52	Urutai
5221551	52	Turvelandia
5221304	52	Tres Ranchos
5221197	52	Terezopolis de Goias
2209658	22	Sao Francisco de Assis do Piaui
3501301	35	Alvares Machado
2901106	29	Amelia Rodrigues
2800100	28	Amparo de Sao Francisco
4101002	41	Ampere
5000708	50	Anastacio
2901700	29	Antonio Cardoso
2210805	22	Simplicio Mendes
2305605	23	Independencia
2311603	23	Redencao
2401859	24	Caicara do Norte
2408409	24	Olho-d Agua do Borges
2411700	24	Sao Bento do Trairi
2505238	25	Cuite de Mamanguape
2512036	25	Poco Dantas
2513943	25	Sao Domingos do Cariri
2514404	25	Sao Jose de Espinharas
2601052	26	Araucoiaba
2607604	26	Ilha de Itamaraca
2613305	26	Sao Joaquim do Monte
2702108	27	Colonia Leopoldina
2708501	27	Sao Luis do Quitunde
2806107	28	Rosario do Catete
2910305	29	Elisio Medrado
2910727	29	Eunapolis
2911253	29	Gaviao
2918357	29	Joao Dourado
2918456	29	Jucurucu
2919108	29	Lamarao
2919306	29	Lencois
2919405	29	Licinio de Almeida
2925709	29	Presidente Janio Quadros
2102556	21	Campestre do Maranhao
2103554	21	Conceicao do Lago-Acu
2109759	21	Santa Filomena do Maranhao
2111789	21	Serrano do Maranhao
2202091	22	Caldeirao Grande do Piaui
2312304	23	Sao Benedito
2508703	25	Mae d  Agua
2512762	25	Riachao do Poco
2601607	26	Belem de Sao Francisco
2929107	29	Sao Felipe
3105400	31	Barao de Cocais
3105509	31	Barao de Monte Alto
3109105	31	Bueno Brandao
3117108	31	Conceicao da Aparecida
3117306	31	Conceicao das Alagoas
3118809	31	Coracao de Jesus
3163904	31	Sao Pedro da Uniao
3164407	31	Sao Sebastiao da Bela Vista
3164506	31	Sao Sebastiao do Maranhao
3201704	32	Conceicao do Castelo
3204658	32	Sao Domingos do Norte
3204955	32	Sao Roque do Canaa
3505005	35	Barao de Antonina
3509700	35	Campos do Jordao
3513504	35	Cubatao
3516804	35	Gastao Vidigal
3516853	35	Gaviao Peixoto
4124400	41	Santo Antonio do Sudoeste
3532843	35	Nova Canaa Paulista
3545803	35	Santa Barbara d Oeste
4107157	41	Diamante D Oeste
4206702	42	Herval d Oeste
3543253	35	Ribeirao Grande
3543402	35	Ribeirao Preto
5103361	51	Conquista D Oeste
5105234	51	Lambari D Oeste
4104303	41	Campo Mourao
4104600	41	Capitao Leonidas Marques
4125100	41	Sao Joao do Triunfo
4204194	42	Chapadao do Lageado
4216057	42	Sao Cristovao do Sul
4301651	43	Barao
4301701	43	Barao de Cotegipe
4301750	43	Barao do Triunfo
4318051	43	Sao Domingos do Sul
4318101	43	Sao Francisco de Assis
4318200	43	Sao Francisco de Paula
5104104	51	Guaranta do Norte
5107107	51	Sao Jose dos Quatro Marcos
5205109	52	Catalao
5220108	52	Sao Luis de Montes Belos
1301159	13	Careiro da Varzea
2400901	24	Antonio Martins
2412005	24	Sao Goncalo do Amarante
2515104	25	Sao Sebastiao de Lagoa de Roca
2919553	29	Luis Eduardo Magalhaes
2933059	29	Varzea da Roca
3108206	31	Bonfinopolis de Minas
3114303	31	Carmo do Paranaiba
2506004	25	Esperanca
3119906	31	Corrego do Bom Jesus
3120003	31	Corrego Novo
3120151	31	Crisolita
3120300	31	Cristalia
3120805	31	Cruzilia
3121902	31	Divinesia
3122207	31	Divinolandia de Minas
3128907	31	Guimarania
3133758	31	Itau de Minas
3140209	31	Maripa de Minas
3144375	31	Natalandia
3145505	31	Olimpio Noronha
3155504	31	Rio Paranaiba
3157500	31	Santa Efigenia de Minas
3157609	31	Santa Fe de Minas
3171709	31	Virginia
3203106	32	Jeronimo Monteiro
3203320	32	Marataizes
3300308	33	Barra do Pirai
3304706	33	Santo Antonio de Padua
3502754	35	Aracariguama
3502804	35	Aracatuba
3503158	35	Arapei
3503604	35	Areiopolis
3515103	35	Embu-Guacu
3516705	35	Garca
3517208	35	Guaicara
3517505	35	Guapiacu
3520004	35	Igaracu do Tiete
4207007	42	Icara
3157302	31	Santa Barbara do Tugurio
3512407	35	Cordeiropolis
3515194	35	Espirito Santo do Turvo
3515509	35	Fernandopolis
3527504	35	Lucianopolis
3528700	35	Maraba Paulista
3532405	35	Nazare Paulista
3546256	35	Santa Cruz da Esperanca
3547304	35	Santana de Parnaiba
3554805	35	Tremembe
3554904	35	Tres Fronteiras
4101309	41	Antonio Olinto
4101853	41	Ariranha do Ivai
4110904	41	Itaguaje
4114351	41	Manfrinopolis
4115754	41	Maua da Serra
4126355	41	Serranopolis do Iguacu
4202057	42	Balneario Barra do Sul
4202859	42	Braco do Trombudo
4208906	42	Jaragua do Sul
4116505	41	Nova Alianca do Ivai
4300802	43	Antonio Prado
4300851	43	Arambare
4301552	43	Aurea
4301636	43	Balneario Pinhal
4302204	43	Boa Vista do Burica
4303707	43	Campina das Missoes
4305439	43	Chui
4311270	43	Lagoa dos Tres Cantos
4313003	43	Nova Brescia
4314209	43	Pedro Osorio
4316402	43	Rosario do Sul
4316428	43	Sagrada Familia
4320404	43	Serafina Correa
4321329	43	Taquarucu do Sul
4323804	43	Xangri-la
5002308	50	Brasilandia
5002902	50	Cassilandia
5101308	51	Arenapolis
5102686	51	Campos de Julio
5106315	51	Novo Santo Antonio
5201405	52	Aparecida de Goiania
5201504	52	Apore
5203500	52	Bom Jesus de Goias
5208301	52	Divinopolis de Goias
5210158	52	Ipiranga de Goias
5214606	52	Niquelandia
5217302	52	Pirenopolis
5219605	52	Santa Tereza de Goias
4321451	43	Teutonia
\.


--
-- TOC entry 2416 (class 0 OID 16523)
-- Dependencies: 221
-- Data for Name: nfe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_contas_pag_rec (codigo, descricao) FROM stdin;
3	AGUARDANDO PAGAMENTO
1	AGUARDANDO BOLETO
2	PAGA
\.


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 242
-- Name: status_contas_pag_rec_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_contas_pag_rec_codigo_seq', 4, true);


--
-- TOC entry 2438 (class 0 OID 16599)
-- Dependencies: 243
-- Data for Name: status_os; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_os (id, descricao) FROM stdin;
1	EM ABERTO
2	ENCERRADO
3	AGUARDANDO PAGAMENTO
4	PAG. CONFIRMADO E AGUARD. ENVIO
5	ENVIADO
\.


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 244
-- Name: status_os_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_os_id_seq', 5, true);


--
-- TOC entry 2440 (class 0 OID 16604)
-- Dependencies: 245
-- Data for Name: tipo_os; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_os (codigo, descricao, baixar_estoque, requer_assin) FROM stdin;
1	SOLICITACAO DE ORÇAMENTO	N	N
4	PROPOSTA COMERCIAL	N	S
2	PEDIDO DE COMPRA	N	N
5	ORÇAMENTO	S	S
6	ORDEM DE SERVIÇO	S	S
7	RELATORIO	S	S
8	PEDIDO	S	S
\.


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_os_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_os_codigo_seq', 9, true);


--
-- TOC entry 2442 (class 0 OID 16609)
-- Dependencies: 247
-- Data for Name: uf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY uf (iduf, sigla) FROM stdin;
11	RO
12	AC
13	AM
14	RR
15	PA
16	AP
17	TO
21	MA
22	PI
23	CE
24	RN
25	PB
26	PE
27	AL
28	SE
29	BA
31	MG
32	ES
33	RJ
35	SP
41	PR
42	SC
43	RS
50	MS
51	MT
52	GO
53	DF
0	EX
\.


--
-- TOC entry 2443 (class 0 OID 16612)
-- Dependencies: 248
-- Data for Name: unid_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unid_medida (codigo, sigla, descricao) FROM stdin;
1	HR  	HORA
2	PC  	PEÇA
3	KM  	KILOMETRO
4	MT  	METRO
5	UN  	UNIDADE
\.


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 249
-- Name: unid_medida_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unid_medida_codigo_seq', 6, true);


--
-- TOC entry 2221 (class 2606 OID 16882)
-- Name: lancamento_cte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_cte
    ADD CONSTRAINT lancamento_cte_pkey PRIMARY KEY (id);


--
-- TOC entry 2227 (class 2606 OID 16884)
-- Name: lancamento_notas_fiscais_itens_baixa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais_itens_baixa
    ADD CONSTRAINT lancamento_notas_fiscais_itens_baixa_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 16886)
-- Name: lancamento_notas_fiscais_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais_itens
    ADD CONSTRAINT lancamento_notas_fiscais_itens_pkey PRIMARY KEY (id);


--
-- TOC entry 2223 (class 2606 OID 16888)
-- Name: lancamento_notas_fiscais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lancamento_notas_fiscais
    ADD CONSTRAINT lancamento_notas_fiscais_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 16890)
-- Name: pk_idprodutosfornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_fornecedores
    ADD CONSTRAINT pk_idprodutosfornecedor PRIMARY KEY (id);


--
-- TOC entry 2201 (class 2606 OID 16894)
-- Name: pk_tboleto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY boleto
    ADD CONSTRAINT pk_tboleto PRIMARY KEY (id);


--
-- TOC entry 2203 (class 2606 OID 16896)
-- Name: pk_tcadastro_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cadastro
    ADD CONSTRAINT pk_tcadastro_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2207 (class 2606 OID 16898)
-- Name: pk_tcentro_custo_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY centro_custo
    ADD CONSTRAINT pk_tcentro_custo_codigo PRIMARY KEY (codigo_cc);


--
-- TOC entry 2209 (class 2606 OID 16900)
-- Name: pk_tcfop_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfop
    ADD CONSTRAINT pk_tcfop_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2211 (class 2606 OID 16902)
-- Name: pk_tconta_banco_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta_banco
    ADD CONSTRAINT pk_tconta_banco_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2213 (class 2606 OID 16904)
-- Name: pk_tcontas_pag_receb_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contas_pag_receb
    ADD CONSTRAINT pk_tcontas_pag_receb_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2215 (class 2606 OID 16906)
-- Name: pk_tempresa_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT pk_tempresa_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2217 (class 2606 OID 16914)
-- Name: pk_tforma_pag_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forma_pag
    ADD CONSTRAINT pk_tforma_pag_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2219 (class 2606 OID 16916)
-- Name: pk_tinstrucoes_os_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instrucoes_os
    ADD CONSTRAINT pk_tinstrucoes_os_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2229 (class 2606 OID 16918)
-- Name: pk_tmala_direta_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mala_direta
    ADD CONSTRAINT pk_tmala_direta_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2231 (class 2606 OID 16920)
-- Name: pk_tmaladireta_email_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mala_direta
    ADD CONSTRAINT pk_tmaladireta_email_unico UNIQUE (email);


--
-- TOC entry 2233 (class 2606 OID 16922)
-- Name: pk_tmunicipios_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT pk_tmunicipios_codigo PRIMARY KEY (id);


--
-- TOC entry 2235 (class 2606 OID 16926)
-- Name: pk_tnfe_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nfe
    ADD CONSTRAINT pk_tnfe_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2237 (class 2606 OID 16928)
-- Name: pk_tnfe_det_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nfe_det
    ADD CONSTRAINT pk_tnfe_det_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2239 (class 2606 OID 16930)
-- Name: pk_torigem_prod_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY origem_prod
    ADD CONSTRAINT pk_torigem_prod_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2241 (class 2606 OID 16932)
-- Name: pk_tos_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os
    ADD CONSTRAINT pk_tos_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2243 (class 2606 OID 16934)
-- Name: pk_tos_pecas_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_pecas
    ADD CONSTRAINT pk_tos_pecas_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2245 (class 2606 OID 16936)
-- Name: pk_tos_servicos_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_servicos
    ADD CONSTRAINT pk_tos_servicos_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2247 (class 2606 OID 16938)
-- Name: pk_tprazos_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prazos
    ADD CONSTRAINT pk_tprazos_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2249 (class 2606 OID 16940)
-- Name: pk_tprodutos_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT pk_tprodutos_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2251 (class 2606 OID 16942)
-- Name: pk_tprodutos_codprod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT pk_tprodutos_codprod UNIQUE (cod_prod);


--
-- TOC entry 2253 (class 2606 OID 16944)
-- Name: pk_tprodutoscomposicao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_composicao
    ADD CONSTRAINT pk_tprodutoscomposicao PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 16946)
-- Name: pk_tstatus_contas_pag_rec_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_contas_pag_rec
    ADD CONSTRAINT pk_tstatus_contas_pag_rec_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2259 (class 2606 OID 16948)
-- Name: pk_tstatus_os_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_os
    ADD CONSTRAINT pk_tstatus_os_id PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 16950)
-- Name: pk_ttipo_os_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_os
    ADD CONSTRAINT pk_ttipo_os_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2263 (class 2606 OID 16952)
-- Name: pk_tuf_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uf
    ADD CONSTRAINT pk_tuf_codigo PRIMARY KEY (iduf);


--
-- TOC entry 2265 (class 2606 OID 16954)
-- Name: pk_tunid_medida_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unid_medida
    ADD CONSTRAINT pk_tunid_medida_codigo PRIMARY KEY (codigo);


--
-- TOC entry 2205 (class 2606 OID 16956)
-- Name: pk_tuser; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cadastro_contatos
    ADD CONSTRAINT pk_tuser PRIMARY KEY (id);


--
-- TOC entry 2199 (class 1259 OID 16961)
-- Name: fki_pk_tboletro_contabancoid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_tboletro_contabancoid ON boleto USING btree (contabancoid);


--
-- TOC entry 2270 (class 2606 OID 16972)
-- Name: fk_idfornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_fornecedores
    ADD CONSTRAINT fk_idfornecedor FOREIGN KEY (id_cadastro) REFERENCES cadastro(codigo);


--
-- TOC entry 2271 (class 2606 OID 16977)
-- Name: fk_idproduto_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_fornecedores
    ADD CONSTRAINT fk_idproduto_ FOREIGN KEY (id_produto) REFERENCES produtos(codigo) ON UPDATE CASCADE;


--
-- TOC entry 2268 (class 2606 OID 16982)
-- Name: fk_itemidprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_composicao
    ADD CONSTRAINT fk_itemidprod FOREIGN KEY (id_itemproduto) REFERENCES produtos(codigo);


--
-- TOC entry 2269 (class 2606 OID 16992)
-- Name: fk_tprodutos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos_composicao
    ADD CONSTRAINT fk_tprodutos FOREIGN KEY (id_produto) REFERENCES produtos(codigo) ON UPDATE CASCADE;


--
-- TOC entry 2266 (class 2606 OID 16997)
-- Name: pk_tboletro_contabancoid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY boleto
    ADD CONSTRAINT pk_tboletro_contabancoid FOREIGN KEY (contabancoid) REFERENCES conta_banco(codigo);


--
-- TOC entry 2267 (class 2606 OID 17002)
-- Name: pktipoosid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os
    ADD CONSTRAINT pktipoosid FOREIGN KEY (tipo_id) REFERENCES tipo_os(codigo);


-- Completed on 2016-05-31 16:47:35 BRT

--
-- PostgreSQL database dump complete
--

