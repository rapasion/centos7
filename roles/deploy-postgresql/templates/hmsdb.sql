DROP TABLE IF EXISTS "hms_admin";
CREATE TABLE "public"."hms_admin" (
    "jid" character varying(50) NOT NULL,
    "departmentid" integer,
    "role" character varying(50),
    "hospitalid" integer NOT NULL,
    "department" text,
    CONSTRAINT "hms_admin_pkey" PRIMARY KEY ("jid")
) WITH (oids = false);

DROP TABLE IF EXISTS "hms_common_user_acct";
CREATE TABLE "public"."hms_common_user_acct" (
    "jid" character varying NOT NULL,
    "username" character varying NOT NULL,
    "hospitalid" integer,
    "date_created" timestamp DEFAULT now() NOT NULL,
    "status" smallint,
    CONSTRAINT "hms_common_user_acct_pkey" PRIMARY KEY ("jid")
) WITH (oids = false);

INSERT INTO "hms_common_user_acct" ("jid", "username", "hospitalid", "date_created", "status") VALUES
('{{ hospital }}admin@{{ hospital }}.com.sg',	'{{ hospital }}admin',	{{ hospital_id | default(1) }},	'now()',	1);

DROP TABLE IF EXISTS "hms_crr_count";
DROP SEQUENCE IF EXISTS hms_crr_count_id_seq;
CREATE SEQUENCE hms_crr_count_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."hms_crr_count" (
    "id" integer DEFAULT nextval('hms_crr_count_id_seq') NOT NULL,
    "hospital_id" integer,
    "data" text,
    "include_vip" integer DEFAULT '0',
    "created_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    "updated_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    CONSTRAINT "hms_crr_count_hospital_id_include_vip_key" UNIQUE ("hospital_id", "include_vip")
) WITH (oids = false);

INSERT INTO "hms_crr_count" ("id", "hospital_id", "data", "include_vip", "created_at", "updated_at") VALUES
(1,	{{ hospital_id | default(1) }},	'{"operator_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%''","operator_outstanding":43,"operator_mi":43,"operator_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and ( labrad_recipient LIKE ''%crroperator%'') and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","ward_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%''","ward_outstanding":43,"ward_mi":0,"ward_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and ( labrad_recipient LIKE ''%crrpward%'' OR  labrad_recipient LIKE ''%crrward%'') and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","lab_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' or (notifier_flag = 1 AND notifier_time IS NULL) and \\"lab_code\\" in (?, ?)","lab_outstanding":44,"lab_mi":43,"lab_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' or (notifier_flag = 1 AND notifier_time IS NULL) and \\"lab_code\\" in (?, ?) and labrad_recipient LIKE ''%crrlab%'' and ((recipient_group IN (''Manual'',''Laboratory'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","rad_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and \\"lab_code\\" in (?)","rad_outstanding":3,"rad_mi":3,"rad_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and \\"lab_code\\" in (?) and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","su_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL","su_outstanding":43,"su_mi":43,"su_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and ((recipient_group IN (''Manual'',''Laboratory'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","cid":"62334826bc634"}',	1,	'now()',	'now()'),
(2,	{{ hospital_id | default(1) }},	'{"operator_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%''","operator_outstanding":41,"operator_mi":41,"operator_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and ( labrad_recipient LIKE ''%crroperator%'') and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","ward_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%''","ward_outstanding":41,"ward_mi":0,"ward_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and ( labrad_recipient LIKE ''%crrpward%'' OR  labrad_recipient LIKE ''%crrward%'') and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","lab_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' or (notifier_flag = 1 AND notifier_time IS NULL) and \\"lab_code\\" in (?, ?)","lab_outstanding":42,"lab_mi":41,"lab_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' or (notifier_flag = 1 AND notifier_time IS NULL) and \\"lab_code\\" in (?, ?) and labrad_recipient LIKE ''%crrlab%'' and ((recipient_group IN (''Manual'',''Laboratory'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","rad_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and \\"lab_code\\" in (?)","rad_outstanding":3,"rad_mi":3,"rad_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and \\"vip_level\\" = ? and labrad_recipient IS NOT NULL and labrad_recipient LIKE ''%Manual%'' and \\"lab_code\\" in (?) and ((recipient_group IN (''Manual'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","su_mi0":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL","su_outstanding":41,"su_mi":41,"su_mi1":"select * from \\"hms_crr\\" where \\"hospital_id\\" = ? and \\"critical_flag\\" = ? and labrad_follow_up IS NULL and ((recipient_group IN (''Manual'',''Laboratory'') OR ((lab_code != ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''30 minutes'') OR (lab_code = ''HIS'' AND (CURRENT_TIMESTAMP - timestamp) > INTERVAL ''8 days''))))","cid":"6233068799633"}',	0,	'now()',	'now()');

DROP TABLE IF EXISTS "hms_department";
DROP SEQUENCE IF EXISTS hms_department_departmentid_seq;
CREATE SEQUENCE hms_department_departmentid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_department" (
    "departmentid" integer DEFAULT nextval('hms_department_departmentid_seq') NOT NULL,
    "departmentname" character varying(50) NOT NULL,
    "hospitalid" integer NOT NULL,
    "refresh_period" character varying(50),
    "department_code" character varying(10),
    "department_type" character(1) DEFAULT 'C' NOT NULL,
    "display_position" integer DEFAULT '100' NOT NULL,
    "lis_code" character varying(10),
    "display_status" integer DEFAULT '1' NOT NULL,
    "divisionid" integer,
    "status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "department_unique_key" UNIQUE ("hospitalid", "departmentname"),
    CONSTRAINT "hms_dept_pkey" PRIMARY KEY ("departmentid"),
    CONSTRAINT "hms_dept_unique_key" UNIQUE ("departmentname", "hospitalid")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_department"."department_type" IS 'A = Administrative; C = Clinical';

INSERT INTO "hms_department" ("departmentid", "departmentname", "hospitalid", "refresh_period", "department_code", "department_type", "display_position", "lis_code", "display_status", "divisionid", "status") VALUES
(182,	'Respiratory Therapy Services',	{{ hospital_id }},	NULL,	'DPRTS',	'X',	100,	NULL,	1,	NULL,	1),
(183,	'Linen Services',	{{ hospital_id }},	NULL,	'DPLIN',	'X',	100,	NULL,	1,	NULL,	1),
(184,	'Inpatient Hcas',	{{ hospital_id }},	NULL,	'DPHCA',	'X',	100,	NULL,	1,	NULL,	1),
(185,	'Av & Events Management',	{{ hospital_id }},	NULL,	'DPAVE',	'X',	100,	NULL,	1,	NULL,	1),
(187,	'Bed Management Unit',	{{ hospital_id }},	NULL,	'DPBMU',	'X',	100,	NULL,	1,	NULL,	1),
(188,	'Cardiovascular Centre',	{{ hospital_id }},	NULL,	'DPCARDC',	'X',	100,	NULL,	1,	NULL,	1),
(189,	'Rehab Services',	{{ hospital_id }},	NULL,	'DPREH',	'X',	100,	NULL,	1,	NULL,	1),
(190,	'Operation Admin',	{{ hospital_id }},	NULL,	'DPOPA',	'X',	100,	NULL,	1,	NULL,	1),
(191,	'Innovation & Research',	{{ hospital_id }},	NULL,	'DPINN',	'X',	100,	NULL,	1,	NULL,	1),
(193,	'Inpatient Services',	{{ hospital_id }},	NULL,	'DPIPS',	'X',	100,	NULL,	1,	NULL,	1),
(194,	'Corporate Communications',	{{ hospital_id }},	NULL,	'DPCOM',	'X',	100,	NULL,	1,	NULL,	1),
(195,	'Patient Feedback Unit',	{{ hospital_id }},	NULL,	'DPPFU',	'X',	100,	NULL,	1,	NULL,	1),
(196,	'Operations Admin/tenancy',	{{ hospital_id }},	NULL,	'DPOPT',	'X',	100,	NULL,	1,	NULL,	1),
(198,	'Quality And Risk Management',	{{ hospital_id }},	NULL,	'DPQRM',	'X',	100,	NULL,	1,	NULL,	1),
(199,	'Sponsored Student',	{{ hospital_id }},	NULL,	'DPSS',	'X',	100,	NULL,	1,	NULL,	1),
(200,	'Transport',	{{ hospital_id }},	NULL,	'DPTRN',	'X',	100,	NULL,	1,	NULL,	1),
(201,	'Facilities Development',	{{ hospital_id }},	NULL,	'DPFD',	'X',	100,	NULL,	1,	NULL,	1),
(455,	'Lobby',	{{ hospital_id }},	NULL,	'DPLOB',	'X',	100,	NULL,	1,	NULL,	1),
(202,	'Transitional Care',	{{ hospital_id }},	NULL,	'DPTC',	'X',	100,	NULL,	1,	NULL,	1),
(203,	'Mail Room',	{{ hospital_id }},	NULL,	'DPMLR',	'X',	100,	NULL,	1,	NULL,	1),
(239,	'Education Development Office',	{{ hospital_id }},	NULL,	'DPEDO',	'X',	100,	NULL,	1,	NULL,	1),
(240,	'Yishun Community Hospital',	{{ hospital_id }},	NULL,	'DVYCH',	'X',	100,	NULL,	1,	NULL,	1),
(311,	'Advance Care Planning',	{{ hospital_id }},	NULL,	'DPACP',	'X',	100,	NULL,	1,	NULL,	1),
(347,	'Population Health',	{{ hospital_id }},	NULL,	'DPPOPH',	'X',	100,	NULL,	1,	NULL,	1),
(382,	'Emergency Planning',	{{ hospital_id }},	NULL,	'DPEP',	'X',	100,	NULL,	1,	NULL,	1),
(524,	'Diabetes Centre C44',	{{ hospital_id }},	NULL,	'DCC44',	'H',	100,	'',	1,	NULL,	1),
(523,	'Agency for Integrated Care (AIC)',	{{ hospital_id }},	NULL,	'AINTC',	'H',	100,	'',	1,	NULL,	1),
(557,	'Dermatology',	{{ hospital_id }},	NULL,	'DPAHMED',	'X',	100,	NULL,	1,	NULL,	1),
(558,	'Subway Clinic',	{{ hospital_id }},	NULL,	'DPSUBC',	'X',	100,	NULL,	1,	NULL,	1),
(559,	'Woodlands Integrated Hospital Campus',	{{ hospital_id }},	NULL,	'DVWIHC',	'X',	100,	NULL,	1,	NULL,	1),
(560,	'Admiralty Medical Centre',	{{ hospital_id }},	NULL,	'DPAMC',	'X',	100,	NULL,	1,	NULL,	1),
(561,	'Surgery',	{{ hospital_id }},	NULL,	'DPAHGENSUR',	'X',	100,	NULL,	1,	NULL,	1),
(562,	'Healthcare Analytic Unit',	{{ hospital_id }},	NULL,	'HCAU',	'A',	100,	'',	1,	NULL,	1),
(563,	'Operations',	{{ hospital_id }},	NULL,	'OPRN',	'A',	100,	'',	1,	NULL,	1),
(564,	'Business Office',	{{ hospital_id }},	NULL,	'BUSO',	'A',	100,	'',	1,	NULL,	1),
(595,	'Geriatric Operations',	{{ hospital_id }},	NULL,	'GRTO',	'A',	100,	'',	1,	NULL,	1),
(596,	'Program Office',	{{ hospital_id }},	NULL,	'PGRO',	'A',	100,	'',	1,	NULL,	1),
(597,	'Healthcare Analytics Unit',	{{ hospital_id }},	NULL,	'HCAU',	'A',	100,	'',	1,	NULL,	1),
(598,	'Dental',	{{ hospital_id }},	NULL,	'DNTL',	'A',	100,	'',	1,	NULL,	1),
(634,	'Day Surgery Centre',	{{ hospital_id }},	NULL,	'DSC',	'A',	100,	'',	1,	NULL,	1),
(635,	'Gen Sur',	{{ hospital_id }},	NULL,	'GS',	'X',	100,	NULL,	1,	NULL,	1),
(636,	'Ahs Programme Office',	{{ hospital_id }},	NULL,	'DPAHSPROO',	'X',	100,	NULL,	1,	NULL,	1),
(637,	'Geriatric Education & Research Institute',	{{ hospital_id }},	NULL,	'GERI',	'A',	100,	'',	1,	NULL,	1),
(638,	'Geri',	{{ hospital_id }},	NULL,	'DPGERI',	'X',	100,	NULL,	1,	NULL,	1),
(639,	'Diabetes Centre',	{{ hospital_id }},	NULL,	'DBCT',	'A',	100,	'',	1,	NULL,	1),
(640,	'MRO',	{{ hospital_id }},	NULL,	'MRO',	'A',	100,	'',	1,	NULL,	1),
(641,	'Nursing Admin (Special Project)',	{{ hospital_id }},	NULL,	'NASP',	'A',	100,	'',	1,	NULL,	1),
(643,	'Nursing Admin Special Project',	{{ hospital_id }},	NULL,	'NADMSP',	'A',	100,	'',	1,	NULL,	1),
(644,	'Gericare@north',	{{ hospital_id }},	NULL,	'DPGERINT',	'X',	100,	NULL,	1,	NULL,	1),
(678,	'Ageing In Place',	{{ hospital_id }},	NULL,	'DPAIP',	'C',	100,	'',	1,	NULL,	1),
(680,	'Nursing Admin (Sponsored Student)',	{{ hospital_id }},	NULL,	'NASS',	'A',	100,	'',	1,	NULL,	1),
(681,	'Quality Service Management',	{{ hospital_id }},	NULL,	'QSM',	'A',	100,	'',	1,	NULL,	1),
(682,	'Dental Clinic',	{{ hospital_id }},	NULL,	'DEC',	'C',	1000,	'',	1,	NULL,	1),
(683,	'Infecton Control',	{{ hospital_id }},	NULL,	'INC',	'C',	100,	'',	1,	NULL,	1),
(717,	'Woodlands Integrated Healthcare Campus',	{{ hospital_id }},	NULL,	'WIHC',	'C',	100,	'',	1,	NULL,	1),
(718,	'Soc - Genreral Surgery',	{{ hospital_id }},	NULL,	'SGS',	'C',	100,	'',	1,	NULL,	1),
(719,	'Soc - General Surgery',	{{ hospital_id }},	NULL,	'SGS',	'C',	100,	'',	1,	NULL,	1),
(752,	'CIO Offices-AHS CIO Office',	{{ hospital_id }},	NULL,	'OAHSO',	'A',	100,	'',	1,	NULL,	1),
(785,	'Ageing In Place (nur)',	{{ hospital_id }},	NULL,	'AIPN',	'C',	100,	'',	1,	NULL,	1),
(786,	'Icu B36',	{{ hospital_id }},	NULL,	'ICUB',	'C',	100,	'',	1,	NULL,	1),
(787,	'Nursing Admin',	{{ hospital_id }},	NULL,	'NUAD',	'C',	100,	'',	1,	NULL,	1),
(788,	'Icu B26',	{{ hospital_id }},	NULL,	'IB26',	'C',	100,	'',	1,	NULL,	1),
(789,	'Landscape',	{{ hospital_id }},	NULL,	'LASC',	'C',	100,	'',	1,	NULL,	1),
(790,	'Singapore Christian Home',	{{ hospital_id }},	NULL,	'SCH',	'A',	100,	'',	1,	NULL,	1),
(791,	'General Surgery Clinic C31',	{{ hospital_id }},	NULL,	'GSCL',	'C',	100,	'',	1,	NULL,	1),
(792,	'Programme Office',	{{ hospital_id }},	NULL,	'POF',	'A',	100,	'',	1,	NULL,	1),
(793,	'Cardiovasular Centre',	{{ hospital_id }},	NULL,	'CAC',	'C',	100,	'',	1,	NULL,	1),
(794,	'Health For Life Centre',	{{ hospital_id }},	NULL,	'DPAHENTC',	'X',	100,	NULL,	1,	NULL,	1),
(795,	'Ward B76',	{{ hospital_id }},	NULL,	'DPAHB76',	'X',	100,	NULL,	1,	NULL,	1),
(796,	'Bmu',	{{ hospital_id }},	NULL,	'DPAHANE',	'X',	100,	NULL,	1,	NULL,	1),
(797,	'Icu 1',	{{ hospital_id }},	NULL,	'DPAHICU1',	'X',	100,	NULL,	1,	NULL,	1),
(798,	'General Surgery Clinic',	{{ hospital_id }},	NULL,	'DPAHGSURC',	'X',	100,	NULL,	1,	NULL,	1),
(799,	'Ward B85',	{{ hospital_id }},	NULL,	'DPAHB85',	'X',	100,	NULL,	1,	NULL,	1),
(800,	'Isolation Ward',	{{ hospital_id }},	NULL,	'DPAHISOWD',	'X',	100,	NULL,	1,	NULL,	1),
(801,	'Material Management',	{{ hospital_id }},	NULL,	'DPAHMMGT',	'X',	100,	NULL,	1,	NULL,	1),
(802,	'Ward B56',	{{ hospital_id }},	NULL,	'DPAHB56',	'X',	100,	NULL,	1,	NULL,	1),
(803,	'Operational Support',	{{ hospital_id }},	NULL,	'DPAHOPSSUP',	'X',	100,	NULL,	1,	NULL,	1),
(804,	'Ward B75',	{{ hospital_id }},	NULL,	'DPAHB75',	'X',	100,	NULL,	1,	NULL,	1),
(805,	'Ward B55',	{{ hospital_id }},	NULL,	'DPAHB55',	'X',	100,	NULL,	1,	NULL,	1),
(806,	'Icu 2',	{{ hospital_id }},	NULL,	'DPAHICU2',	'X',	100,	NULL,	1,	NULL,	1),
(807,	'Geriatric Outpatient Clinic',	{{ hospital_id }},	NULL,	'DPAHGEROC',	'X',	100,	NULL,	1,	NULL,	1),
(124,	'Quality Assurance',	{{ hospital_id }},	NULL,	'QAE',	'A',	100,	NULL,	1,	NULL,	1),
(6,	'IST',	{{ hospital_id }},	NULL,	'DPAIST',	'A',	100,	'',	1,	NULL,	1),
(7,	'Clinical Services',	{{ hospital_id }},	NULL,	'DPCSD',	'C',	100,	'',	1,	NULL,	1),
(8,	'Laboratory Medicine',	{{ hospital_id }},	NULL,	'DPLAB',	'C',	100,	'',	1,	NULL,	1),
(27,	'Diagnostic Radiology',	{{ hospital_id }},	NULL,	'DPDDR',	'C',	100,	'',	1,	NULL,	1),
(55,	'Medical Social Service',	{{ hospital_id }},	NULL,	'DPMSS',	'H',	100,	'',	1,	NULL,	1),
(56,	'Nursing Administration',	{{ hospital_id }},	NULL,	'DPNM',	'H',	100,	'',	1,	NULL,	1),
(57,	'Nutrition & Dietetics',	{{ hospital_id }},	NULL,	'DPNUT',	'H',	100,	'',	1,	NULL,	1),
(64,	'Pharmacy',	{{ hospital_id }},	NULL,	'DPPHA',	'H',	100,	'',	1,	NULL,	1),
(9,	'Customer Contact Centre',	{{ hospital_id }},	NULL,	'DPCCC',	'H',	100,	'',	1,	NULL,	1),
(13,	'Biomedical Engineering',	{{ hospital_id }},	NULL,	'DPBIO',	'H',	100,	'',	1,	NULL,	1),
(14,	'Business Development',	{{ hospital_id }},	NULL,	'DPBDU',	'A',	100,	'',	1,	NULL,	1),
(16,	'Case Management',	{{ hospital_id }},	NULL,	'DPCM',	'A',	100,	'',	1,	NULL,	1),
(17,	'Casemix Office',	{{ hospital_id }},	NULL,	'DPCSM',	'A',	100,	'',	1,	NULL,	1),
(18,	'Clinical Research Unit',	{{ hospital_id }},	NULL,	'DPCRU',	'H',	100,	'',	1,	NULL,	1),
(20,	'CSSU',	{{ hospital_id }},	NULL,	'DPCSS',	'H',	100,	'',	1,	NULL,	1),
(31,	'Environmental Services',	{{ hospital_id }},	NULL,	'DPESA',	'A',	100,	'',	1,	NULL,	1),
(34,	'Facilities Management',	{{ hospital_id }},	NULL,	'DPFAC',	'A',	100,	'',	1,	NULL,	1),
(36,	'Finance',	{{ hospital_id }},	NULL,	'DPFIN',	'A',	100,	'',	1,	NULL,	1),
(42,	'Hospital Administration',	{{ hospital_id }},	NULL,	'DPADM',	'A',	100,	'',	1,	NULL,	1),
(43,	'Hospital Planning',	{{ hospital_id }},	NULL,	'DPHP',	'A',	100,	'',	1,	NULL,	1),
(44,	'Human Resource',	{{ hospital_id }},	NULL,	'DPHHR',	'A',	100,	'',	1,	NULL,	1),
(47,	'Infection Control',	{{ hospital_id }},	NULL,	'DPIC',	'H',	100,	'',	1,	NULL,	1),
(51,	'Kitchen',	{{ hospital_id }},	NULL,	'DPKTC',	'A',	100,	'',	1,	NULL,	1),
(54,	'Medical Records Office',	{{ hospital_id }},	NULL,	'DPMRO',	'H',	100,	'',	1,	NULL,	1),
(94,	'TTSH',	{{ hospital_id }},	NULL,	'TTSH',	'C',	100,	'',	1,	NULL,	1),
(63,	'Patient Service Centre',	{{ hospital_id }},	NULL,	'DPPSC',	'H',	100,	'',	1,	NULL,	1),
(69,	'Renal Centre',	{{ hospital_id }},	NULL,	'DPRC',	'H',	100,	'',	1,	NULL,	1),
(71,	'Security',	{{ hospital_id }},	NULL,	'DPSEC',	'A',	100,	'',	1,	NULL,	1),
(99,	'Aging In Place',	{{ hospital_id }},	NULL,	'DPAIP',	'X',	100,	NULL,	1,	NULL,	1),
(4,	'Geriatric Medicine',	{{ hospital_id }},	NULL,	'DPGRM',	'C',	100,	'',	1,	NULL,	1),
(1,	'KTPH Support',	{{ hospital_id }},	NULL,	'KTPHSUP',	'H',	100,	'',	1,	NULL,	1),
(5,	'Cardiology',	{{ hospital_id }},	NULL,	'DPCARDIO',	'C',	100,	'KSCARDIA',	1,	NULL,	1),
(10,	'Acute and Emergency Care',	{{ hospital_id }},	NULL,	'DPANE',	'C',	100,	'KSA&E',	1,	NULL,	1),
(11,	'Anaesthesia',	{{ hospital_id }},	NULL,	'DPANAES',	'C',	100,	'KSANAE',	1,	NULL,	1),
(24,	'Dental Surgery',	{{ hospital_id }},	NULL,	'DPDENTAL',	'C',	100,	'KSDENTAL',	1,	NULL,	1),
(29,	'ENT',	{{ hospital_id }},	NULL,	'DPENT',	'C',	100,	'KSENT',	1,	NULL,	1),
(852,	'Office Of Clinical Informatics',	{{ hospital_id }},	NULL,	'DPOCI',	'X',	100,	NULL,	1,	NULL,	1),
(60,	'Orthopaedic Surgery',	{{ hospital_id }},	NULL,	'DPORTHO',	'C',	100,	'',	1,	NULL,	1),
(65,	'Psychological Medicine',	{{ hospital_id }},	NULL,	'DPPSY',	'C',	100,	'',	1,	NULL,	1),
(97,	'Urology',	{{ hospital_id }},	NULL,	'DPURO',	'C',	100,	'',	1,	NULL,	1),
(2,	'General Medicine',	{{ hospital_id }},	NULL,	'DPGENMED',	'C',	100,	'',	1,	NULL,	1),
(3,	'General Surgery',	{{ hospital_id }},	NULL,	'DPGSUR',	'C',	100,	'',	1,	NULL,	1),
(40,	'Family and Community Medicine',	{{ hospital_id }},	NULL,	'DPFCM',	'C',	100,	'',	1,	NULL,	1),
(93,	'Others',	{{ hospital_id }},	NULL,	NULL,	'C',	100,	NULL,	1,	NULL,	1),
(488,	'Woodlands Medical Centre',	{{ hospital_id }},	NULL,	'DPWMC',	'X',	100,	NULL,	1,	NULL,	1),
(489,	'Sports Medicine Centre',	{{ hospital_id }},	NULL,	'DPAHORTHOS',	'X',	100,	NULL,	1,	NULL,	1),
(490,	'Ward B95',	{{ hospital_id }},	NULL,	'DPAHB95',	'X',	100,	NULL,	1,	NULL,	1),
(491,	'Dermatology Clinic',	{{ hospital_id }},	NULL,	'DPAHDERMC',	'X',	100,	NULL,	1,	NULL,	1),
(492,	'Endoscopy Centre',	{{ hospital_id }},	NULL,	'DPAHENDOC',	'X',	100,	NULL,	1,	NULL,	1),
(493,	'Ward B86',	{{ hospital_id }},	NULL,	'DPAHB86',	'X',	100,	NULL,	1,	NULL,	1),
(494,	'Eye Clinic',	{{ hospital_id }},	NULL,	'DPAHEYEC',	'X',	100,	NULL,	1,	NULL,	1),
(495,	'Women Clinic',	{{ hospital_id }},	NULL,	'DPAHWOMENC',	'X',	100,	NULL,	1,	NULL,	1),
(496,	'General Medicine Clinic',	{{ hospital_id }},	NULL,	'DPAHGMEDC',	'X',	100,	NULL,	1,	NULL,	1),
(497,	'Major Operating Theatre',	{{ hospital_id }},	NULL,	'DPAHMOT',	'X',	100,	NULL,	1,	NULL,	1),
(498,	'Rehabilitation Services',	{{ hospital_id }},	NULL,	'DPAHREHAB',	'X',	100,	NULL,	1,	NULL,	1),
(175,	'Inpatient Wards',	{{ hospital_id }},	NULL,	'DPIP',	'X',	100,	NULL,	1,	NULL,	1),
(177,	'Specialist Outpatient Clinic',	{{ hospital_id }},	NULL,	'DPSOC',	'X',	100,	NULL,	1,	NULL,	1),
(186,	'Laboratory Medicine (Drs)',	{{ hospital_id }},	NULL,	'DPLABM',	'X',	100,	NULL,	1,	NULL,	1),
(102,	'Home Care Service',	{{ hospital_id }},	NULL,	'DPHCS',	'X',	100,	NULL,	1,	NULL,	1),
(103,	'Residency Program Office',	{{ hospital_id }},	NULL,	'DPRPO',	'X',	100,	NULL,	1,	NULL,	1),
(142,	'Aging In Place (nur)',	{{ hospital_id }},	NULL,	'DPADIP',	'X',	100,	NULL,	1,	NULL,	1),
(176,	'Peri-ops',	{{ hospital_id }},	NULL,	'DPPO',	'X',	100,	NULL,	1,	NULL,	1),
(178,	'Materials Management',	{{ hospital_id }},	NULL,	'DPMMD',	'X',	100,	NULL,	1,	NULL,	1),
(179,	'Operations Support',	{{ hospital_id }},	NULL,	'DPOPS',	'X',	100,	NULL,	1,	NULL,	1),
(180,	'Portering',	{{ hospital_id }},	NULL,	'DPPOR',	'X',	100,	NULL,	1,	NULL,	1),
(808,	'Orthopaedic Surgery Clinic',	{{ hospital_id }},	NULL,	'DPAHORTHSC',	'X',	100,	NULL,	1,	NULL,	1),
(809,	'Ward B66',	{{ hospital_id }},	NULL,	'DPAHB66',	'X',	100,	NULL,	1,	NULL,	1),
(810,	'Respiratory Medicine Clinic',	{{ hospital_id }},	NULL,	'DPAHRESPMC',	'X',	100,	NULL,	1,	NULL,	1),
(811,	'Case Mix',	{{ hospital_id }},	NULL,	'DPAHCASEMT',	'X',	100,	NULL,	1,	NULL,	1),
(812,	'Ward A62',	{{ hospital_id }},	NULL,	'DPAHA62',	'X',	100,	NULL,	1,	NULL,	1),
(813,	'Ward B96',	{{ hospital_id }},	NULL,	'DPAHA61',	'X',	100,	NULL,	1,	NULL,	1),
(814,	'Ward B65',	{{ hospital_id }},	NULL,	'DPAHB65',	'X',	100,	NULL,	1,	NULL,	1),
(815,	'Ward B105',	{{ hospital_id }},	NULL,	'DPAHB105',	'X',	100,	NULL,	1,	NULL,	1),
(816,	'Ward A52',	{{ hospital_id }},	NULL,	'DPAHA55',	'X',	100,	NULL,	1,	NULL,	1),
(817,	'Children Clinic',	{{ hospital_id }},	NULL,	'DPAHCHILDC',	'X',	100,	NULL,	1,	NULL,	1),
(818,	'Union Office',	{{ hospital_id }},	NULL,	'DPAHUNI',	'X',	100,	NULL,	1,	NULL,	1),
(819,	'General Medicine/ Clinic C51',	{{ hospital_id }},	NULL,	'GMC51',	'C',	100,	'',	1,	NULL,	1),
(679,	'Psychology Service',	{{ hospital_id }},	NULL,	'DPPSYC',	'C',	100,	'',	1,	NULL,	1),
(821,	'Clinical Services Planning',	{{ hospital_id }},	NULL,	'DPWCSP',	'X',	100,	NULL,	1,	NULL,	1),
(822,	'Operations Planning',	{{ hospital_id }},	NULL,	'DPWOPP',	'X',	100,	NULL,	1,	NULL,	1),
(823,	'Operations Admin',	{{ hospital_id }},	NULL,	'DPYOPA',	'X',	100,	NULL,	1,	NULL,	1),
(824,	'Analytics',	{{ hospital_id }},	NULL,	'DPWAN',	'X',	100,	NULL,	1,	NULL,	1),
(825,	'Nursing Services',	{{ hospital_id }},	NULL,	'DPWNURS',	'X',	100,	NULL,	1,	NULL,	1),
(826,	'Corporate Development',	{{ hospital_id }},	NULL,	'DPWCDV',	'X',	100,	NULL,	1,	NULL,	1),
(827,	'Clinical Operations',	{{ hospital_id }},	NULL,	'DPWCOP',	'X',	100,	NULL,	1,	NULL,	1),
(828,	'Hospital Admin',	{{ hospital_id }},	NULL,	'DPWHAD',	'X',	100,	NULL,	1,	NULL,	1),
(829,	'Event Management',	{{ hospital_id }},	NULL,	'DPYEVMGT',	'X',	100,	NULL,	1,	NULL,	1),
(830,	'Communications & Engagement',	{{ hospital_id }},	NULL,	'DPWCE',	'X',	100,	NULL,	1,	NULL,	1),
(831,	'Referral And Admission Unit',	{{ hospital_id }},	NULL,	'DPYRAU',	'X',	100,	NULL,	1,	NULL,	1),
(832,	'Woodlands Integrated Health Campus',	{{ hospital_id }},	NULL,	'WLIHC',	'C',	100,	'',	1,	NULL,	1),
(834,	'Medical Services',	{{ hospital_id }},	NULL,	'DPYSEC',	'X',	100,	NULL,	1,	NULL,	1),
(835,	'Corporate Services',	{{ hospital_id }},	NULL,	'DPWCS',	'X',	100,	NULL,	1,	NULL,	1),
(836,	'Ist Department',	{{ hospital_id }},	NULL,	'ISTD',	'A',	100,	'',	1,	NULL,	1),
(837,	'Community Referral Team (crt)',	{{ hospital_id }},	NULL,	'COMRT',	'A',	100,	'',	1,	NULL,	1),
(838,	'Allied Health Services',	{{ hospital_id }},	NULL,	'DVWAHS',	'X',	100,	NULL,	1,	NULL,	1),
(839,	'Office Admin',	{{ hospital_id }},	NULL,	'DPWOA',	'X',	100,	NULL,	1,	NULL,	1),
(840,	'Organisation Development',	{{ hospital_id }},	NULL,	'DPWOD',	'X',	100,	NULL,	1,	NULL,	1),
(841,	'Ent Clinic',	{{ hospital_id }},	NULL,	'ENTC',	'C',	100,	'',	1,	NULL,	1),
(842,	'Hms Vendor',	{{ hospital_id }},	NULL,	'HMSV',	'A',	100,	'',	1,	NULL,	1),
(843,	'Nursing Services Manpower',	{{ hospital_id }},	NULL,	'DPWNUR',	'X',	100,	NULL,	1,	NULL,	1),
(600,	'Ophthalmology & Visual Sciences',	{{ hospital_id }},	NULL,	'OVS',	'A',	100,	'',	1,	NULL,	1),
(599,	'Opthalmology And Visual Sciences',	{{ hospital_id }},	NULL,	'WIHCD',	'A',	100,	'',	1,	NULL,	1),
(846,	'Sports Medicine',	{{ hospital_id }},	NULL,	'SPM',	'C',	100,	'',	1,	NULL,	1),
(847,	'Clinical Service Planning',	{{ hospital_id }},	NULL,	'DPWHR',	'X',	100,	NULL,	1,	NULL,	1),
(848,	'Information System Technology',	{{ hospital_id }},	NULL,	'INST',	'A',	100,	'',	1,	NULL,	1),
(32,	'Ophthalmology And Visual Sciences',	{{ hospital_id }},	NULL,	'DPOVS',	'C',	100,	'KSEYE',	1,	NULL,	1),
(849,	'Food Services',	{{ hospital_id }},	NULL,	'DPYKIT',	'X',	100,	NULL,	1,	NULL,	1),
(850,	'Soc Services',	{{ hospital_id }},	NULL,	'DPSOCSEV',	'X',	100,	NULL,	1,	NULL,	1),
(851,	'Eye',	{{ hospital_id }},	NULL,	'DPAHEYE',	'X',	100,	NULL,	1,	NULL,	1),
(853,	'Aip-cct',	{{ hospital_id }},	NULL,	'DPAIPCCT',	'X',	100,	NULL,	1,	NULL,	1),
(854,	'Podiatry',	{{ hospital_id }},	NULL,	'DPPOD',	'X',	100,	NULL,	1,	NULL,	1),
(855,	'Pre Operations',	{{ hospital_id }},	NULL,	'DVWPOPS',	'X',	100,	NULL,	1,	NULL,	1),
(856,	'Community Care Transformation',	{{ hospital_id }},	NULL,	'DPWCCT',	'X',	100,	NULL,	1,	NULL,	1),
(857,	'Transformation Office',	{{ hospital_id }},	NULL,	'DPWTO',	'X',	100,	NULL,	1,	NULL,	1),
(858,	'Patient Billing Services',	{{ hospital_id }},	NULL,	'DPWBO',	'X',	100,	NULL,	1,	NULL,	1),
(859,	'Manpower - Medical',	{{ hospital_id }},	NULL,	'DVWMS',	'X',	100,	NULL,	1,	NULL,	1),
(860,	'Infra Dev & Fac Engineering',	{{ hospital_id }},	NULL,	'DPWIDFE',	'X',	100,	NULL,	1,	NULL,	1),
(861,	'Campus Planning',	{{ hospital_id }},	NULL,	'DPWCP',	'X',	100,	NULL,	1,	NULL,	1),
(862,	'Knowledge & Innovation',	{{ hospital_id }},	NULL,	'DPWDOKI',	'X',	100,	NULL,	1,	NULL,	1),
(863,	'Pre Hospital',	{{ hospital_id }},	NULL,	'DPWPREH',	'X',	100,	NULL,	1,	NULL,	1),
(864,	'Ambulatory & Soc Operations',	{{ hospital_id }},	NULL,	'DPWASOC',	'X',	100,	NULL,	1,	NULL,	1),
(865,	'Medicine & Community',	{{ hospital_id }},	NULL,	'DPWMED',	'X',	100,	NULL,	1,	NULL,	1),
(866,	'Informatics',	{{ hospital_id }},	NULL,	'DPWINF',	'X',	100,	NULL,	1,	NULL,	1),
(867,	'Inpatient Operations',	{{ hospital_id }},	NULL,	'DPWINPO',	'X',	100,	NULL,	1,	NULL,	1),
(868,	'Infrastructure & Engineering',	{{ hospital_id }},	NULL,	'DPWIDIFE',	'X',	100,	NULL,	1,	NULL,	1),
(869,	'Allied Health Manpower',	{{ hospital_id }},	NULL,	'DPWAH',	'X',	100,	NULL,	1,	NULL,	1),
(870,	'Ambulatory',	{{ hospital_id }},	NULL,	'KDAMB',	'H',	100,	NULL,	1,	NULL,	1),
(878,	'Community Nursing',	{{ hospital_id }},	NULL,	'DPYNURADM',	'X',	100,	NULL,	1,	NULL,	1),
(875,	'External Patient',	{{ hospital_id }},	NULL,	'DPEXTPAT',	'C',	100,	NULL,	1,	NULL,	1),
(874,	'Paediatrics',	{{ hospital_id }},	NULL,	'DPPAE',	'C',	100,	NULL,	1,	NULL,	1),
(873,	'Radiation Oncology',	{{ hospital_id }},	NULL,	'DPONR',	'C',	100,	NULL,	1,	NULL,	1),
(872,	'Medical Oncology',	{{ hospital_id }},	NULL,	'DPONM',	'C',	100,	NULL,	1,	NULL,	1),
(871,	'Obstetrics & Gynaecology',	{{ hospital_id }},	NULL,	'DPO&G',	'C',	100,	NULL,	1,	NULL,	1),
(601,	'Acute & Emergency',	{{ hospital_id }},	NULL,	'AEMRCY',	'A',	100,	NULL,	1,	NULL,	1);

DROP TABLE IF EXISTS "hms_sub_department";
DROP SEQUENCE IF EXISTS hms_sub_department_subdeptid_seq;
CREATE SEQUENCE hms_sub_department_subdeptid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_sub_department" (
    "subdeptid" integer DEFAULT nextval('hms_sub_department_subdeptid_seq') NOT NULL,
    "subdeptcode" character varying(10),
    "subdeptname" character varying NOT NULL,
    "hospitalid" integer NOT NULL,
    "departmentid" integer,
    "lis_code" character varying(10),
    "display_position" integer DEFAULT '100' NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "hms_sub_department_pkey" PRIMARY KEY ("subdeptid"),
    CONSTRAINT "hms_sub_dept_unique_key" UNIQUE ("subdeptname", "departmentid")
) WITH (oids = false);

INSERT INTO "hms_sub_department" ("subdeptid", "subdeptcode", "subdeptname", "hospitalid", "departmentid", "lis_code", "display_position", "status") VALUES
(2,	'DPACP',	'Advance Care Planning',	{{ hospital_id }},	1,	NULL,	100,	1),
(3,	'DPAIP',	'Aging In Place',	{{ hospital_id }},	1,	NULL,	100,	1),
(4,	'DPADIP',	'Aging In Place (NUR)',	{{ hospital_id }},	1,	NULL,	100,	1),
(5,	'DPANAES',	'Anaesthesia',	{{ hospital_id }},	1,	NULL,	100,	1),
(6,	'DPAVE',	'AV & Events Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(7,	'DPBMU',	'Bed Management Unit',	{{ hospital_id }},	1,	NULL,	100,	1),
(8,	'DPBIO',	'Biomedical Engineering',	{{ hospital_id }},	1,	NULL,	100,	1),
(9,	'DPBDU',	'Business Development',	{{ hospital_id }},	1,	NULL,	100,	1),
(10,	'SCFBO',	'Business Office',	{{ hospital_id }},	1,	NULL,	100,	1),
(11,	'SCCARC',	'Cardiac Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(12,	'DPCARDIO',	'Cardiology',	{{ hospital_id }},	1,	NULL,	100,	1),
(13,	'DPCARDC',	'Cardiovascular Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(14,	'DPCM',	'Case Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(15,	'DPCSM',	'Casemix Office',	{{ hospital_id }},	1,	NULL,	100,	1),
(16,	'DPCRU',	'Clinical Research Unit',	{{ hospital_id }},	1,	NULL,	100,	1),
(17},	'DPCSD',	'Clinical Services',	{{ hospital_id }},	1,	NULL,	100,	1),
(18,	'SCLAB',	'Compounding Lab',	{{ hospital_id }},	1,	NULL,	100,	1),
(19,	'DPCOM',	'Corporate Communications',	{{ hospital_id }},	1,	NULL,	100,	1),
(20,	'DPCSS',	'CSSU',	{{ hospital_id }},	1,	NULL,	100,	1),
(21,	'DPCCC',	'Customer Contact Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(22,	'SCDSC',	'Day Surgery Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(23,	'SCDENC',	'Dental Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(24,	'DPDENTAL',	'Dental Surgery',	{{ hospital_id }},	1,	NULL,	100,	1),
(25,	'SCDERMC',	'Derma Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(26,	'SCDIAB',	'Diabetes',	{{ hospital_id }},	1,	NULL,	100,	1),
(27,	'SCDIABC',	'Diabetes Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(28,	'DPDDR',	'Diagnostic Radiology',	{{ hospital_id }},	1,	NULL,	100,	1),
(29,	'DPEDO',	'Education Development Office',	{{ hospital_id }},	1,	NULL,	100,	1),
(30,	'DPEP',	'Emergency Planning',	{{ hospital_id }},	1,	NULL,	100,	1),
(31,	'SCENDOC',	'Endocrine Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(32,	'SCENDO',	'Endocrinology',	{{ hospital_id }},	1,	NULL,	100,	1),
(33,	'SCEC',	'Endoscopy Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(34,	'DPENT',	'ENT',	{{ hospital_id }},	1,	NULL,	100,	1),
(35,	'SCENTC',	'ENT Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(36,	'DPESA',	'Environmental Services',	{{ hospital_id }},	1,	NULL,	100,	1),
(37,	'DPEYE',	'Eye',	{{ hospital_id }},	1,	NULL,	100,	1),
(38,	'SCEYEC',	'Eye Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(39,	'DPFD',	'Facilities Development',	{{ hospital_id }},	1,	NULL,	100,	1),
(40,	'DPFAC',	'Facilities Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(41,	'SCFCM',	'Family and Community Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(42,	'SCFIN',	'Finance & Accounting',	{{ hospital_id }},	1,	NULL,	100,	1),
(43,	'SCGASC',	'Gastroenterology Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(44,	'DPGENMED',	'General Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(45,	'SCGMC',	'General Medicine Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(46,	'SCGSUR',	'General Surgery',	{{ hospital_id }},	1,	NULL,	100,	1),
(47,	'SCGSC',	'General Surgery Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(48,	'SCGRM',	'Geriatric Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(49,	'SCGRMC',	'Geriatric Outpatient Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(50,	'SCHFLC',	'Health For Life Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(51,	'SCHFLCO',	'Health For Life Centre - Outreach',	{{ hospital_id }},	1,	NULL,	100,	1),
(52,	'DPHCS',	'Home Care Service',	{{ hospital_id }},	1,	NULL,	100,	1),
(53,	'DPADM',	'Hospital Administration',	{{ hospital_id }},	1,	NULL,	100,	1),
(54,	'DPHP',	'Hospital Planning',	{{ hospital_id }},	1,	NULL,	100,	1),
(55,	'SCHRD',	'Human Resource Development',	{{ hospital_id }},	1,	NULL,	100,	1),
(56,	'SCHRM',	'Human Resource Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(57,	'SCICUCCU',	'ICU 1 (CCU)',	{{ hospital_id }},	1,	NULL,	100,	1),
(58,	'SCICUMED',	'ICU 1 (Medical)',	{{ hospital_id }},	1,	NULL,	100,	1),
(59,	'SCICUSUR',	'ICU 2 (Surgical)',	{{ hospital_id }},	1,	NULL,	100,	1),
(60,	'DPIC',	'Infection Control',	{{ hospital_id }},	1,	NULL,	100,	1),
(61,	'DPINN',	'Innovation & Research',	{{ hospital_id }},	1,	NULL,	100,	1),
(62,	'DPHCA',	'Inpatient HCAs',	{{ hospital_id }},	1,	NULL,	100,	1),
(63,	'DPIPS',	'Inpatient Services',	{{ hospital_id }},	1,	NULL,	100,	1),
(64,	'SCISOW',	'Isolation Ward',	{{ hospital_id }},	1,	NULL,	100,	1),
(65,	'DPKTC',	'Kitchen',	{{ hospital_id }},	1,	NULL,	100,	1),
(66,	'DPLAB',	'Laboratory Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(67,	'DPLABM',	'Laboratory Medicine (Drs)',	{{ hospital_id }},	1,	NULL,	100,	1),
(68,	'DPLIN',	'Linen Services',	{{ hospital_id }},	1,	NULL,	100,	1),
(69,	'DPMLR',	'Mail Room',	{{ hospital_id }},	1,	NULL,	100,	1),
(70,	'SCMOT',	'Major Operating Theatre',	{{ hospital_id }},	1,	NULL,	100,	1),
(71,	'DPMMD',	'Materials Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(72,	'DPMRO',	'Medical Records Office',	{{ hospital_id }},	1,	NULL,	100,	1),
(73,	'DPMSS',	'Medical Social Service',	{{ hospital_id }},	1,	NULL,	100,	1),
(74,	'SCNEUROC',	'Neurosurgery Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(75,	'DPNM',	'Nursing Administration',	{{ hospital_id }},	1,	NULL,	100,	1),
(76,	'DPNUT',	'Nutrition & Dietetics',	{{ hospital_id }},	1,	NULL,	100,	1),
(77,	'SCOTH',	'Occupational Therapy',	{{ hospital_id }},	1,	NULL,	100,	1),
(78,	'SCOPATC',	'OPAT Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(79,	'DPOPA',	'Operation Admin',	{{ hospital_id }},	1,	NULL,	100,	1),
(80,	'DPOPT',	'Operations Admin/Tenancy',	{{ hospital_id }},	1,	NULL,	100,	1),
(81,	'DPOPS',	'Operations Support',	{{ hospital_id }},	1,	NULL,	100,	1),
(82,	'SCORTHO',	'Orthopaedic Surgery',	{{ hospital_id }},	1,	NULL,	100,	1),
(83,	'SCORTHSC',	'Orthopaedic Surgery Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(84,	'DPPFU',	'Patient Feedback Unit',	{{ hospital_id }},	1,	NULL,	100,	1),
(85,	'DPPSC',	'Patient Service Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(86,	'SCINP',	'Pharmacy Inpatient',	{{ hospital_id }},	1,	NULL,	100,	1),
(87,	'SCOPT',	'Pharmacy Outpatient',	{{ hospital_id }},	1,	NULL,	100,	1),
(88,	'SCRET',	'Pharmacy Retail',	{{ hospital_id }},	1,	NULL,	100,	1),
(89,	'SCSTR',	'Pharmacy Store',	{{ hospital_id }},	1,	NULL,	100,	1),
(90,	'SCPHY',	'Physiotherapy',	{{ hospital_id }},	1,	NULL,	100,	1),
(91,	'DPPOPH',	'Population Health',	{{ hospital_id }},	1,	NULL,	100,	1),
(92,	'DPPOR',	'Portering',	{{ hospital_id }},	1,	NULL,	100,	1),
(93,	'DPPSY',	'Psychological Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(94,	'SCPSYW',	'Psychological Wellness Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(95,	'DPQRM',	'Quality and Risk Management',	{{ hospital_id }},	1,	NULL,	100,	1),
(96,	'DPRC',	'Renal Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(97,	'SCRENAL',	'Renal Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(98,	'DPRPO',	'Residency Program Office',	{{ hospital_id }},	1,	NULL,	100,	1),
(99,	'SCRESM',	'Respiratory Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(100,	'SCRESMC',	'Respiratory Medicine Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(101,	'DPRTS',	'Respiratory Therapy Services',	{{ hospital_id }},	1,	NULL,	100,	1),
(102,	'DPSEC',	'Security',	{{ hospital_id }},	1,	NULL,	100,	1),
(103,	'SCSPE',	'Speech Therapy',	{{ hospital_id }},	1,	NULL,	100,	1),
(104,	'DPSS',	'Sponsored Student',	{{ hospital_id }},	1,	NULL,	100,	1),
(105,	'SCSTC',	'Sports Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(106,	'SCSPTM',	'Sports Medicine',	{{ hospital_id }},	1,	NULL,	100,	1),
(107,	'SCSTAFFC',	'Staff Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(108,	'SCABL',	'The Able Studio',	{{ hospital_id }},	1,	NULL,	100,	1),
(109,	'DPTC',	'Transitional Care',	{{ hospital_id }},	1,	NULL,	100,	1),
(110,	'DPTRN',	'Transport',	{{ hospital_id }},	1,	NULL,	100,	1),
(111,	'DPURO',	'Urology',	{{ hospital_id }},	1,	NULL,	100,	1),
(112,	'SCUROC',	'Urology Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(113,	'SCWA51',	'Ward A51',	{{ hospital_id }},	1,	NULL,	100,	1),
(114,	'SCWA52',	'Ward A52',	{{ hospital_id }},	1,	NULL,	100,	1),
(115,	'SCWA61',	'Ward A61',	{{ hospital_id }},	1,	NULL,	100,	1),
(116,	'SCWA62',	'Ward A62',	{{ hospital_id }},	1,	NULL,	100,	1),
(117,	'SCWA71',	'Ward A71',	{{ hospital_id }},	1,	NULL,	100,	1),
(118,	'SCWA72',	'Ward A72',	{{ hospital_id }},	1,	NULL,	100,	1),
(119,	'SCWA82',	'Ward A82',	{{ hospital_id }},	1,	NULL,	100,	1),
(120,	'SCWV105',	'Ward B105',	{{ hospital_id }},	1,	NULL,	100,	1),
(121,	'SCWB106',	'Ward B106',	{{ hospital_id }},	1,	NULL,	100,	1),
(122,	'SCWB55',	'Ward B55',	{{ hospital_id }},	1,	NULL,	100,	1),
(123,	'SCWB56',	'Ward B56',	{{ hospital_id }},	1,	NULL,	100,	1),
(124,	'SCWB65',	'Ward B65',	{{ hospital_id }},	1,	NULL,	100,	1),
(125,	'SCWB66',	'Ward B66',	{{ hospital_id }},	1,	NULL,	100,	1),
(126,	'SCWB75',	'Ward B75',	{{ hospital_id }},	1,	NULL,	100,	1),
(127,	'SCWB76',	'Ward B76',	{{ hospital_id }},	1,	NULL,	100,	1),
(128,	'SCWB85',	'Ward B85',	{{ hospital_id }},	1,	NULL,	100,	1),
(130,	'SCWB95',	'Ward B95',	{{ hospital_id }},	1,	NULL,	100,	1),
(131,	'SCWB96',	'Ward B96',	{{ hospital_id }},	1,	NULL,	100,	1),
(132,	'SCWOC',	'Women Clinic',	{{ hospital_id }},	1,	NULL,	100,	1),
(133,	'DPWMC',	'Woodlands Medical Centre',	{{ hospital_id }},	1,	NULL,	100,	1),
(134,	'DVYCH',	'Yishun Community Hospital',	{{ hospital_id }},	1,	NULL,	100,	1),
(135,	'SCK3014010',	'Medicine (doctors)',	{{ hospital_id }},	2,	NULL,	100,	1),
(136,	'SCK3017010',	'Orthopaedic Surgery (doctors)',	{{ hospital_id }},	489,	NULL,	100,	1),
(137,	'SCK2014020',	'Dermatology Clinic',	{{ hospital_id }},	491,	NULL,	100,	1),
(170,	'SCK3015010',	'Surgery (doctors)',	{{ hospital_id }},	3,	NULL,	100,	1),
(203,	'DPSUBC',	'Subway Clinic',	{{ hospital_id }},	558,	NULL,	100,	1),
(204,	'DVWIHC',	'Woodlands Integrated Hospital Campus',	{{ hospital_id }},	559,	NULL,	100,	1),
(205,	'DPAMC',	'Admiralty Medical Centre',	{{ hospital_id }},	560,	NULL,	100,	1),
(236,	'DPLOB',	'Lobby',	{{ hospital_id }},	455,	NULL,	100,	1),
(237,	'SCK3017080',	'Sports Medicine (doctors)',	{{ hospital_id }},	60,	NULL,	100,	1),
(364,	'DPOCI',	'Office Of Clinical Informatics',	{{ hospital_id }},	852,	NULL,	100,	1),
(271,	'DPAHSPROO',	'Ahs Programme Office',	{{ hospital_id }},	636,	NULL,	100,	1),
(272,	'SCK3012010',	'Geriatric Medicine (doctors)',	{{ hospital_id }},	4,	NULL,	100,	1),
(273,	'SCK3021010',	'Dental Surgery (doctors)',	{{ hospital_id }},	24,	NULL,	100,	1),
(274,	'DPGERI',	'Geri',	{{ hospital_id }},	638,	NULL,	100,	1),
(275,	'DPGERINT',	'Gericare@north',	{{ hospital_id }},	644,	NULL,	100,	1),
(365,	'DPAIPCCT',	'Aip-cct',	{{ hospital_id }},	853,	NULL,	100,	1),
(309,	'WIHCM',	'Woodlands Integrated Healthcare Campus',	{{ hospital_id }},	559,	NULL,	100,	1),
(310,	'NASS',	'Nursing Admin (sponsored Student)',	{{ hospital_id }},	787,	NULL,	100,	1),
(311,	'SCK3011010',	'Anaesthesia (doctors)',	{{ hospital_id }},	7,	NULL,	100,	1),
(312,	'SCK3015130',	'Ent (doctors)',	{{ hospital_id }},	29,	NULL,	100,	1),
(313,	'SCK2700010',	'Icu 1',	{{ hospital_id }},	797,	NULL,	100,	1),
(314,	'SCK3100400',	'Material Management',	{{ hospital_id }},	801,	NULL,	100,	1),
(315,	'SCK3100100',	'Operational Support',	{{ hospital_id }},	803,	NULL,	100,	1),
(316,	'SCK3014060',	'Cardiology (doctors)',	{{ hospital_id }},	5,	NULL,	100,	1),
(317,	'SCK2700020',	'Icu 2',	{{ hospital_id }},	806,	NULL,	100,	1),
(318,	'SCK2300020',	'Physiotherapy (sports/geri/podiatry)',	{{ hospital_id }},	498,	NULL,	100,	1),
(319,	'SCK2700030',	'Cardiac Care Unit',	{{ hospital_id }},	797,	NULL,	100,	1),
(320,	'SCK2999991',	'Children Clinic',	{{ hospital_id }},	817,	NULL,	100,	1),
(308,	'DPPSYS',	'Psychology Service',	{{ hospital_id }},	679,	NULL,	100,	1),
(321,	'SCYD57',	'Ward D57',	{{ hospital_id }},	175,	NULL,	100,	1),
(322,	'SCYD58',	'Ward D58',	{{ hospital_id }},	175,	NULL,	100,	1),
(323,	'SCYD107',	'Ward D107',	{{ hospital_id }},	175,	NULL,	100,	1),
(324,	'SCYD97',	'Ward D97',	{{ hospital_id }},	175,	NULL,	100,	1),
(325,	'SCYD68',	'Ward D68',	{{ hospital_id }},	175,	NULL,	100,	1),
(326,	'DPWCSP',	'Clinical Services Planning',	{{ hospital_id }},	821,	NULL,	100,	1),
(327,	'SCYD88',	'Ward D88',	{{ hospital_id }},	175,	NULL,	100,	1),
(328,	'SCYD67',	'Ward D67',	{{ hospital_id }},	175,	NULL,	100,	1),
(329,	'SCYD77',	'Ward D77',	{{ hospital_id }},	175,	NULL,	100,	1),
(330,	'DPWOPP',	'Operations Planning',	{{ hospital_id }},	822,	NULL,	100,	1),
(331,	'DPYOPA',	'Operations Admin',	{{ hospital_id }},	823,	NULL,	100,	1),
(332,	'DPWFIN',	'Finance',	{{ hospital_id }},	36,	NULL,	100,	1),
(333,	'DPWAN',	'Analytics',	{{ hospital_id }},	824,	NULL,	100,	1),
(334,	'SCYD108',	'Ward D108',	{{ hospital_id }},	175,	NULL,	100,	1),
(335,	'SCYD98',	'Ward D98',	{{ hospital_id }},	175,	NULL,	100,	1),
(336,	'SCYD78',	'Ward D78',	{{ hospital_id }},	175,	NULL,	100,	1),
(337,	'SCYD87',	'Ward D87',	{{ hospital_id }},	175,	NULL,	100,	1),
(338,	'DPWNURS',	'Nursing Services',	{{ hospital_id }},	825,	NULL,	100,	1),
(339,	'SCYD48',	'Ward D48',	{{ hospital_id }},	175,	NULL,	100,	1),
(340,	'DPWCDV',	'Corporate Development',	{{ hospital_id }},	826,	NULL,	100,	1),
(341,	'SCYSUBA',	'Sub-acute (doctors)',	{{ hospital_id }},	4,	NULL,	100,	1),
(342,	'DPWCOP',	'Clinical Operations',	{{ hospital_id }},	827,	NULL,	100,	1),
(343,	'DPWHAD',	'Hospital Admin',	{{ hospital_id }},	828,	NULL,	100,	1),
(344,	'DPYEVMGT',	'Event Management',	{{ hospital_id }},	829,	NULL,	100,	1),
(345,	'DPWCE',	'Communications & Engagement',	{{ hospital_id }},	830,	NULL,	100,	1),
(346,	'DPYRAU',	'Referral And Admission Unit',	{{ hospital_id }},	831,	NULL,	100,	1),
(347,	'SCWA78',	'Ktph Ward D78',	{{ hospital_id }},	175,	NULL,	100,	1),
(348,	'DPOVS',	'Ophthalmology And Visual Sciences',	{{ hospital_id }},	833,	NULL,	100,	1),
(349,	'DPWCS',	'Corporate Services',	{{ hospital_id }},	835,	NULL,	100,	1),
(350,	'DVWAHS',	'Allied Health Services',	{{ hospital_id }},	838,	NULL,	100,	1),
(351,	'DPWOA',	'Office Admin',	{{ hospital_id }},	839,	NULL,	100,	1),
(352,	'DPWOD',	'Organisation Development',	{{ hospital_id }},	840,	NULL,	100,	1),
(353,	'SCWA87',	'Ktph Ward D87',	{{ hospital_id }},	175,	NULL,	100,	1),
(354,	'DPWNUR',	'Nursing Services Manpower',	{{ hospital_id }},	843,	NULL,	100,	1),
(355,	'AHI',	'Alexandra Health Institute',	{{ hospital_id }},	93,	NULL,	1000,	1),
(356,	'AIP',	'Ageing In Place',	{{ hospital_id }},	93,	NULL,	1000,	1),
(366,	'DPPOD',	'Podiatry',	{{ hospital_id }},	854,	NULL,	100,	1),
(270,	'SCK3015120',	'Eye (doctors)',	{{ hospital_id }},	32,	NULL,	100,	1),
(357,	'DVWMS',	'Medical Services',	{{ hospital_id }},	834,	NULL,	100,	1),
(358,	'SCCQ',	'Clinical Quality',	{{ hospital_id }},	{{ hospital_id }},	NULL,	100,	1),
(359,	'DPYKIT',	'Food Services',	{{ hospital_id }},	849,	NULL,	100,	1),
(360,	'SCMINFO',	'Medical Informatics',	{{ hospital_id }},	7,	NULL,	100,	1),
(361,	'SCCFM',	'Clinical Feedback Management',	{{ hospital_id }},	7,	NULL,	100,	1),
(362,	'SCMA',	'Medical Affairs',	{{ hospital_id }},	7,	NULL,	100,	1),
(363,	'DPSOCSEV',	'Soc Services',	{{ hospital_id }},	850,	NULL,	100,	1),
(367,	'DVWPOPS',	'Pre Operations',	{{ hospital_id }},	855,	NULL,	100,	1),
(368,	'DPWCCT',	'Community Care Transformation',	{{ hospital_id }},	856,	NULL,	100,	1),
(369,	'DPWTO',	'Transformation Office',	{{ hospital_id }},	857,	NULL,	100,	1),
(370,	'DPWBO',	'Patient Billing Services',	{{ hospital_id }},	858,	NULL,	100,	1),
(371,	'DPWIDFE',	'Infra Dev & Fac Engineering',	{{ hospital_id }},	860,	NULL,	100,	1),
(372,	'DPWCP',	'Campus Planning',	{{ hospital_id }},	861,	NULL,	100,	1),
(373,	'DPWDOKI',	'Knowledge & Innovation',	{{ hospital_id }},	862,	NULL,	100,	1),
(374,	'DPWPREH',	'Pre Hospital',	{{ hospital_id }},	863,	NULL,	100,	1),
(375,	'DPWASOC',	'Ambulatory & Soc Operations',	{{ hospital_id }},	864,	NULL,	100,	1),
(376,	'DPWMED',	'Medicine & Community',	{{ hospital_id }},	865,	NULL,	100,	1),
(377,	'DPWINF',	'Informatics',	{{ hospital_id }},	866,	NULL,	100,	1),
(378,	'DPWINPO',	'Inpatient Operations',	{{ hospital_id }},	867,	NULL,	100,	1),
(379,	'DPWIDIFE',	'Infrastructure & Engineering',	{{ hospital_id }},	868,	NULL,	100,	1),
(380,	'DPWAH',	'Allied Health Manpower',	{{ hospital_id }},	869,	NULL,	100,	1),
(381,	'DVWOPS',	'Operations',	{{ hospital_id }},	563,	NULL,	100,	1),
(382,	'SCPO',	'Prosthetist And Orthotist',	{{ hospital_id }},	189,	NULL,	100,	1),
(384,	'SCICODC',	'Icod Clinic',	{{ hospital_id }},	177,	NULL,	100,	1),
(385,	'SCRHEUMC',	'Rheumatology Clinic',	{{ hospital_id }},	177,	NULL,	100,	1),
(393,	'DPAPN',	'Apn And Specialty Nurses',	{{ hospital_id }},	890,	NULL,	100,	1),
(394,	'SCCSI',	'Clinical Standards And Improvement',	{{ hospital_id }},	891,	NULL,	100,	1),
(395,	'SCPRSC',	'Patient Relations Services (clinical)',	{{ hospital_id }},	891,	NULL,	100,	1),
(396,	'DPOCG',	'Office Of Clinical Governance',	{{ hospital_id }},	891,	NULL,	100,	1),
(39{7,	'DPWCLOP',	'Clinical Ops',	{{ hospital_id }},	893,	NULL,	100,	1),
(398,	'DPLSTC',	'Life Support Training Centre',	{{ hospital_id }},	894,	NULL,	100,	1),
(399,	'DPWHFM',	'Facility Management',	{{ hospital_id }},	895,	NULL,	100,	1),
(400,	'DPWVSO',	'Value And Safety Office',	{{ hospital_id }},	897,	NULL,	100,	1),
(401,	'DPWNSP',	'Nursing Service Planning',	{{ hospital_id }},	898,	NULL,	100,	1),
(402,	'SCSOHC',	'Staff & Occupational Health Clinic',	{{ hospital_id }},	177,	NULL,	100,	1),
(403,	'SCWQSM',	'Quality Service Management',	{{ hospital_id }},	857,	NULL,	100,	1),
(405,	'DPWNA',	'Nursing Ancillary',	{{ hospital_id }},	900,	NULL,	100,	1),
(406,	'DPGME',	'Graduate Medical Education',	{{ hospital_id }},	901,	NULL,	100,	1),
(407,	'DPWSORA',	'Strategic Operations Research & Analytic',	{{ hospital_id }},	902,	NULL,	100,	1),
(408,	'DPYAOCA',	'Ych Admin Office/clinical Affairs',	{{ hospital_id }},	903,	NULL,	100,	1),
(409,	'DPYCHAOI',	'Ych Admin Office/inpatient',	{{ hospital_id }},	904,	NULL,	100,	1),
(410,	'DPYAORA',	'Ych Admin Office/referral & Admission',	{{ hospital_id }},	905,	NULL,	100,	1),
(411,	'SCMEDONCO',	'Medical Oncology Clinic',	{{ hospital_id }},	177,	NULL,	100,	1),
(413,	'DVCSS',	'Clinical Support Services',	{{ hospital_id }},	907,	NULL,	100,	1),
(414,	'DVCH',	'Community Hsp',	{{ hospital_id }},	909,	NULL,	100,	1),
(415,	'SCGASTRO',	'Gm-gastroenterology',	{{ hospital_id }},	3,	NULL,	100,	1),
(416,	'DPAHSP',	'Allied Health Services & Pharmacy',	{{ hospital_id }},	910,	NULL,	100,	1),
(417,	'DVWC',	'Whc Central',	{{ hospital_id }},	911,	NULL,	100,	1),
(418,	'DPEPID',	'Gm-clinical Epidemiology Unit',	{{ hospital_id }},	912,	NULL,	100,	1),
(419,	'DPTHINK',	'Think Centre',	{{ hospital_id }},	913,	NULL,	100,	1),
(420,	'DPWWDC',	'Workflow & Document Control',	{{ hospital_id }},	914,	NULL,	100,	1),
(421,	'SCRHEU',	'Gm-rheumatology',	{{ hospital_id }},	2,	NULL,	100,	1),
(1,	'DPANE',	'Acute and Emergency Care edit',	{{ hospital_id }},	1,	NULL,	100,	1),
(422,	'test',	'test',	{{ hospital_id }},	10,	NULL,	1000,	1),
(423,	'SD',	'New Added SD',	{{ hospital_id }},	10,	NULL,	10000000,	1),
(424,	'SD1',	'test add NEW SD',	{{ hospital_id }},	10,	NULL,	100000,	1);

DROP TABLE IF EXISTS "hms_doctor";
CREATE TABLE "public"."hms_doctor" (
    "jid" character varying(50) NOT NULL,
    "name" character varying(100) NOT NULL,
    "mobile" character varying(50),
    "operatorid" integer,
    "designationid" integer NOT NULL,
    "departmentid" integer NOT NULL,
    "pager" character varying(50),
    "mcr" character varying(50),
    "created_by" character varying(50),
    "created_date" timestamp,
    "updated_by" character varying(50),
    "updated_date" timestamp,
    "escalation_status" integer DEFAULT '1' NOT NULL,
    "transport_type" integer DEFAULT '0' NOT NULL,
    "extension" character varying(50),
    "hospitalid" integer NOT NULL,
    "type" character varying DEFAULT 'doctor' NOT NULL,
    "title" character varying(35),
    "subdeptid" integer,
    "sectionid" integer,
    "groupid" integer,
    "location" character varying,
    "privacy_status" integer DEFAULT '0' NOT NULL,
    "remote_status" integer DEFAULT '1' NOT NULL,
    "display_priority" integer DEFAULT '1000' NOT NULL,
    "fax" character varying(50),
    "divisionid" integer,
    "subsectionid" integer,
    "unitid" integer,
    "physical_location_id" integer,
    "areas_of_interest" text,
    CONSTRAINT "doctor_jid_index" UNIQUE ("jid"),
    CONSTRAINT "hms_doctor_pkey" PRIMARY KEY ("jid")
) WITH (oids = false);

CREATE INDEX "doctor_department_index" ON "public"."hms_doctor" USING btree ("departmentid");

CREATE INDEX "doctor_designation_index" ON "public"."hms_doctor" USING btree ("designationid");

CREATE INDEX "doctor_ext_index" ON "public"."hms_doctor" USING btree ("extension");

CREATE INDEX "doctor_group_index" ON "public"."hms_doctor" USING btree ("groupid");

CREATE INDEX "doctor_hospital_index" ON "public"."hms_doctor" USING btree ("hospitalid");

CREATE INDEX "doctor_location_index" ON "public"."hms_doctor" USING btree ("location");

CREATE INDEX "doctor_mcr_index" ON "public"."hms_doctor" USING btree ("mcr");

CREATE INDEX "doctor_mobile_index" ON "public"."hms_doctor" USING btree ("mobile");

CREATE INDEX "doctor_pager_index" ON "public"."hms_doctor" USING btree ("pager");

CREATE INDEX "doctor_section_index" ON "public"."hms_doctor" USING btree ("sectionid");

CREATE INDEX "doctor_subdept_index" ON "public"."hms_doctor" USING btree ("subdeptid");

CREATE INDEX "doctor_transport_type_index" ON "public"."hms_doctor" USING btree ("transport_type");

CREATE INDEX "hms_doctor_type" ON "public"."hms_doctor" USING btree ("type");

COMMENT ON COLUMN "public"."hms_doctor"."privacy_status" IS '0 = show all; 1= hide contact; 2 = hidden';

INSERT INTO "hms_doctor" ("jid", "name", "mobile", "operatorid", "designationid", "departmentid", "pager", "mcr", "created_by", "created_date", "updated_by", "updated_date", "escalation_status", "transport_type", "extension", "hospitalid", "type", "title", "subdeptid", "sectionid", "groupid", "location", "privacy_status", "remote_status", "display_priority", "fax", "divisionid", "subsectionid", "unitid", "physical_location_id", "areas_of_interest") VALUES
('{{ hospital }}admin@{{ hospital }}.com.sg',	'{{ hospital | upper }} Administrator',	'99999999',	0,	-1,	1,	NULL,	'',	'hmssystem@{{ hospital }}.com.sg',	'now()',	NULL,	NULL,	1,	0,	'',	{{ hospital_id | default(1) }},	'system',	'',	NULL,	NULL,	NULL,	NULL,	0,	1,	1000,	'',	NULL,	NULL,	NULL,	NULL,	NULL);

INSERT INTO "hms_doctor" ("jid", "name", "mobile", "operatorid", "designationid", "departmentid", "pager", "mcr", "created_by", "created_date", "updated_by", "updated_date", "escalation_status", "transport_type", "extension", "hospitalid", "type", "title", "subdeptid", "sectionid", "groupid", "location", "privacy_status", "remote_status", "display_priority", "fax", "divisionid", "subsectionid", "unitid", "physical_location_id", "areas_of_interest") VALUES
('hmssystem@{{ hospital }}.com.sg',	'HMS System',	'99999999',	0,	-1,	-1,	NULL,	'',	'hmssystem@{{ hospital }}.com.sg',	'now()',	NULL,	NULL,	1,	0,	'',	{{ hospital_id | default(1) }},	'system',	'',	NULL,	NULL,	NULL,	NULL,	0,	1,	1000,	'',	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "hms_doctor_details";
CREATE TABLE "public"."hms_doctor_details" (
    "jid" character varying(50) NOT NULL,
    "departmentid" integer,
    "subdeptid" integer,
    "sectionid" integer,
    "designationid" integer,
    "extension" character varying(50),
    "position" integer NOT NULL,
    "hospitalid" integer,
    "divisionid" integer,
    "subsectionid" integer,
    "unitid" integer,
    "physical_location_id" integer,
    CONSTRAINT "hms_details_unique_key" UNIQUE ("jid", "departmentid", "subdeptid", "sectionid", "designationid", "extension"),
    CONSTRAINT "hms_doctor_details_pkey" PRIMARY KEY ("jid", "position")
) WITH (oids = false);

CREATE INDEX "doctor_details_dept_index" ON "public"."hms_doctor_details" USING btree ("departmentid");

CREATE INDEX "doctor_details_designation_index" ON "public"."hms_doctor_details" USING btree ("designationid");

CREATE INDEX "doctor_details_hospital_index" ON "public"."hms_doctor_details" USING btree ("hospitalid");

CREATE INDEX "doctor_details_jid_index" ON "public"."hms_doctor_details" USING btree ("jid");

CREATE INDEX "doctor_details_section_index" ON "public"."hms_doctor_details" USING btree ("sectionid");

CREATE INDEX "doctor_details_subdept_index" ON "public"."hms_doctor_details" USING btree ("subdeptid");

DROP TABLE IF EXISTS "hms_doctor_designation";
DROP SEQUENCE IF EXISTS hms_doctor_designation_designationid_seq;
CREATE SEQUENCE hms_doctor_designation_designationid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_doctor_designation" (
    "designationid" integer DEFAULT nextval('hms_doctor_designation_designationid_seq') NOT NULL,
    "designation" character varying NOT NULL,
    "abbrev" character varying(50) NOT NULL,
    "hospitalid" integer NOT NULL,
    "display_position" integer DEFAULT '100' NOT NULL,
    "designation_type" character varying(3) DEFAULT 'C' NOT NULL,
    "color" character varying(6) DEFAULT '000000' NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "designation_group" character varying(5),
    "upload_display_position" integer,
    CONSTRAINT "designation_unique_key" UNIQUE ("abbrev", "hospitalid")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_doctor_designation"."designation_type" IS 'A = Administrative; C = Clinical';

INSERT INTO "hms_doctor_designation" ("designationid", "designation", "abbrev", "hospitalid", "display_position", "designation_type", "color", "status", "designation_group", "upload_display_position") VALUES
(723,	'Test QA Designation edit',	'TSQD',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(413,	'Associate Consultant',	'AC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(481,	'Chairman Medical Board/ Senior Consultant',	'CMBSC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(5,	'Medical Officer',	'MO',	'{{ hospital_id }}',	100,	'C',	'006600',	1,	'MO',	NULL),
(6,	'House Officer',	'HO',	'{{ hospital_id }}',	100,	'C',	'0000FF',	1,	'HO',	NULL),
(8,	'Registrar',	'R',	'{{ hospital_id }}',	100,	'C',	'FF9900',	1,	'R',	NULL),
(9,	'Consultant',	'C',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(11,	'Engineer',	'ER',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(14,	'Secretary',	'S',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(15,	'Administrative Assistant',	'AA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(17,	'Executive',	'EX',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(18,	'Manager',	'M',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(19,	'Patient Information Associate',	'PIA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(20,	'Senior Staff Nurse',	'SSN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(23,	'Triage Specialist',	'TRI',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(25,	'Director',	'DIR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(26,	'Principal Medical Technologist',	'PMT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(7,	'Resident Medical Officer',	'RSMO',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(21,	'Senior Supervisor',	'SSUP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(28,	'Accountant',	'ACC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(30,	'Accounts Supervisor',	'ACCS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(31,	'Assistant Director',	'ADIR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(32,	'Assistant Director, Nursing',	'ADIRN',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(34,	'Assistant Laboratory Technologist',	'ALT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(35,	'Assistant Manager',	'AM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(36,	'Assistant Medical Technologist',	'AMT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(37,	'Assistant Nurse',	'AN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(42,	'Audiology Technician',	'AUT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(43,	'AV Technician',	'AVT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(45,	'Business Analyst',	'BA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(46,	'Business Office Assistant',	'BOA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(47,	'Business Office Specialist',	'BOS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(48,	'Buyer',	'B',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(52,	'Chef De Partie',	'CDP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(53,	'Chief Executive Officer',	'CEO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(54,	'Chief Financial Officer',	'CFO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(56,	'Work Life Partner',	'WLP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(59,	'Chief Human Resource Officer',	'CHRO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(60,	'Chief Operating Officer',	'COO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(61,	'Chief Pharmacist',	'CPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(68,	'Chief Transformation Officer',	'CTO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(73,	'Clerk',	'CL',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(49,	'Care Coordinator',	'CCO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(75,	'Clinical Coder',	'CC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(76,	'Clinical Coding Specialist',	'CCS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(77,	'Clinical Educator',	'CE',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(80,	'Cook',	'CK',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(81,	'CSSU Attendant',	'CSSUA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(82,	'Demi Chef De Partie',	'DCDP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(83,	'Dental Assistant',	'DA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(84,	'Dental Officer',	'DO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(87,	'Deputy Director, Nursing',	'DDIRN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(88,	'Dietitian',	'DIET',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(91,	'Driver',	'DR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(92,	'Emergency Response Medic',	'ERM',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(93,	'Engineering Assistant',	'EA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(94,	'Environment Service Associate',	'ESA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(95,	'Environment Service Associate (Team Leader)',	'ESATL',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(58,	'Medical Officer (NTS)',	'MONTS',	'{{ hospital_id }}',	100,	'C',	'006600',	1,	'MO',	NULL),
(27,	'Resident House Officer',	'RSHO',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'HO',	NULL),
(101,	'Executive Personal Assistant',	'EXPA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(102,	'Executive Secretary',	'EXS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(103,	'Exercise Trainer',	'ET',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(107,	'Fire Safety Manager',	'FSM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(110,	'Healthcare Assistant',	'HCA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(111,	'Human Resource Assistant',	'HRA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(113,	'Imaging Specialist',	'IS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(115,	'Kitchen Attendant',	'KA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(116,	'Laboratory Information System Officer',	'LISO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(119,	'Materials Coordinator',	'MCO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(120,	'Medical Information Officer',	'MIO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(121,	'Medical Laboratory Assistant',	'MLA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(122,	'Medical Social Worker',	'MSW',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(123,	'Medical Technologist',	'MT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(124,	'Nurse Clinician',	'NC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(125,	'Nurse Educator',	'NE',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(126,	'Nurse Manager',	'NM',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(127,	'Occupational Therapist',	'OT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(129,	'Optometrist',	'OP',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(130,	'Patient Greeter',	'PG',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(131,	'Patient Relations Associate',	'PRA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(132,	'Patient Relations Associate (NOK)',	'PRANOK',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(104,	'F&B Coordinator',	'FBCO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(133,	'Patient Service Associate',	'PSA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(134,	'Pharmacist',	'PH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(135,	'Pharmacy Assistant',	'PHA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(136,	'Pharmacy Technician',	'PHT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(724,	'QA Tester',	'QAT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(137,	'Pharmacy Technician Supervisor',	'PHTS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(139,	'Physicist',	'PHY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(140,	'Physiotherapist',	'PHYT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(141,	'Podiatrist',	'PD',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(142,	'Podiatry Assistant',	'PDA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(143,	'Portering Attendant',	'PTA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(145,	'Principal Assistant Nurse',	'PAN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(146,	'Principal Clinical Pharmacist',	'PCPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(147,	'Principal Occupational Therapist',	'POT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(148,	'Principal Physiotherapist',	'PPHYT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(150,	'Principal Radiographer',	'PRD',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(153,	'Project Coordinator',	'PJC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(154,	'Project Specialist',	'PJS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(158,	'Radiographer',	'RD',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(161,	'Renal Coordinator',	'RENCO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(162,	'Research Nurse',	'RN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(167,	'Respiratory Therapist',	'REST',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(399,	'Senior Administrative Assistant',	'SAA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(401,	'Senior Assistant Nurse',	'SAN',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(437,	'Senior Clerk',	'SCL',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(403,	'Senior Consultant',	'SC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(409,	'Senior Dental Assistant',	'SDA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(411,	'Senior Engineer',	'SER',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(423,	'Senior Engineering Assistant',	'SEA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(408,	'Senior Health Attendant',	'SHA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(421,	'Senior Healthcare Assistant',	'SHCA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(410,	'Senior Kitchen Attendant',	'SKA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(417,	'Senior Manager',	'SM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(400,	'Senior Medical Technologist',	'SMT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(414,	'Senior Patient Information Associate',	'SPIA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(402,	'Senior Patient Service Associate',	'SPSA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(404,	'Senior Pharmacist',	'SPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(405,	'Senior Pharmacy Technician',	'SPHT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(425,	'Senior Physiotherapist',	'SPHY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(406,	'Senior Registrar',	'SR',	'{{ hospital_id }}',	100,	'C',	'FF9900',	1,	'R',	NULL),
(422,	'Senior Renal Coordinator',	'SRC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(426,	'Senior Social Work Assistant',	'SSWA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(420,	'Senior Storekeeper',	'SS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(244,	'Visiting Consultant',	'VC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(245,	'Visiting Registrar',	'VR',	'{{ hospital_id }}',	100,	'C',	'FF9900',	1,	'R',	NULL),
(407,	'Assistant Buyer',	'AB',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(412,	'Locum Medical Officer',	'LMO',	'{{ hospital_id }}',	100,	'C',	'006600',	1,	'MO',	NULL),
(415,	'Research Officer',	'RO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(221,	'Sous Chef',	'SCF',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(222,	'Speech Therapist',	'SPT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(224,	'Staff Nurse',	'SN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(225,	'Staff Nurse II',	'SN2',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(226,	'Storekeeper',	'SK',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(227,	'Supervisor',	'SUP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(228,	'Therapy Assistant',	'TA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(229,	'Therapy Attendant',	'TAT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(460,	'Principal Clinical Psychologist',	'PCPSY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(469,	'Principal Pharmacist',	'PPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(467,	'Principal Podiatrist',	'PPD',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(427,	'Senior Accounts Assistant',	'SACCA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(474,	'Principal Research Officer',	'PRSO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(459,	'Research Assistant',	'RA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(428,	'Senior Clinical Psychologist',	'SCPSY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(498,	'Senior Imaging Specialist',	'SIS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(476,	'Senior It Specialist',	'SITS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(456,	'Senior Audiologist',	'SAU',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(509,	'Accounts Executive',	'ACCE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(457,	'Senior Business Office Assistant',	'SBOA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(464,	'Staff Nurse 1',	'DES464',	'{{ hospital_id }}',	100,	'X',	'000000',	1,	NULL,	NULL),
(503,	'Senior Buyer',	'SB',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(105,	'F&B Assistant',	'FBA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(470,	'Senior Clinical Pharmacist',	'SCPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(489,	'Senior Co-ordinator',	'SCO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(444,	'Pre-registration Pharmacist',	'PRPH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(499,	'Senior Dental Technician',	'SDT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(455,	'Senior Accountant',	'SACC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(475,	'Senior Dietitian',	'SDIET',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(482,	'Senior Driver',	'SDR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(483,	'Senior Environment Service Associate',	'SESA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(434,	'Senior Executive',	'SE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(922,	'Asst Manager',	'ASSM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(452,	'Senior Human Resource Assistant',	'SHRA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(440,	'Senior Human Resource Executive',	'SHRE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(501,	'Senior Laboratory Information System Officer',	'SLISO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(435,	'Senior Medical Laboratory Assistant',	'SMLA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(453,	'Senior Medical Social Worker',	'SMSW',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(419,	'Senior Resident Physician',	'SRSPH',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(462,	'Senior Nurse Manager',	'SNM',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(239,	'Clinical Fellow',	'CF',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(451,	'Senior Biomedical Engineer',	'SBE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(431,	'Senior Nurse Clinician',	'SNC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(429,	'Senior Nurse Educator',	'SNE',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(433,	'Senior Occupational Therapist',	'SOT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(436,	'Senior Optometrist',	'SOP',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(495,	'Senior Patient Greeter',	'SPG',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(486,	'Senior Patient Relations Associate',	'SPRA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(439,	'Senior Pharmacy Assistant',	'SPHA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(465,	'Senior Podiatry Assistant',	'SPDA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(430,	'Senior Radiographer',	'SRD',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(473,	'Senior Research Nurse',	'SRN',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(490,	'Senior Research Officer',	'SRO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(494,	'Senior Respiratory Therapist',	'SRT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(438,	'Senior Retail Executive',	'SRE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(466,	'Senior Speech Therapist',	'SST',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(507,	'Social Work Assistant',	'SWA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(480,	'Staff Nurse I',	'SN1',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(449,	'Temp Storekeeper',	'TSK',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(497,	'Assistant Director (health For Life)',	'ADIRHFL',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(500,	'Associate Consultant, Pharmacy',	'ACPH',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(463,	'Audio Visual Officer',	'AVO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(450,	'Chief Psychologist',	'CPSY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(505,	'Executive Chef',	'EC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(477,	'Graphic Designer',	'GD',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(472,	'Human Resource Executive',	'HRE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(468,	'Group Chief Executive Officer',	'GCEO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(491,	'Locum',	'L',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(471,	'Locum Consultant',	'LC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(508,	'Patient Relations Officer',	'PRO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(279,	'Temp Staff',	'TS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(278,	'Visiting Associate Consultant',	'VAC',	'{{ hospital_id }}',	100,	'C',	'FF0000',	1,	'C',	NULL),
(515,	'Locum Resident Physician',	'LRP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(516,	'Locum Pharmacist',	'LP',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(518,	'Health Attendant',	'HA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(519,	'Locum Principal Resident Physician',	'LPRP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(521,	'Director, Transformation Office',	'DTRA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(523,	'Senior Technical Analyst',	'SRTA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(559,	'Assistant Supervisor',	'ASUP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(560,	'Biostatistician',	'BSTA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(562,	'Case Coordinator',	'CCOO',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(563,	'Chief Medical Technologist',	'CMT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(496,	'Visiting Resident Physician',	'VRP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(448,	'Temp Administrative Assistant',	'TADMA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(557,	'Staff Physician',	'SP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(566,	'Clinical Research Assistant',	'CRA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(569,	'Executive (Project Specialist)',	'EXPRS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(572,	'It Specialist',	'ITS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(574,	'Materials Logistics Coordinator',	'MLC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(578,	'Oral Health Therapist',	'OHT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(579,	'Patient Relations Executive',	'PRE',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(584,	'Senior AV Technician',	'SAVT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(585,	'Senior Business Analyst',	'SBA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(586,	'Senior Industrial Designer',	'SID',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(587,	'Senior Pals Coordinator',	'SPC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(588,	'Senior Portering Attendant',	'SPTA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(589,	'Senior Principal Physiotherapist',	'SPPHY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(592,	'Senior Triage Specialist',	'STRI',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(596,	'Technical Analyst',	'TECHA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(598,	'Temporary Social Work Assistant',	'TSWA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(599,	'Temporary Speech Therapist',	'TSPT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(606,	'Visiting Senior Consultant',	'VSC',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'C',	NULL),
(644,	'Administrative Asst',	'ADMAST',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(679,	'Dental Asst',	'DENASS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(680,	'DRAMA THERAPIST',	'DTRP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(681,	'HEALTCARE ASSISTANT',	'HTCA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(682,	'LOCUM DIETITIAN',	'LDT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(683,	'LOCUM OCCUPATIONAL THERAPIST',	'LOT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(684,	'LOCUM PHYSIOTHERAPIST',	'LPHY',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(685,	'LOCUM SENIOR OCCUPATIONAL THERAPIST',	'LSOT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(686,	'LOCUM SENIOR RESIDENT PHYSICIAN',	'LSRP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'R',	NULL),
(687,	'NURSE CLINICIAN II',	'NCII',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(688,	'PROJECT ASSISTANT',	'PRJA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(689,	'SENIOR ACCOUNTANT / ACTING ASSISTANT MANAGER',	'SCAAM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(690,	'SOCIAL WORK ASSOCIATE',	'SWASS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(691,	'TEMP PATIENT SERVICE ASSOCIATE',	'TPSA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(520,	'Pharmacy Executive',	'PHAX',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(692,	'TEMPORARY COUNSELLOR',	'TCOUN',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(693,	'TEMPORARY DIETITIAN',	'TDIET',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(694,	'TEMPORARY HUMAN RESOURCE ASSISTANT',	'THRA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(601,	'Head & Senior Consultant',	'HSC',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'C',	NULL),
(573,	'Locum Music Therapist',	'LMCTH',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(458,	'Clinical Psychologist',	'CLPSY',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(695,	'TEMPORARY MEDICAL LABORATORY ASSISTANT',	'TMLA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(696,	'TEMPORARY MEDICAL TECHNOLOGIST',	'TMT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(697,	'TEMPORARY OCCUPATIONAL THERAPIST',	'TOT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(698,	'TEMPORARY PHARMACIST',	'TPHAR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(699,	'TEMPORARY PHARMACY ASSISTANT',	'TPASS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(700,	'TEMPORARY PHARMACY TECHNICIAN',	'TPTECH',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(701,	'TEMPORARY PHYSIOTHERAPIST',	'TPHY',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(702,	'TEMPORARY RESEARCH ASSISTANT',	'TRESA',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(703,	'Fellow',	'FW',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(737,	'Student',	'STU',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(738,	'ID Admin',	'IDAD',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(739,	'System Engineer',	'SYSE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(773,	'Music Therapist',	'MTPST',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(774,	'Temp Clerk',	'TCLK',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(775,	'Personal Assistant',	'PA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(776,	'Retail Supervisor',	'RTSUP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(778,	'Transition Care Nurse',	'TCNUR',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(780,	'Senior Technical Officer',	'STO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(781,	'Technical Officer',	'TO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(782,	'Care Assessor',	'CASS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(783,	'Security Officer',	'SECO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(785,	'Temp Medical Laboratory Assistant',	'TMLASS',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(779,	'EHS Officer',	'EHSO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(786,	'Case Manager',	'CMNR',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(787,	'Deputy Director',	'DDRT',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(788,	'Senior Sonographer',	'SSON',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(789,	'Diabetes Centre C44',	'DCC44',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(790,	'Admin Assistant',	'ADA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(823,	'DC Operator',	'DCO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(863,	'Business Office Associate',	'BOASS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(865,	'Industrial Designer',	'ID',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(866,	'Mailroom Clerk',	'MRC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(867,	'Senior Manager, Project',	'SMP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(868,	'Sonographer',	'SNGP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(869,	'Senior Podiatrist',	'SPDT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(870,	'Scientific Officer',	'STOFR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(878,	'Acp Admin Assistant (temp)',	'AAAT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(879,	'Principal Staff Physician',	'KPSP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(608,	'Technician',	'TECH',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(704,	'Principal Laboratory Technologist',	'PLT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(872,	'Demi Chef',	'DC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(874,	'Executive (Research & Evaluation)',	'ERE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(875,	'Material Coordinator',	'MCAMAM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(877,	'Assistant Manager / Acting Manager',	'AMAM',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(151,	'Principal Resident Physician',	'PRPHY',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(163,	'Resident Physician',	'RSPHY',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(856,	'Senior Resident',	'SNRD',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'R',	NULL),
(880,	'Business Office Assistant (temp)',	'BOAT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(883,	'Medical Officer (locum)',	'MOCRL',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(916,	'Traige Specialist',	'TGS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(920,	'Intern',	'Intern',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(918,	'Senior Staff Physician',	'SSP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'RS',	NULL),
(602,	'Head & Consultant',	'HC',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'C',	NULL),
(243,	'Clinical Associate',	'CA',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(923,	'Prinicpal Clinical Psychologist',	'PCP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(924,	'Visiting Specialist',	'VSP',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'C',	NULL),
(925,	'Dental Officer',	'DENO',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(926,	'Senior Dental Officer',	'SDENO',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'MO',	NULL),
(927,	'Service Registrar',	'SREG',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	'R',	NULL),
(915,	'Apn Intern',	'APNI',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(928,	'Behavioural Health Consultant',	'BHC',	'{{ hospital_id }}',	100,	'H',	'000000',	1,	NULL,	NULL),
(929,	'Director,corporate Development',	'CDIR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(930,	'Temp Secretary',	'TMPS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(931,	'Psychologist (student)',	'PS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(932,	'Prinicpal Respiratory Therapist',	'PRT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(933,	'Temp Business Office Assistant',	'TBOA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(934,	'Principal Respiratory Therapist',	'PRTH',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(935,	'Acountant',	'ACCNT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(936,	'Assistant Research Officer',	'ARO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(937,	'Radiologist',	'RDLG',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(940,	'Asst Nurse II',	'ASSN',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(941,	'Finance Assistant',	'FASS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(942,	'Project Executive',	'PE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(943,	'Pharmacy Student',	'PHS',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(945,	'Temp Executive',	'TE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(946,	'Director, Hr & Communications',	'DHRC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(949,	'Hota Coordinator',	'HTCD',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(950,	'Deputy Director Nursing',	'DDN',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(952,	'Special Project Coordinator',	'SPCRD',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(953,	'Senior Clinical Educator',	'SCE',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(954,	'Chairman Pa',	'CP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(955,	'Lead Nursing Operations',	'LNO',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(957,	'Chief',	'CHF',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(958,	'Operator',	'OPTR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(991,	'Chairman''s Pa',	'CHP',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(993,	'Assistant Lab Technologist',	'ALTEC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(995,	'Medical Lab Assistant',	'MDLA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(996,	'Research Executive',	'REX',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(997,	'Sr Executive',	'SREXEC',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(998,	'HR Executive',	'HREXEC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1000,	'Sr Consultant',	'SRCT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1001,	'Auditor',	'AUD',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1003,	'Pharmacist Student',	'PHSDT',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1005,	'Patient Relation Executive',	'PREXEC',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1006,	'Epidemiologist',	'EPD',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(1007,	'Acupuncturist',	'ACPTR',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1008,	'Dental Laboratory Technician',	'DLT',	'{{ hospital_id }}',	1000,	'H',	'000000',	1,	NULL,	NULL),
(1009,	'Deputy Chairman Medical Board',	'DCMB',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1013,	'Senior Specialist',	'SRS',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1012,	'Sr Administrative Asst',	'SRAA',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1043,	'Workplace Safety And Health Officer',	'WSAHO',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1045,	'Therapy Asst',	'THA',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1044,	'Project Manager',	'PRM',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1046,	'Medical Social Wroker',	'MESW',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1047,	'Director, Manpower & Communications',	'DMC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1048,	'Sr Accountant',	'SA',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1080,	'Chief Information Officer',	'CIO',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1081,	'Healthcare Asst',	'HAS',	'{{ hospital_id }}',	1000,	'H',	'000000',	1,	NULL,	NULL),
(1082,	'Facilitator',	'FAC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1083,	'Bioinformatician',	'BIN',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1084,	'Principal Medical Social Worker',	'PMSW',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1118,	'Hr Assistant',	'HRAST',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1119,	'Internship',	'INTSHP',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1120,	'Technical Service Manager',	'TSM',	'{{ hospital_id }}',	100,	'C',	'000000',	1,	NULL,	NULL),
(1121,	'Chief, It & Technology',	'CITT',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1122,	'Assistant Nurse Clinician',	'ANC',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1124,	'Assistant Director (nursing)',	'ASDN',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1123,	'Pharmacist (locum)',	'PHAL',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1126,	'Chairman',	'CHA',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1153,	'Orthoptist',	'ORTH',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1154,	'Collection Agents',	'COA',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1127,	'Director,Alexandra Health Institute And Director,Corporate Communications',	'DAHI',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1129,	'Director, Clinical Services',	'DCLS',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1130,	'Sr Kitchen Attendant',	'SKAT',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1131,	'Financial Care Officer',	'FICO',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1132,	'Advance Care Planning Facilitator',	'ACPF',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1133,	'Project Lead',	'PLE',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1134,	'Delivery Service Manager',	'DSM',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1135,	'Research Associate',	'RAS',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1136,	'Sr Research Officer',	'SROF',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1137,	'Nurse (temp)',	'NUTP',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1138,	'Stay Young Navigator',	'SYN',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1139,	'F & B Coordinator',	'FBC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1140,	'Principal It Specialist',	'PITS',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1141,	'Senior Care Coordinator',	'SCC',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1142,	'Senior Pharmacy Executive',	'SPE',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1143,	'Senior Principal Clinical Pharmacist',	'SPCP',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1144,	'Executive Housekeeper',	'EXH',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1145,	'Pre-reg Pharmacist',	'PRP',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1146,	'Sr Manager',	'SRM',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1147,	'Asst Director',	'ASSD',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1149,	'Senior Director',	'SED',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1150,	'Enrolled Nurse',	'ENN',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1151,	'Security Supervisor',	'SES',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1155,	'Pharmacy Asst',	'PAS',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1156,	'Acp Facilitator',	'ACPFA',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1157,	'Chief, Corporate Services',	'CCSE',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1158,	'Data Entry Coordinator',	'DEC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1159,	'Respiratory Therapy Assistant',	'RTAS',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1160,	'Chairman Of Board',	'COB',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1161,	'Dummy Id',	'DUID',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1162,	'Medical Social Work Associate',	'MSWA',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1164,	'Sr Dietitian',	'SRDT',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1165,	'Chairman, Pro-tem Planning Committee',	'CPPC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1166,	'Research Fellow',	'REFE',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1167,	'Coder',	'COD',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1168,	'Visting Consultant',	'VISC',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1169,	'Registry Coordinator',	'ERCO',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1170,	'Principal Dietitian',	'PRDI',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1171,	'Group Chief Human Resource Officer',	'GCHRO',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1173,	'Chief Nurse',	'CHNU',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1174,	'Deputy Director, Operations',	'DEDO',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1175,	'Chief Transformation Officer & Senior Consultant',	'CTOSC',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1176,	'Senior Staff Nurse I',	'SSN1',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1177,	'Manager, Alexandra Health Institute',	'MAHI',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(1178,	'Deputy Director Of Nursing',	'DDON',	'{{ hospital_id }}',	1000,	'C',	'000000',	1,	NULL,	NULL),
(1179,	'Senior Systems Specialist',	'SESS',	'{{ hospital_id }}',	1000,	'A',	'000000',	1,	NULL,	NULL),
(29,	'Accounts Assistant',	'ACCA',	'{{ hospital_id }}',	100,	'A',	'000000',	1,	NULL,	NULL),
(1128,	'Intern Student',	'IST',	'{{ hospital_id }}',	1000,	'A',	'09f548',	1,	NULL,	NULL);

DROP TABLE IF EXISTS "hms_domain";
CREATE TABLE "public"."hms_domain" (
    "hospitalid" integer NOT NULL,
    "domain" character varying(50) NOT NULL,
    "position" integer NOT NULL,
    CONSTRAINT "hms_domain_pkey" PRIMARY KEY ("hospitalid")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_hospital";
CREATE TABLE "public"."hms_hospital" (
    "hospitalid" integer NOT NULL,
    "hospitalcode" character varying(50) NOT NULL,
    "hospitalname" character varying(50) NOT NULL,
    "logo_file" character varying(50),
    "support_dept_id" integer NOT NULL,
    "support_email" character varying(50) NOT NULL,
    "client_features" character varying,
    "country_id" integer,
    "oncall_time" character varying,
    "status" integer DEFAULT '1' NOT NULL,
    "domain_code" character varying(50),
    "jid_domain" character varying(50),
    "shared_domain" text,
    CONSTRAINT "hms_hospital_pkey" PRIMARY KEY ("hospitalid")
) WITH (oids = false);

INSERT INTO "hms_hospital" ("hospitalid", "hospitalcode", "hospitalname", "logo_file", "support_dept_id", "support_email", "client_features", "country_id", "oncall_time", "status", "domain_code", "jid_domain", "shared_domain") VALUES
({{ hospital_id }},	'{{ hospital | upper }}',	'{{ hospital_name }} HOSPITAL',	'{{ hospital }}_logo.png',	1,	'{{ hospital_support_email }}',	NULL,	1,	NULL,	1,	'{{ hospital | upper }}',	'{{ hospital }}.com.sg',	NULL);

DROP TABLE IF EXISTS "hms_ldap_common_account";
CREATE TABLE "public"."hms_ldap_common_account" (
    "id" integer NOT NULL,
    "username" character varying(100) NOT NULL,
    "system_acct" smallint DEFAULT '1'
) WITH (oids = false);

DROP TABLE IF EXISTS "hms_lab";
DROP SEQUENCE IF EXISTS hms_lab_lab_id_seq;
CREATE SEQUENCE hms_lab_lab_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_lab" (
    "lab_id" integer DEFAULT nextval('hms_lab_lab_id_seq') NOT NULL,
    "hospital_id" integer NOT NULL,
    "lab_name" character varying NOT NULL,
    "lab_type" character varying NOT NULL,
    "extension" character varying(20),
    "position" integer,
    "lab_code" character varying(10),
    CONSTRAINT "hms_lab_pkey" PRIMARY KEY ("lab_id")
) WITH (oids = false);

INSERT INTO "hms_lab" ("lab_id", "hospital_id", "lab_name", "lab_type", "extension", "position", "lab_code") VALUES
(1,	{{ hospital_id }},	'Biochemistry',	'non-microbiology',	NULL,	1,	'GL'),
(2,	{{ hospital_id }},	'TDM',	'non-microbiology',	NULL,	2,	'GL'),
(5,	{{ hospital_id }},	'Microbiology',	'microbiology',	NULL,	5,	'MB'),
(4,	{{ hospital_id }},	'Hematology',	'non-microbiology',	NULL,	4,	'GL'),
(3,	{{ hospital_id }},	'Coagulation',	'non-microbiology',	NULL,	3,	'GL'),
(6,	{{ hospital_id }},	'Radiology',	'non-microbiology',	NULL,	6,	'RAD');

DROP TABLE IF EXISTS "hms_labrad_filter_ref";
DROP SEQUENCE IF EXISTS hms_labrad_filter_ref_filter_ref_id_seq;
CREATE SEQUENCE hms_labrad_filter_ref_filter_ref_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_labrad_filter_ref" (
    "filter_ref_id" integer DEFAULT nextval('hms_labrad_filter_ref_filter_ref_id_seq') NOT NULL,
    "hospital_id" integer NOT NULL,
    "lab_id" integer NOT NULL,
    "filter" character varying(100) NOT NULL,
    "filter_value" character varying(100),
    "filter_unit" character varying(50),
    "result_sample" text,
    "filter_code" character varying(20),
    "cui" character varying(8),
    "position" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "filter_ref_unique_check" UNIQUE ("hospital_id", "lab_id", "filter", "filter_code")
) WITH (oids = false);

INSERT INTO "hms_labrad_filter_ref" ("filter_ref_id", "hospital_id", "lab_id", "filter", "filter_value", "filter_unit", "result_sample", "filter_code", "cui", "position") VALUES
(281,	{{ hospital_id }},	1,	'Sample Test 123',	'5.0',	'ml',	NULL,	'SAMP123',	NULL,	1),
(1,	{{ hospital_id }},	1,	'Sodium',	'135-145',	'mmol/L',	NULL,	'NA',	NULL,	1),
(2,	{{ hospital_id }},	1,	'Potassium',	'3.5-5.1',	'mmol/L',	NULL,	'K',	NULL,	1),
(3,	{{ hospital_id }},	1,	'Glucose',	'3.0-6.0',	'mmol/L',	NULL,	'GLU',	NULL,	1),
(4,	{{ hospital_id }},	1,	'Glucose, Fluoride',	'<11.1',	'mmol/L',	NULL,	'GLUF',	NULL,	1),
(6,	{{ hospital_id }},	2,	'Acetominophen',	'0-200',	'mg/L',	NULL,	'ACMP',	NULL,	1),
(7,	{{ hospital_id }},	2,	'Amikacin',	NULL,	'mg/L',	NULL,	'AMIK',	NULL,	1),
(8,	{{ hospital_id }},	2,	'Amikacin, Peak',	'20.0-25.0',	'mg/L',	NULL,	'AMIP',	NULL,	1),
(9,	{{ hospital_id }},	2,	'Amikacin, Trough',	'5.0-10.0',	'mg/L',	NULL,	'AMIT',	NULL,	1),
(10,	{{ hospital_id }},	2,	'Digoxin',	'0.8-2.0',	'&#956;g/L',	NULL,	'DIGX',	NULL,	1),
(11,	{{ hospital_id }},	2,	'Gentamicin',	NULL,	'mg/L',	NULL,	'GEN',	NULL,	1),
(12,	{{ hospital_id }},	2,	'Gentamicin, Peak',	'6.0-10.0',	'mg/L',	NULL,	'GENP',	NULL,	1),
(13,	{{ hospital_id }},	2,	'Gentamicin, Trough',	'0.5-2.0',	'mg/L',	NULL,	'GENT',	NULL,	1),
(14,	{{ hospital_id }},	2,	'Phenobarbital',	'15-40',	'mg/L',	NULL,	'PHNB',	NULL,	1),
(15,	{{ hospital_id }},	2,	'Phenytoin',	'15-20',	'mg/L',	NULL,	'PHNT',	NULL,	1),
(16,	{{ hospital_id }},	2,	'Salicylate',	'0-300',	'mg/L',	NULL,	'SAL',	NULL,	1),
(17,	{{ hospital_id }},	2,	'Theophylline',	'10.0-20.0',	'mg/L',	NULL,	'THEO',	NULL,	1),
(19,	{{ hospital_id }},	2,	'Vancomycin',	NULL,	'mg/L',	NULL,	'VAN',	NULL,	1),
(20,	{{ hospital_id }},	2,	'Vancomycin, Peak',	'25.0-40.0',	'mg/L',	NULL,	'VANP',	NULL,	1),
(21,	{{ hospital_id }},	2,	'Vancomycin, Trough',	'5.0-10.0',	'mg/L',	NULL,	'VANT',	NULL,	1),
(22,	{{ hospital_id }},	3,	'Activated Partial Thromboplastin Time',	'23.4-36.6',	'seconds',	NULL,	'APTT',	NULL,	1),
(23,	{{ hospital_id }},	3,	'International Normalisation Ratio',	'Prophylaxis for DVT 2.0-2.5, Treatment for DVT or PE, 2.0-3.0, Recurrent DVT or PE 3.0-4.5',	NULL,	NULL,	'INR',	NULL,	1),
(24,	{{ hospital_id }},	4,	'Hemoglobin',	'Male: 13.0-17.0, Female: 11.5-15.0',	'g/dL',	NULL,	'HB',	NULL,	1),
(25,	{{ hospital_id }},	4,	'Platelets',	'130-400',	'x 10^9/L',	NULL,	'PLT',	NULL,	1),
(26,	{{ hospital_id }},	4,	'White Blood Cells',	'4.0-11.0',	'x 10^9/L',	NULL,	'WBC',	NULL,	1),
(28,	{{ hospital_id }},	4,	'Malaria Parasite',	'NSEEN',	NULL,	NULL,	'MPME',	NULL,	1),
(18,	{{ hospital_id }},	2,	'Valproate',	'50-100',	'mg/L',	NULL,	'VALP',	NULL,	1),
(27,	{{ hospital_id }},	4,	'Neutrophils',	'2.0-7.5',	'x 10^9/L',	NULL,	'NEU',	NULL,	1),
(30,	{{ hospital_id }},	1,	'Calcium Corrected',	'2.10-2.55',	'mmol/L',	NULL,	'CAC',	NULL,	1),
(5,	{{ hospital_id }},	1,	'Calcium',	'2.10-2.55',	'mmol/L',	NULL,	'CA',	NULL,	1),
(31,	{{ hospital_id }},	4,	'Neutrophils',	'2.0-7.5',	'x 10^9/L',	NULL,	'NEUM',	NULL,	1),
(29,	{{ hospital_id }},	5,	'Acid Fast Bacilli',	NULL,	NULL,	NULL,	'VAFB',	NULL,	1),
(54,	{{ hospital_id }},	5,	'Organism',	NULL,	NULL,	NULL,	'ORG',	NULL,	-1),
(55,	{{ hospital_id }},	6,	'Radiology',	NULL,	NULL,	NULL,	'RAD',	NULL,	1),
(56,	{{ hospital_id }},	4,	'Fragmented RBC',	'NSEEN',	NULL,	NULL,	'FRBC',	NULL,	1),
(57,	{{ hospital_id }},	4,	'Platelets, Citrate',	'130-400',	'x 10^9/L',	NULL,	'PLTC',	NULL,	1),
(58,	{{ hospital_id }},	1,	'Serum Bicarbonate',	NULL,	'mmol/L',	NULL,	'CO2',	NULL,	1),
(59,	{{ hospital_id }},	2,	'Lithium',	NULL,	'mmol/L',	NULL,	'LI',	NULL,	1),
(61,	{{ hospital_id }},	4,	'Blast',	'',	'x 10^9/L',	NULL,	'BL',	NULL,	1),
(62,	{{ hospital_id }},	4,	'Promyelocytes',	'',	'x 10^9/L',	NULL,	'P',	NULL,	1),
(63,	{{ hospital_id }},	3,	'Fibrinogen',	'',	'g/L',	NULL,	'FIB',	NULL,	1),
(60,	{{ hospital_id }},	1,	'pH, Arterial',	'',	'',	NULL,	'PH',	NULL,	1);

DROP TABLE IF EXISTS "module_config";
DROP SEQUENCE IF EXISTS module_config_id_seq;
CREATE SEQUENCE module_config_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."module_config" (
    "id" integer DEFAULT nextval('module_config_id_seq') NOT NULL,
    "module_id" integer,
    "title" character varying,
    "hospital_id" integer,
    "entity_template_id" bigint,
    "url" text,
    "permission" character varying,
    "status" smallint,
    "type" character varying,
    CONSTRAINT "module_config_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "module_config" ("id", "module_id", "title", "hospital_id", "entity_template_id", "url", "permission", "status", "type") VALUES
(151,	118,	'Web Directory (Enhanced)',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4,6,8,13',	1,	NULL),
(111,	3,	'Monthly Roster Template',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(206,	171,	'Critical Result Settings',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(207,	172,	'Critical Result Settings - CRR Exclusion & Auto Closure',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(208,	173,	'Doctor-in-Charge Map',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(173,	131,	'Critical Result Settings - Radiologist',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(121,	2,	'Non-Doctor',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(177,	132,	'Web Directory Template',	{{ hospital_id }},	NULL,	NULL,	'6,7',	1,	NULL),
(115,	11,	'Critical Result Settings - Result Filter',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(117,	33,	'Critical Result Settings - Routing Rules',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(118,	34,	'Critical Result Settings - Message Configuration',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(172,	130,	'Profile Picture',	{{ hospital_id }},	NULL,	NULL,	'1,3,9',	1,	NULL),
(164,	122,	'2-Way Appointment Reminder - Appointments',	{{ hospital_id }},	NULL,	NULL,	'1,6',	1,	NULL),
(120,	7,	'Incoming/Outgoing Message Log',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(122,	1,	'Doctor',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,6',	1,	NULL),
(123,	10,	'Doctor Proxy',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(124,	31,	'User Name',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(125,	32,	'User Role',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(126,	13,	'Privacy Setting',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(127,	22,	'Sub-Department',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(128,	27,	'User Location',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(129,	36,	'Document Repository',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(142,	60,	'1-way SMS - Messaging',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(174,	61,	'1-Way SMS - View Messages',	{{ hospital_id }},	NULL,	NULL,	'1,6',	1,	NULL),
(175,	62,	'1-Way SMS - Advanced View Messages',	{{ hospital_id }},	NULL,	NULL,	'1,6',	1,	NULL),
(176,	63,	'1-Way SMS - Predefined Message',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(112,	21,	'Department',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(113,	25,	'User Designation',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(114,	4,	'Monthly Roster Entry',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(116,	15,	'Critical Results',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(119,	9,	'SMS Usage Statistics',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(130,	5,	'Daily On Call Entry',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(131,	12,	'Daily On Call Template',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(132,	14,	'Pre-defined Message (Basic)',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(133,	50,	'Pre-defined Message (E-broadcast)',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(134,	37,	'Patient Appointment Reminder',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(135,	42,	'Mobile Reconciliation',	{{ hospital_id }},	NULL,	NULL,	'1,3,6',	1,	NULL),
(136,	43,	'Profile Reconciliation',	{{ hospital_id }},	NULL,	NULL,	'1,3,6',	1,	NULL),
(137,	44,	'AD Sync',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(138,	46,	'Roster Reconciliation',	{{ hospital_id }},	NULL,	NULL,	'1,6',	1,	NULL),
(139,	56,	'Login Access',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(144,	101,	'Clinical Mode CRR LIS Access',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(145,	102,	'Clinical Mode CRR RIS Access',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(146,	103,	'Clinical Mode CRR ECG Access',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(147,	104,	'Clinical Mode CRR Lab Function',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(148,	105,	'Clinical Mode CRR Operator Function',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(149,	106,	'Clinical Mode CRR VIP Handling Function',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(150,	107,	'Clinical Mode CRR Epid Handling Function',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(152,	109,	'Ebroadcast Access',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(153,	113,	'Clinical Mode ARR Access',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(154,	108,	'Messaging Access',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(155,	110,	'Messaging Broadcast Recipient Limit',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(156,	111,	'eBroadcast Broadcast Recipient Limit',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(157,	114,	'Messaging Broadcast Recipient Extended Limit',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(158,	115,	'Ebroadcast Broadcast Recipient Extended Limit',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(159,	41,	'CRR TAT Report',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(160,	119,	'Clinical Mode Writeback',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(161,	116,	'Clinical Mode CRR Rad Operator Function',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(162,	120,	'Monthly Roster List',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(168,	126,	'Outgoing SMS',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(169,	127,	'Incoming SMS',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(171,	129,	'User Role Assignment',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(170,	128,	'Module Permission',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(165,	123,	'2-Way Appointment Reminder - Message Templates',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(166,	124,	'2-Way Appointment Reminder - SMS Response',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(167,	125,	'2-Way Appointment Reminder - Reports',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(178,	133,	'Manual Intervention Protocol Entry',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(179,	134,	'Manual Intervention Protocol Template',	{{ hospital_id }},	NULL,	NULL,	'3',	1,	NULL),
(180,	135,	'Section',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(182,	137,	'Daily Roster Permission',	{{ hospital_id }},	NULL,	NULL,	'3',	1,	NULL),
(183,	138,	'Critical Results Dashboard',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(184,	139,	'BBR Config Admin',	{{ hospital_id }},	NULL,	NULL,	'3',	1,	NULL),
(185,	140,	'BBR External Users Directory View',	{{ hospital_id }},	NULL,	NULL,	'2,3,4',	1,	NULL),
(186,	141,	'Self Learn',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(188,	143,	'Contact Verification',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(189,	144,	'External Contact',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(190,	145,	'Non-Doctor Proxy',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL),
(191,	146,	'BBR Config Basic - Category',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(192,	147,	'BBR Config Basic - Result Filter',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(193,	148,	'BBR Config Basic - Routing Rule',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(194,	149,	'BBR Config Basic - Message Template',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(195,	150,	'BBR Config Basic - Group',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(196,	151,	'BBR Config Basic - Shift',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(197,	152,	'BBR Clinical Mode View',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(198,	153,	'BBR Config Basic - Report',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(199,	154,	'BBR Config Basic - Settings',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(200,	155,	'ADID Away status Access',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(201,	166,	'On Call Roster For The Day Template',	{{ hospital_id }},	NULL,	NULL,	'3',	1,	NULL),
(202,	167,	'On Call Roster For The Day Entry',	{{ hospital_id }},	NULL,	NULL,	'3',	1,	NULL),
(203,	168,	'Clinical Dashboard',	{{ hospital_id }},	NULL,	NULL,	'1,2,4',	1,	NULL),
(204,	169,	'BBR Knowledgebase',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(205,	170,	'Critical Result Settings - RAD Display Priority Mapping',	{{ hospital_id }},	NULL,	NULL,	'1',	1,	NULL),
(181,	136,	'CRR Manual Intervention Setting',	{{ hospital_id }},	NULL,	NULL,	'1,3',	1,	NULL),
(187,	142,	'BBR Settings',	{{ hospital_id }},	NULL,	NULL,	'1,2,3,4',	1,	NULL);

DROP TABLE IF EXISTS "module_list";
DROP SEQUENCE IF EXISTS module_list_id_seq;
CREATE SEQUENCE module_list_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."module_list" (
    "id" integer DEFAULT nextval('module_list_id_seq') NOT NULL,
    "title" character varying,
    "status" smallint,
    "actions" character varying(100),
    "url" character varying(255),
    "default_" smallint DEFAULT '0' NOT NULL,
    "menu_id" integer,
    "superadmin" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "module_list_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "module_list" ("id", "title", "status", "actions", "url", "default_", "menu_id", "superadmin") VALUES
(170,	'RAD Display Priority Mapping',	1,	'1,2,3,4',	'clinical/v2/rad-display-priority-map',	0,	NULL,	0),
(118,	'Web Directory (Enhanced)',	1,	'1,2,3,4,6,8,13',	NULL,	0,	NULL,	0),
(3,	'Monthly Roster - Template',	1,	'1,2,3,4',	'roster-template/create/start',	0,	NULL,	0),
(171,	'Critical Result Settings',	1,	'1',	'clinical/settings-router',	0,	NULL,	0),
(172,	'Critical Result Settings - CRR Exclusion & Auto Closure',	1,	'1,2,3,4',	'clinical/v2/crr-exclusion-and-auto-closure',	0,	NULL,	0),
(173,	'Doctor-in-Charge Map',	1,	'1,2,3,4',	'roster/v2/doctor-in-charge',	0,	NULL,	0),
(131,	'Critical Result Settings - Radiologist',	1,	'1,2,3,4',	'clinical/radiologist-list',	0,	NULL,	0),
(132,	'Web Directory Template',	1,	'6,7',	'web-directory',	0,	NULL,	0),
(130,	'Profile Picture',	1,	'1,3,9',	NULL,	0,	NULL,	0),
(123,	'2-Way Appointment Reminder - Message Templates',	1,	'1,2,3,4',	'sms-service/msg-templates',	0,	NULL,	0),
(46,	'Roster Reconciliation',	1,	'1,6',	NULL,	0,	NULL,	0),
(56,	'Login Access',	1,	'1,3',	NULL,	0,	NULL,	0),
(101,	'Clinical Mode CRR LIS Access',	1,	'1',	NULL,	0,	NULL,	0),
(102,	'Clinical Mode CRR RIS Access',	1,	'1',	NULL,	0,	NULL,	0),
(103,	'Clinical Mode CRR ECG Access',	1,	'1',	NULL,	0,	NULL,	0),
(104,	'Clinical Mode CRR Lab Function',	1,	'1',	NULL,	0,	NULL,	0),
(105,	'Clinical Mode CRR Operator Function',	1,	'1',	NULL,	0,	NULL,	0),
(106,	'Clinical Mode CRR VIP Handling Function',	1,	'1',	NULL,	0,	NULL,	0),
(107,	'Clinical Mode CRR Epid Handling Function',	1,	'1',	NULL,	0,	NULL,	0),
(33,	'Clinical Settings - Routing Rules',	1,	'1,2,3,4',	'clinical/routing-rules',	0,	NULL,	0),
(21,	'Department',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(25,	'User Designation',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(4,	'Monthly Roster Entry',	1,	'1,3',	NULL,	0,	NULL,	0),
(15,	'Critical Results',	1,	'1,3',	NULL,	0,	NULL,	0),
(9,	'SMS Usage Statistics',	1,	'1',	NULL,	0,	NULL,	0),
(7,	'Incoming/Outgoing Message Log',	1,	'1',	NULL,	0,	NULL,	0),
(1,	'Doctor',	1,	'1,2,3,6',	NULL,	0,	NULL,	0),
(10,	'Doctor Proxy',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(31,	'User Name',	1,	'1,3',	NULL,	0,	NULL,	0),
(32,	'User Role',	1,	'1,3',	NULL,	0,	NULL,	0),
(13,	'Privacy Setting',	1,	'1,3',	NULL,	0,	NULL,	0),
(22,	'Sub-Department',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(27,	'User Location',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(36,	'Document Repository',	1,	'1',	NULL,	0,	NULL,	0),
(5,	'Daily On Call Entry',	1,	'1,3',	NULL,	0,	NULL,	0),
(12,	'Daily On Call Template',	1,	'1,3',	NULL,	0,	NULL,	0),
(14,	'Pre-defined Message (Basic)',	1,	'1',	NULL,	0,	NULL,	0),
(50,	'Pre-defined Message (E-broadcast)',	1,	'1',	NULL,	0,	NULL,	0),
(37,	'Patient Appointment Reminder',	1,	'1',	NULL,	0,	NULL,	0),
(42,	'Mobile Reconciliation',	1,	'1,3,6',	NULL,	0,	NULL,	0),
(43,	'Profile Reconciliation',	1,	'1,3,6',	NULL,	0,	NULL,	0),
(44,	'AD Sync',	1,	'1',	NULL,	0,	NULL,	0),
(109,	'Ebroadcast Access',	1,	'1,3',	NULL,	0,	NULL,	0),
(113,	'Clinical Mode ARR Access',	1,	'1',	NULL,	0,	NULL,	0),
(108,	'Messaging Access',	1,	'1,3',	NULL,	0,	NULL,	0),
(110,	'Messaging Broadcast Recipient Limit',	1,	'1',	NULL,	0,	NULL,	0),
(111,	'eBroadcast Broadcast Recipient Limit',	1,	'1',	NULL,	0,	NULL,	0),
(114,	'Messaging Broadcast Recipient Extended Limit',	1,	'1',	NULL,	0,	NULL,	0),
(115,	'Ebroadcast Broadcast Recipient Extended Limit',	1,	'1',	NULL,	0,	NULL,	0),
(41,	'CRR TAT Report',	1,	'1',	NULL,	0,	NULL,	0),
(119,	'Clinical Mode Writeback',	1,	'1',	NULL,	0,	NULL,	0),
(116,	'Clinical Mode CRR Rad Operator Function',	1,	'1',	NULL,	0,	NULL,	0),
(120,	'Monthly Roster List',	1,	'1,2,3,4',	'roster-list',	0,	NULL,	0),
(126,	'Outgoing SMS',	1,	'1,2,3,4',	'messages/outgoing-sms',	0,	NULL,	0),
(127,	'Incoming SMS',	1,	'1,2,3,4',	'messages/incoming-sms',	0,	NULL,	0),
(129,	'User Role Assignment',	1,	'1,2,3,4',	'role/users',	0,	NULL,	0),
(128,	'Module Permission',	1,	'1,3',	'permission/roles',	0,	NULL,	0),
(2,	'Non-Doctor',	1,	'1,2,3,4,6',	NULL,	0,	NULL,	0),
(122,	'2-Way Appointment Reminder - Appointments',	1,	'1',	'sms-service/soc',	0,	NULL,	0),
(124,	'2-Way Appointment Reminder - SMS Response',	1,	'1,3',	'sms-service/sms-response',	0,	NULL,	0),
(125,	'2-Way Appointment Reminder - Reports',	1,	'1,3',	'sms-service/reports-recipient',	0,	NULL,	0),
(60,	'1-way SMS - Messaging',	1,	'1',	'sms-service/1-way-sms',	0,	NULL,	0),
(61,	'1-Way SMS - View Messages',	1,	'1,6',	'sms-service/1-way-sms',	0,	NULL,	0),
(62,	'1-Way SMS - Advanced View Messages',	1,	'1,6',	'sms-service/1-way-sms',	0,	NULL,	0),
(63,	'1-Way SMS - Pre-defined Message',	1,	'1,2,3,4',	'sms-service/1-way-sms',	0,	NULL,	0),
(11,	'Clinical Settings - Result Filter',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(34,	'Clinical Settings - Message Configuration',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(133,	'Manual Intervention Protocol Entry',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(134,	'Manual Intervention Protocol Template',	1,	'3',	NULL,	0,	NULL,	0),
(135,	'Section',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(137,	'Daily Roster Permission',	1,	'3',	NULL,	0,	NULL,	0),
(138,	'Critical Results Dashboard',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(139,	'BBR Config Admin',	1,	'3',	NULL,	0,	NULL,	0),
(140,	'BBR External Users Directory View',	1,	'2,3,4',	NULL,	0,	NULL,	0),
(141,	'Self Learn',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(143,	'Contact Verification',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(144,	'External Contact',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(145,	'Non-Doctor Proxy',	1,	'1,2,3,4',	NULL,	0,	NULL,	0),
(146,	'BBR Config Basic - Category',	1,	'1',	NULL,	0,	NULL,	0),
(147,	'BBR Config Basic - Result Filter',	1,	'1',	NULL,	0,	NULL,	0),
(148,	'BBR Config Basic - Routing Rule',	1,	'1',	NULL,	0,	NULL,	0),
(149,	'BBR Config Basic - Message Template',	1,	'1',	NULL,	0,	NULL,	0),
(150,	'BBR Config Basic - Group',	1,	'1',	NULL,	0,	NULL,	0),
(151,	'BBR Config Basic - Shift',	1,	'1',	NULL,	0,	NULL,	0),
(152,	'BBR Clinical Mode View',	1,	'1',	NULL,	0,	NULL,	0),
(153,	'BBR Config Basic - Report',	1,	'1',	NULL,	0,	NULL,	0),
(154,	'BBR Config Basic - Settings',	1,	'1',	NULL,	0,	NULL,	0),
(155,	'ADID Away status Access',	1,	'1',	NULL,	0,	NULL,	0),
(166,	'On Call Roster For The Day Template',	1,	'3',	NULL,	0,	NULL,	0),
(167,	'On Call Roster For The Day Entry',	1,	'3',	NULL,	0,	NULL,	0),
(168,	'Clinical Dashboard',	1,	'1,2,4',	'dashboard/v2',	0,	NULL,	0),
(169,	'BBR Knowledgebase',	1,	'1',	'configuration/v2/bbr-knowledgebase-procedure',	0,	NULL,	0),
(136,	'CRR Manual Intervention Setting',	1,	'1,3',	NULL,	0,	NULL,	0),
(142,	'BBR Settings',	1,	'1,2,3,4',	NULL,	0,	NULL,	0);

DROP TABLE IF EXISTS "vcard";
CREATE TABLE "public"."vcard" (
    "jid" character varying(50) NOT NULL,
    "role" character varying(30) NOT NULL,
    "password" character varying(50) NOT NULL,
    "email" character varying(50),
    "nickname" character varying(100),
    "xmlstanza" text,
    "note" character varying(50),
    CONSTRAINT "vcard_pkey" PRIMARY KEY ("jid")
) WITH (oids = false);

INSERT INTO "vcard" ("jid", "role", "password", "email", "nickname", "xmlstanza", "note") VALUES
('{{ hospital }}admin@{{ hospital }}.com.sg',	'user',	'password',	'',	'{{ hospital | upper }} Administrator',	NULL,	'system');

INSERT INTO "vcard" ("jid", "role", "password", "email", "nickname", "xmlstanza", "note") VALUES
('hmssystem@{{ hospital }}.com.sg',	'user',	'password',	'',	'HMS System',	NULL,	'system');

DROP TABLE IF EXISTS "vcard_details";
CREATE TABLE "public"."vcard_details" (
    "jid" character varying(50) NOT NULL,
    "departmentid" integer,
    "hospitalid" integer NOT NULL,
    "status" character varying(10) DEFAULT 'active' NOT NULL,
    "last_login_date" timestamp,
    "operating_system" character varying(50),
    "java_version" character varying(20),
    "hms_version" character varying(10),
    "user_group_id" integer,
    "username" character varying(100),
    "password" character varying(50),
    "password_validity" integer DEFAULT '0' NOT NULL,
    "employee_no" character varying(20),
    "web_module_access" character varying,
    "ad_sync" integer DEFAULT '1' NOT NULL,
    "login_access" integer DEFAULT '0' NOT NULL,
    "mask_mobile" integer DEFAULT '0' NOT NULL,
    "remember_token" character varying,
    "last_invite_date" timestamp,
    "profile_avatar" bytea,
    "system_flag" integer DEFAULT '0' NOT NULL,
    "publish" smallint DEFAULT '1' NOT NULL,
    "img_name" character varying,
    "inactive_from" date,
    "inactive_to" date,
    "away_flag" integer,
    "description" character varying,
    "hospital" character varying,
    CONSTRAINT "hospital_username_unique_check" UNIQUE ("hospitalid", "username"),
    CONSTRAINT "vcard_details_jid_index" UNIQUE ("jid"),
    CONSTRAINT "vcard_details_pkey" PRIMARY KEY ("jid")
) WITH (oids = false);

INSERT INTO "vcard_details" ("jid", "departmentid", "hospitalid", "status", "last_login_date", "operating_system", "java_version", "hms_version", "user_group_id", "username", "password", "password_validity", "employee_no", "web_module_access", "ad_sync", "login_access", "mask_mobile", "remember_token", "last_invite_date", "profile_avatar", "system_flag", "publish", "img_name", "inactive_from", "inactive_to", "away_flag", "description", "hospital") VALUES
('{{ hospital }}admin@{{ hospital }}.com.sg',	1,	{{ hospital_id | default(1) }},	'active',	'now()',	NULL,	NULL,	NULL,	1,	'{{ hospital | upper }}ADMIN',	'fb962b825eb196520888ac7f3220b32f',	0,	'',	NULL,	0,	1,	0,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

INSERT INTO "vcard_details" ("jid", "departmentid", "hospitalid", "status", "last_login_date", "operating_system", "java_version", "hms_version", "user_group_id", "username", "password", "password_validity", "employee_no", "web_module_access", "ad_sync", "login_access", "mask_mobile", "remember_token", "last_invite_date", "profile_avatar", "system_flag", "publish", "img_name", "inactive_from", "inactive_to", "away_flag", "description", "hospital") VALUES
('hmssystem@{{ hospital }}.com.sg',	-1,	{{ hospital_id | default(1) }},	'active',	NULL,	NULL,	NULL,	NULL,	1000,	'hmssystem',	'password',	0,	'hmssystem',	NULL,	0,	0,	0,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

CREATE INDEX "vcard_details_login_access_index" ON "public"."vcard_details" USING btree ("login_access");

CREATE INDEX "vcard_details_status_index" ON "public"."vcard_details" USING btree ("status");

COMMENT ON COLUMN "public"."vcard_details"."status" IS 'active or inactive';

COMMENT ON COLUMN "public"."vcard_details"."password_validity" IS '0 = expired; 1 = valid';

DROP TABLE IF EXISTS "routes";
DROP SEQUENCE IF EXISTS routes_id_seq;
CREATE SEQUENCE routes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."routes" (
    "id" integer DEFAULT nextval('routes_id_seq') NOT NULL,
    "module_id" integer NOT NULL,
    "permission_action" smallint,
    "method" character varying(50),
    "middleware" character varying(500),
    "url" character varying(500),
    "params" character varying(500),
    "namespace" character varying(500),
    "controller" character varying(500),
    "name" character varying(500),
    "created_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    "updated_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    CONSTRAINT "routes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "routes" ("id", "module_id", "permission_action", "method", "middleware", "url", "params", "namespace", "controller", "name", "created_at", "updated_at") VALUES
(18,	126,	1,	'get',	'auth',	'messages/outgoing-sms',	NULL,	'Frontend',	'MessageController@getOutgoingSMS',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(19,	127,	1,	'get',	'auth',	'messages/incoming-sms',	NULL,	'Frontend',	'MessageController@getIncomingSMS',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(20,	9,	1,	'get',	'auth',	'sms-stat/sender',	'{monthYear?}',	'Frontend',	'SmsStatisticsController@index',	'sms-sender',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(21,	109,	1,	'get',	'auth',	'e-broadcast',	NULL,	'Frontend',	'EbroadcastController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(1,	118,	1,	'get',	NULL,	'web-directory',	NULL,	'Frontend',	'WebDirectoryController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(2,	43,	1,	'get',	'auth',	'profile-reconciliation',	NULL,	'Frontend',	'ProfileReconciliationController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(3,	42,	1,	'get',	'auth',	'mobile-recon',	NULL,	'Frontend',	'MobileReconciliationController@index',	'mobile-recon-list',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(4,	46,	1,	'get',	'auth',	'roster-recon',	NULL,	'Frontend',	'RosterReconciliationController@index',	'rr-index',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(5,	10,	1,	'get',	'auth',	'doctor-proxy',	NULL,	'Frontend',	'DoctorProxyController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(6,	2,	1,	'get',	'auth',	'non-doctor-proxy',	NULL,	'Frontend',	'NonDoctorProxyController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(9,	36,	1,	'get',	'auth',	'roster-document/upload',	NULL,	'Frontend',	'DocumentRepositoryController@fileUpload',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(10,	121,	1,	'get',	NULL,	'daily-on-call',	NULL,	'Frontend',	'DailyOnCallController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(15,	15,	1,	'get',	'auth',	'clinical',	NULL,	'Frontend',	'ClinicalResultController@index',	'clinical',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(16,	11,	1,	'get',	'auth',	'clinical/result-filter',	NULL,	'Frontend',	'ClinicalResultFilterController@index',	'result-filter',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(22,	108,	1,	'get',	'auth',	'messages',	NULL,	'Frontend',	'MessageController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(23,	128,	1,	'get',	'auth',	'permission/roles',	NULL,	'Frontend',	'UserGroupPermissionController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(24,	129,	1,	'get',	'auth',	'role/users',	NULL,	'Frontend',	'UserGroupController@index',	'',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(8,	4,	1,	'get',	'auth',	'roster/entry',	NULL,	'Frontend',	'RosterController@rosterEntry',	'roster-entry',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(25,	27,	1,	'get',	'auth',	'user-location',	NULL,	'Frontend',	'UserLocationController@index',	'',	'2020-08-05 12:11:37.091967',	'2020-08-05 12:11:37.091967'),
(27,	120,	1,	'get',	NULL,	'roster-list',	'{date?}/{hospital_id?}',	'Frontend',	'RosterListController@index',	'roster-list',	'2020-08-12 09:53:23.916878',	'2020-08-12 09:53:23.916878'),
(28,	118,	1,	'get',	NULL,	'web-directory',	NULL,	'Frontend',	'WebDirectoryController@index',	'',	'2020-08-12 09:53:40.935366',	'2020-08-12 09:53:40.935366'),
(29,	128,	1,	'get',	'auth',	'permission/roles',	'{userGroupId}',	'Frontend',	'UserGroupPermissionController@show',	'',	'2020-08-12 13:24:47.058032',	'2020-08-12 13:24:47.058032'),
(30,	21,	1,	'get',	'auth',	'configuration/department-list',	NULL,	'Frontend',	'DepartmentController@index',	'department-list',	'2020-08-12 14:43:12.877267',	'2020-08-12 14:43:12.877267'),
(31,	22,	1,	'get',	'auth',	'configuration/subdepartment-list',	NULL,	'Frontend',	'SubDepartmentController@index',	'subdepartment-list',	'2020-08-12 16:11:08.880405',	'2020-08-12 16:11:08.880405'),
(32,	25,	1,	'get',	'auth',	'configuration/designation-list',	NULL,	'Frontend',	'DesignationController@index',	'designation-list',	'2020-08-12 22:00:17.002872',	'2020-08-12 22:00:17.002872'),
(34,	131,	1,	'get',	'auth',	'clinical/radiologist-list',	NULL,	'Frontend',	'ClinicalRadRadiologistController@index',	'radiologist-list',	'2020-08-12 23:45:57.648687',	'2020-08-12 23:45:57.648687'),
(12,	123,	1,	'get',	'auth',	'sms-service/msg-templates',	'{hospital_id?}',	'Frontend',	'PatientAppointmentMsgTemplateController@viewMsgTemplates',	'msg-templates',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(13,	124,	1,	'get',	'auth',	'sms-service/sms-response',	'{appt_class?}/{hospital_id?}',	'Frontend',	'SmsResponseMessageController@getSmsResponseMessage',	'sms-response',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(14,	125,	1,	'get',	'auth',	'sms-service/reports-recipient/soc',	'{hospital_id?}',	'Frontend',	'PatientAppointmentEmailReportRecipientsController@viewReportsTab',	'reports-recipient',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(36,	123,	1,	'get',	'auth',	'sms-service/msg-templates-nonsoc',	'{hospital_id?}',	'Frontend',	'PatientAppointmentMsgTemplateController@viewNonSocMsgTemplates',	'nonsoc-msg-templates',	'2020-08-18 17:30:47',	'2020-08-18 17:30:47'),
(37,	60,	1,	'get',	'auth',	'sms-service/1-way-sms',	NULL,	'Frontend',	'OneWaySmsController@viewMessaging',	NULL,	'2020-08-19 17:19:59',	'2020-08-19 17:19:59'),
(39,	33,	1,	'get',	'auth',	'clinical/routing-rules',	'{department_id?}',	'Frontend',	'ClinicalRoutingRulesController@index',	'routing-rules',	'2020-08-20 09:46:48',	'2020-08-20 09:46:48'),
(17,	34,	1,	'get',	'auth',	'clinical/settings/msg-configuration',	'{lab_code?}',	'Frontend',	'CrrMessageConfigurationController@index',	'msg-configuration',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(11,	122,	1,	'get',	'auth',	'sms-service/soc',	NULL,	'Frontend',	'TwoWaySmsController@index',	'sms-service',	'2020-07-16 15:45:06.565104',	'2020-07-16 15:45:06.565104'),
(35,	122,	1,	'get',	'auth',	'sms-service/nonsoc',	NULL,	'Frontend',	'TwoWaySmsController@getNonSoc',	'nonsoc-sms-service',	'2020-08-18 17:26:29',	'2020-08-18 17:26:29');

DROP TABLE IF EXISTS "user_role";
DROP SEQUENCE IF EXISTS user_role_user_role_id_seq;
CREATE SEQUENCE user_role_user_role_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_role" (
    "user_role_id" integer DEFAULT nextval('user_role_user_role_id_seq') NOT NULL,
    "user_role_name" character varying,
    "hospital_id" integer,
    "super_admin" smallint DEFAULT '0',
    "default" smallint DEFAULT '0',
    "status" smallint DEFAULT '1',
    "user_role_type" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "user_role_pkey" PRIMARY KEY ("user_role_id")
) WITH (oids = false);

INSERT INTO "user_role" ("user_role_id", "user_role_name", "hospital_id", "super_admin", "default", "status", "user_role_type") VALUES
(0,	'System',	{{ hospital_id | default(1) }},	0,	0,	1,	0),
(1,	'Superadmin',	{{ hospital_id | default(1) }},	0,	0,	1,	0),
(18,	'Laboratory Medical Tech',	{{ hospital_id | default(1) }},	0,	0,	1,	0),
(5,	'Call Center Administrator',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(21,	'Nurses',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(6,	'Secretary/Admin Assistant',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(23,	'IT Support',	{{ hospital_id | default(1) }}7,	0,	0,	1,	1),
(25,	'Radiology Administrator',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(22,	'Allied Health',	{{ hospital_id | default(1) }}7,	0,	0,	1,	1),
(3,	'Account Administrator',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(20,	'Laboratory Administrator',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(2,	'System Administrator',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(15,	'Doctor',	{{ hospital_id | default(1) }},	0,	0,	1,	1),
(4,	'Call Center Operator',	{{ hospital_id | default(1) }},	0,	0,	1,	1);

DROP TABLE IF EXISTS "user_role_permission";
DROP SEQUENCE IF EXISTS user_role_permission_user_role_permission_id_seq;
CREATE SEQUENCE user_role_permission_user_role_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_role_permission" (
    "user_role_permission_id" integer DEFAULT nextval('user_role_permission_user_role_permission_id_seq') NOT NULL,
    "user_role_id" integer,
    "module_config_id" integer,
    "permission" character varying,
    "status" smallint DEFAULT '1',
    CONSTRAINT "user_role_permission_pkey" PRIMARY KEY ("user_role_permission_id")
) WITH (oids = false);

INSERT INTO "user_role_permission" ("user_role_permission_id", "user_role_id", "module_config_id", "permission", "status") VALUES
(17169,	20,	191,	'1',	1),
(4371,	27,	175,	'1',	1),
(4372,	27,	142,	'1',	1),
(4373,	27,	176,	'1',	1),
(5,	19,	NULL,	'1',	1),
(6,	19,	4,	'1',	1),
(7,	19,	20,	'1',	1),
(8,	19,	5,	'1,2,3,4',	1),
(4374,	27,	174,	'1',	1),
(4375,	27,	164,	'1',	1),
(4376,	27,	165,	'1',	1),
(12,	19,	6,	'1,3',	1),
(17170,	20,	194,	'1',	1),
(17171,	20,	193,	'1',	1),
(12010,	15,	197,	'1',	1),
(12011,	15,	184,	'3',	1),
(17172,	20,	204,	'1',	1),
(17173,	20,	187,	'1',	1),
(17174,	20,	203,	'1,2,4',	1),
(17175,	20,	147,	'1',	1),
(18017,	2,	197,	'1',	1),
(18018,	2,	184,	'3',	1),
(12012,	15,	191,	'1',	1),
(12013,	15,	195,	'1',	1),
(12014,	15,	194,	'1',	1),
(18019,	2,	191,	'1',	1),
(18020,	2,	195,	'1',	1),
(18021,	2,	194,	'1',	1),
(18022,	2,	198,	'1',	1),
(18023,	2,	192,	'1',	1),
(18024,	2,	193,	'1',	1),
(18025,	2,	199,	'1',	1),
(18026,	2,	196,	'1',	1),
(4377,	27,	167,	'1',	1),
(4378,	27,	166,	'1',	1),
(4379,	27,	137,	'1',	1),
(4380,	27,	118,	'1',	1),
(4381,	27,	173,	'1',	1),
(4382,	27,	115,	'1',	1),
(4383,	27,	117,	'1',	1),
(4384,	27,	116,	'1,3',	1),
(4385,	27,	130,	'1,3',	1),
(4386,	27,	131,	'1,3',	1),
(4387,	27,	112,	'1',	1),
(4388,	27,	123,	'1,2,3,4',	1),
(4389,	27,	152,	'1,3',	1),
(4390,	27,	158,	'1',	1),
(4391,	27,	156,	'1',	1),
(4392,	27,	169,	'1',	1),
(4393,	27,	154,	'1,3',	1),
(4394,	27,	157,	'1',	1),
(4395,	27,	155,	'1',	1),
(4396,	27,	135,	'1,6',	1),
(4397,	27,	170,	'1',	1),
(473,	29,	80,	'1',	1),
(474,	29,	82,	'1',	1),
(12015,	15,	198,	'1',	1),
(12016,	15,	192,	'1',	1),
(12017,	15,	193,	'1',	1),
(12018,	15,	199,	'1',	1),
(12019,	15,	196,	'1',	1),
(12020,	15,	185,	'2,3,4',	1),
(4398,	27,	114,	'1,3',	1),
(4262,	30,	118,	'1',	1),
(4263,	30,	169,	'1',	1),
(4264,	30,	114,	'1,3',	1),
(4265,	30,	168,	'1',	1),
(4399,	27,	121,	'1,2,3,4',	1),
(4400,	27,	168,	'1',	1),
(4401,	27,	134,	'1',	1),
(4402,	27,	132,	'1',	1),
(4403,	27,	133,	'1',	1),
(4404,	27,	136,	'1,3,6',	1),
(4405,	27,	138,	'1,6',	1),
(4406,	27,	119,	'1',	1),
(4407,	27,	127,	'1',	1),
(4408,	27,	113,	'1',	1),
(4409,	27,	128,	'1,4',	1),
(4410,	27,	124,	'1,3',	1),
(4411,	27,	125,	'1,3',	1),
(4412,	27,	171,	'1,4',	1),
(4413,	27,	151,	'1,3',	1),
(12021,	15,	204,	'1',	1),
(12022,	15,	187,	'1,2,3,4',	1),
(12023,	15,	135,	'1,3,6',	1),
(12024,	15,	114,	'1,3',	1),
(12025,	15,	162,	'1,2,3,4',	1),
(12026,	15,	136,	'1,3,6',	1),
(12027,	15,	138,	'1,6',	1),
(12028,	15,	151,	'1,2,3,4,6',	1),
(18027,	2,	185,	'2,3,4',	1),
(18028,	2,	204,	'1',	1),
(17176,	20,	144,	'1',	1),
(18029,	2,	203,	'1',	1),
(18030,	2,	153,	'1',	1),
(18031,	2,	146,	'1',	1),
(18032,	2,	150,	'1',	1),
(15047,	6,	114,	'1,3',	1),
(18033,	2,	147,	'1',	1),
(18034,	2,	144,	'1',	1),
(15048,	6,	111,	'1,2,3',	1),
(15049,	6,	172,	'1,3,9',	1),
(15050,	6,	125,	'1,3',	1),
(6304,	18,	147,	'1',	1),
(6305,	18,	144,	'1',	1),
(6306,	18,	116,	'1,3',	1),
(15051,	6,	171,	'1',	1),
(15052,	6,	151,	'1,2,3',	1),
(15053,	6,	177,	'6',	1),
(18035,	2,	148,	'1',	1),
(18036,	2,	161,	'1',	1),
(18037,	2,	145,	'1',	1),
(18038,	2,	149,	'1',	1),
(18039,	2,	160,	'1',	1),
(18040,	2,	188,	'1,2,3,4',	1),
(18041,	2,	116,	'1,3',	1),
(17177,	20,	116,	'1,3',	1),
(17178,	20,	183,	'1,2,3,4',	1),
(17179,	20,	206,	'1',	1),
(17180,	20,	118,	'1,2,3,4',	1),
(17181,	20,	115,	'1',	1),
(17182,	20,	117,	'1,2,3,4',	1),
(17183,	20,	112,	'1',	1),
(17184,	20,	122,	'1',	1),
(17185,	20,	123,	'1',	1),
(17121,	3,	200,	'1',	1),
(17122,	3,	137,	'1',	1),
(17123,	3,	203,	'1,2',	1),
(17124,	3,	139,	'1,3',	1),
(17125,	3,	126,	'1,3',	1),
(17126,	3,	136,	'1,3,6',	1),
(17127,	3,	124,	'1,3',	1),
(17128,	3,	125,	'1,3',	1),
(17129,	3,	151,	'1,2,3,4,6,8,13',	1),
(18042,	2,	183,	'1,2,3,4',	1),
(18043,	2,	206,	'1',	1),
(18044,	2,	207,	'1,2,3,4',	1),
(18045,	2,	118,	'1,2,3,4',	1),
(18046,	2,	115,	'1,2,3,4',	1),
(17186,	20,	129,	'1',	1),
(17187,	20,	152,	'1',	1),
(17188,	20,	158,	'1',	1),
(17189,	20,	156,	'1',	1),
(17190,	20,	120,	'1',	1),
(17191,	20,	169,	'1',	1),
(17192,	20,	139,	'1',	1),
(17193,	20,	178,	'1',	1),
(17194,	20,	154,	'1',	1),
(17195,	20,	157,	'1',	1),
(550,	1001,	106,	'1',	1),
(551,	1001,	103,	'1',	1),
(552,	1001,	105,	'1',	1),
(553,	1001,	104,	'1',	1),
(17196,	20,	155,	'1',	1),
(17197,	20,	114,	'1,3',	1),
(554,	1001,	102,	'1',	1),
(555,	1001,	60,	'1',	1),
(556,	1001,	101,	'1',	1),
(557,	1001,	76,	'1',	1),
(558,	1001,	91,	'1',	1),
(9136,	26,	144,	'1',	1),
(9137,	26,	116,	'1,3',	1),
(9138,	26,	151,	'1',	1),
(17198,	20,	162,	'1,2,3,4',	1),
(17199,	20,	111,	'1,2,3',	1),
(17200,	20,	119,	'1',	1),
(17201,	20,	127,	'1',	1),
(17202,	20,	113,	'1',	1),
(18047,	2,	117,	'1,2,3,4',	1),
(18048,	2,	159,	'1',	1),
(17203,	20,	128,	'1',	1),
(9242,	31,	116,	'1,3',	1),
(18049,	2,	130,	'1,3',	1),
(18050,	2,	131,	'1,3',	1),
(18051,	2,	182,	'3',	1),
(12602,	21,	151,	'1,10',	1),
(12603,	21,	177,	'6,7',	1),
(18052,	2,	112,	'1,2,3,4',	1),
(18053,	2,	122,	'1,2,3,6',	1),
(6670,	28,	175,	'1,6',	1),
(6671,	28,	142,	'1',	1),
(6672,	28,	176,	'1,2,3,4',	1),
(6673,	28,	174,	'1,6',	1),
(6674,	28,	164,	'1',	1),
(6675,	28,	165,	'1,2,3,4',	1),
(6676,	28,	167,	'1,3',	1),
(6677,	28,	166,	'1,3',	1),
(6678,	28,	137,	'1',	1),
(6679,	28,	153,	'1',	1),
(6680,	28,	146,	'1',	1),
(6681,	28,	150,	'1',	1),
(6682,	28,	147,	'1',	1),
(6683,	28,	144,	'1',	1),
(6684,	28,	148,	'1',	1),
(6685,	28,	161,	'1',	1),
(6686,	28,	145,	'1',	1),
(6687,	28,	149,	'1',	1),
(6688,	28,	160,	'1',	1),
(6689,	28,	116,	'1,3',	1),
(6690,	28,	118,	'1,2,3,4',	1),
(6691,	28,	173,	'1,2,3,4',	1),
(6692,	28,	115,	'1,2,3,4',	1),
(6693,	28,	117,	'1,2,3,4',	1),
(6694,	28,	159,	'1',	1),
(6695,	28,	130,	'1,3',	1),
(6696,	28,	131,	'1,3',	1),
(6697,	28,	112,	'1,2,3,4',	1),
(6698,	28,	122,	'1,2,3,6',	1),
(6699,	28,	123,	'1,2,3,4',	1),
(6700,	28,	129,	'1',	1),
(6701,	28,	152,	'1,3',	1),
(6702,	28,	158,	'1',	1),
(6703,	28,	156,	'1',	1),
(6704,	28,	120,	'1',	1),
(6705,	28,	169,	'1,2,3,4',	1),
(6706,	28,	139,	'1,3',	1),
(6707,	28,	154,	'1,3',	1),
(6708,	28,	157,	'1',	1),
(6709,	28,	155,	'1',	1),
(6710,	28,	135,	'1,3,6',	1),
(6711,	28,	170,	'1,3',	1),
(6712,	28,	114,	'1,3',	1),
(6713,	28,	162,	'1,2,3,4',	1),
(6714,	28,	111,	'1,2,3',	1),
(522,	1000,	70,	'1',	1),
(421,	24,	70,	'1',	1),
(422,	24,	54,	'1',	1),
(423,	24,	91,	'1',	1),
(18054,	2,	208,	'1,2,3,4',	1),
(18055,	2,	123,	'1,2,3',	1),
(18056,	2,	129,	'1',	1),
(18057,	2,	152,	'1,3',	1),
(6715,	28,	121,	'1,2,3,4',	1),
(6716,	28,	168,	'1,2,3,4',	1),
(6717,	28,	134,	'1',	1),
(6718,	28,	132,	'1',	1),
(6719,	28,	133,	'1',	1),
(6720,	28,	126,	'1,3',	1),
(6721,	28,	172,	'1,3',	1),
(6722,	28,	136,	'1,3,6',	1),
(6723,	28,	138,	'1,6',	1),
(6724,	28,	119,	'1',	1),
(6725,	28,	127,	'1,2,3,4',	1),
(6726,	28,	113,	'1,2,3,4',	1),
(6727,	28,	128,	'1,2,3,4',	1),
(6728,	28,	124,	'1,3',	1),
(6729,	28,	125,	'1,3',	1),
(6730,	28,	171,	'1,2,3,4',	1),
(6731,	28,	151,	'1,2,3,4,6',	1),
(6732,	28,	177,	'6,7',	1),
(523,	1000,	54,	'1',	1),
(524,	1000,	91,	'1',	1),
(18058,	2,	158,	'1',	1),
(18059,	2,	156,	'1',	1),
(18060,	2,	120,	'1',	1),
(18061,	2,	169,	'1,2,3,4',	1),
(18062,	2,	139,	'1,3',	1),
(18063,	2,	178,	'1,2,3,4',	1),
(18064,	2,	179,	'3',	1),
(18065,	2,	154,	'1,3',	1),
(18066,	2,	157,	'1',	1),
(18067,	2,	155,	'1',	1),
(18068,	2,	170,	'1,3',	1),
(18069,	2,	114,	'1,3',	1),
(18070,	2,	162,	'1,2,3,4',	1),
(16912,	23,	122,	'1',	1),
(12029,	4,	175,	'1,6',	1),
(16913,	23,	135,	'1,3,6',	1),
(16914,	23,	114,	'1,3',	1),
(16915,	23,	162,	'1,2,3,4',	1),
(16916,	23,	121,	'1',	1),
(16917,	23,	136,	'1,3,6',	1),
(18071,	2,	111,	'1,2,3',	1),
(18072,	2,	121,	'1,2,3,4',	1),
(18073,	2,	168,	'1,2,3,4',	1),
(18074,	2,	134,	'1',	1),
(18075,	2,	132,	'1',	1),
(18076,	2,	133,	'1',	1),
(18077,	2,	126,	'1,3',	1),
(18078,	2,	172,	'1,3,9',	1),
(18079,	2,	136,	'1,3,6',	1),
(18080,	2,	138,	'1,6',	1),
(17204,	20,	124,	'1',	1),
(16918,	23,	138,	'1,6',	1),
(12030,	4,	142,	'1',	1),
(12031,	4,	176,	'1,2,3,4',	1),
(12032,	4,	174,	'1,6',	1),
(17205,	20,	125,	'1',	1),
(17206,	20,	171,	'1',	1),
(17207,	20,	151,	'1',	1),
(17208,	20,	177,	'6',	1),
(12033,	4,	164,	'1',	1),
(12034,	4,	165,	'1,2,3,4',	1),
(12035,	4,	167,	'1,3',	1),
(12036,	4,	166,	'1,3',	1),
(12037,	4,	137,	'1',	1),
(12038,	4,	204,	'1',	1),
(12039,	4,	203,	'1',	1),
(12040,	4,	148,	'1',	1),
(12041,	4,	145,	'1',	1),
(12042,	4,	116,	'1,3',	1),
(12043,	4,	118,	'1,2,3,4',	1),
(12044,	4,	117,	'1,2,3,4',	1),
(12045,	4,	130,	'1,3',	1),
(12046,	4,	131,	'1,3',	1),
(12047,	4,	112,	'1,2,3,4',	1),
(12048,	4,	122,	'1,2,3,6',	1),
(12049,	4,	123,	'1,2,3,4',	1),
(12050,	4,	129,	'1',	1),
(12051,	4,	152,	'1,3',	1),
(12052,	4,	158,	'1',	1),
(12053,	4,	156,	'1',	1),
(12054,	4,	120,	'1',	1),
(12055,	4,	169,	'1',	1),
(12056,	4,	139,	'1,3',	1),
(16919,	23,	151,	'1,2,3,4,6,8',	1),
(12057,	4,	178,	'1,2,3,4',	1),
(16920,	23,	177,	'6,7',	1),
(16484,	5,	203,	'2',	1),
(16485,	5,	144,	'1',	1),
(16486,	5,	148,	'1',	1),
(16487,	5,	145,	'1',	1),
(16488,	5,	149,	'1',	1),
(16489,	5,	188,	'1',	1),
(16490,	5,	116,	'1,3',	1),
(16491,	5,	130,	'1,3',	1),
(16492,	5,	131,	'1,3',	1),
(16493,	5,	152,	'1,3',	1),
(16494,	5,	178,	'1',	1),
(16495,	5,	179,	'3',	1),
(16496,	5,	154,	'1,3',	1),
(16497,	5,	135,	'1,3,6',	1),
(16498,	5,	114,	'1,3',	1),
(16499,	5,	202,	'3',	1),
(16500,	5,	132,	'1',	1),
(16501,	5,	133,	'1',	1),
(16502,	5,	151,	'1,3,6',	1),
(18081,	2,	180,	'1,2,3,4',	1),
(18082,	2,	186,	'1,2,3,4',	1),
(18083,	2,	119,	'1',	1),
(18084,	2,	127,	'1,2,3,4',	1),
(18085,	2,	113,	'1,2,3,4',	1),
(16926,	25,	161,	'1',	1),
(16927,	25,	116,	'1,3',	1),
(16928,	25,	205,	'1',	1),
(16929,	25,	173,	'1',	1),
(17095,	22,	175,	'1',	1),
(17096,	22,	142,	'1',	1),
(17097,	22,	176,	'1,2',	1),
(12058,	4,	154,	'1,3',	1),
(12059,	4,	155,	'1',	1),
(12060,	4,	135,	'1,3,6',	1),
(12061,	4,	170,	'1,3',	1),
(12062,	4,	114,	'1,3',	1),
(12063,	4,	162,	'1,2,3,4',	1),
(18086,	2,	128,	'1,2,3,4',	1),
(18087,	2,	124,	'1,3',	1),
(18088,	2,	125,	'1,3',	1),
(18089,	2,	171,	'1,2,3,4',	1),
(17098,	22,	174,	'1,6',	1),
(17099,	22,	164,	'1',	1),
(17100,	22,	165,	'1,2,3,4',	1),
(17101,	22,	167,	'1,3',	1),
(17102,	22,	166,	'1,3',	1),
(17103,	22,	203,	'1,2',	1),
(17104,	22,	118,	'1',	1),
(17105,	22,	130,	'1,3',	1),
(17106,	22,	131,	'1,3',	1),
(17107,	22,	123,	'1,2,3,4',	1),
(17108,	22,	129,	'1',	1),
(17109,	22,	152,	'1,3',	1),
(17110,	22,	135,	'1,6',	1),
(17111,	22,	170,	'1,3',	1),
(17112,	22,	114,	'1,3',	1),
(17113,	22,	121,	'1,2,3,4',	1),
(17114,	22,	132,	'1',	1),
(17115,	22,	172,	'1,3,9',	1),
(17116,	22,	113,	'1,3,4',	1),
(17117,	22,	128,	'1,2,3,4',	1),
(17118,	22,	124,	'1,3',	1),
(17119,	22,	171,	'1,2,3,4',	1),
(17120,	22,	151,	'1,2,3',	1),
(12064,	4,	111,	'1,2,3',	1),
(12065,	4,	121,	'1,2,3,4',	1),
(12066,	4,	168,	'1,2,3,4',	1),
(12067,	4,	134,	'1',	1),
(12068,	4,	132,	'1',	1),
(12069,	4,	133,	'1',	1),
(12070,	4,	126,	'1,3',	1),
(12071,	4,	172,	'1,3',	1),
(12072,	4,	136,	'1,3,6',	1),
(12073,	4,	138,	'1,6',	1),
(12074,	4,	119,	'1',	1),
(12075,	4,	127,	'1,2,3,4',	1),
(12076,	4,	113,	'1,2,3,4',	1),
(12077,	4,	128,	'1,2,3,4',	1),
(12078,	4,	124,	'1,3',	1),
(12079,	4,	125,	'1,3',	1),
(12080,	4,	171,	'1,2,3,4',	1),
(12081,	4,	151,	'1,2,3,4,6',	1),
(12082,	4,	177,	'6,7',	1),
(18090,	2,	151,	'1,2,3,4,6,8',	1);

DROP TABLE IF EXISTS "hms_msg_header_footer";
DROP SEQUENCE IF EXISTS hms_msg_header_footer_id_seq;
CREATE SEQUENCE hms_msg_header_footer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_msg_header_footer" (
    "id" integer DEFAULT nextval('hms_msg_header_footer_id_seq') NOT NULL,
    "hospital_id" integer NOT NULL,
    "msg_mode" character varying(20) NOT NULL,
    "msg_type" character varying(20) NOT NULL,
    "header" character varying,
    "footer" character varying,
    CONSTRAINT "hms_msg_header_footer_id_index" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_msg_header_footer" ("id", "hospital_id", "msg_mode", "msg_type", "header", "footer") VALUES
(1,	{{ hospital_id | default(1) }},	'message',	'info',	'',	''),
(2,	{{ hospital_id | default(1) }},	'message',	'normal',	'*',	''),
(3,	{{ hospital_id | default(1) }},	'message',	'urgent',	'#',	''),
(4,	{{ hospital_id | default(1) }},	'ebroadcast',	'ebroadcast',	'',	''),
(5,	{{ hospital_id | default(1) }},	'patient',	'nokbroadcast',	'',	' PLS DO NOT REPLY'),
(6,	{{ hospital_id | default(1) }},	'act',	'act_broadcast',	'',	'');

DROP TABLE IF EXISTS "hms_messagelog";
DROP SEQUENCE IF EXISTS hms_messagelog_msgid_seq;
CREATE SEQUENCE hms_messagelog_msgid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_messagelog" (
    "msgid" bigint DEFAULT nextval('hms_messagelog_msgid_seq') NOT NULL,
    "sender" character varying(50),
    "receiver" character varying(50),
    "hospitalid" character varying(10),
    "departmentid" character varying(10),
    "designationid" character varying(10),
    "teamid" character varying(100),
    "msg" text,
    "msgtype" character varying(20),
    "timestamp" timestamp,
    "jobid" character varying(20),
    "msgdata" text,
    "replyid" bigint,
    "escalateid" bigint,
    "systemid" character varying(20),
    "messageclassid" character varying(20),
    "clientmsgid" character varying(50),
    "broadcastid" character varying(50),
    "frontendtransport" character varying(20),
    "backendtransport" character varying(20),
    "status" character varying(20),
    "transporttypeid" character varying(20),
    "statustimestamp" timestamp,
    "proxyid" character varying(50),
    "timeouttime" timestamp,
    "remarks" text,
    "sendername" character varying(100),
    "receivername" character varying(100),
    "senderhospitalid" character varying(10),
    "senderdepartmentid" character varying(10),
    "senderdesignationid" character varying(10),
    "senderteamid" character varying(100),
    "direction" character varying(20),
    "msggroup" character varying(20),
    "parentid" bigint,
    "delivered_timestamp" timestamp,
    "replied_timestamp" timestamp,
    "tab_id" character varying,
    "labrad_id" integer,
    "sourcejid" character varying,
    "charater_count" integer,
    "sms_count" integer,
    "thread_id" character varying(100),
    "recipientlist_name" text,
    "systemtype" character varying(50),
    "recipienttype" character varying(20),
    "gjobid" character varying(30),
    "tm_code" character varying(20),
    "sender_flag" integer DEFAULT '1' NOT NULL,
    "receiver_flag" integer DEFAULT '1' NOT NULL,
    "read_flag" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "hms_messagelog_msgid" PRIMARY KEY ("msgid")
) WITH (oids = false);

CREATE INDEX "hms_jobid_index" ON "public"."hms_messagelog" USING btree ("jobid");

CREATE INDEX "msg_backendtransport_index" ON "public"."hms_messagelog" USING btree ("backendtransport");

CREATE INDEX "msg_broadcastid_index" ON "public"."hms_messagelog" USING btree ("broadcastid");

CREATE INDEX "msg_hospital_index" ON "public"."hms_messagelog" USING btree ("hospitalid");

CREATE INDEX "msg_msgid_index" ON "public"."hms_messagelog" USING btree ("msgid");

CREATE INDEX "msg_msgtype_index" ON "public"."hms_messagelog" USING btree ("msgtype");

CREATE INDEX "msg_receiver_index" ON "public"."hms_messagelog" USING btree ("receiver");

CREATE INDEX "msg_sender_index" ON "public"."hms_messagelog" USING btree ("sender");

CREATE INDEX "msg_status_index" ON "public"."hms_messagelog" USING btree ("status");

CREATE INDEX "msg_timestamp_index" ON "public"."hms_messagelog" USING btree ("timestamp");

COMMENT ON COLUMN "public"."hms_messagelog"."direction" IS 'incoming or outgoing';

DROP TABLE IF EXISTS "hms_crr";
CREATE TABLE "public"."hms_crr" (
    "labrad_id" integer NOT NULL,
    "system_id" integer,
    "msg_control_id" character varying(30),
    "msg_date_time" timestamp,
    "event_type" character varying(3),
    "event_trigger" character varying(3),
    "patient_ext_id" character varying(30),
    "patient_name" character varying,
    "patient_dob" date,
    "patient_sex" character varying(10),
    "patient_race" character varying(10),
    "patient_address" text,
    "patient_contact_no" character varying,
    "patient_class" character varying(10),
    "patient_visit_id" character varying(30),
    "location_id" character varying(30),
    "admit_date_time" timestamp,
    "discharge_date_time" timestamp,
    "observation_code" character varying(10),
    "observation_name" character varying,
    "comment" text,
    "orderer_id" character varying(30),
    "orderer_name" character varying,
    "orderer_pos" character varying(10),
    "labrad_status" integer,
    "labrad_result" text,
    "labrad_sender" text,
    "labrad_recipient" text,
    "labrad_follow_up" text,
    "mandatory_status" integer,
    "accession_no" character varying(30),
    "att_doctor_id" character varying(30),
    "att_doctor_name" character varying,
    "att_doctor_pos" character varying(10),
    "department_code" character varying(10),
    "patient_financial_code" character varying(20),
    "recipient_group" character varying(20),
    "remarks" character varying,
    "labrad_sent_time" timestamp,
    "recipient_level" integer,
    "bed_no" character varying(20),
    "timestamp" timestamp,
    "location_name" character varying,
    "lab_code" character varying(10),
    "observation" text,
    "labrad_closure_time" timestamp,
    "intervention_name" character varying(50),
    "closure_time" character varying,
    "closure_doctor" character varying,
    "closure_staff" character varying,
    "intervention_jid" character varying(50),
    "intervention_time" timestamp,
    "hospital_id" integer NOT NULL,
    "vip_level" integer,
    "collection_date_time" timestamp,
    "order_date_time" timestamp,
    "received_date_time" timestamp,
    "critical_flag" integer DEFAULT '1',
    "order_location_id" character varying(30),
    "order_location_name" character varying,
    "order_bed_no" character varying(20),
    "order_visit_id" character varying(30),
    "order_department_code" character varying(10),
    "hl7_id" integer,
    "hl7_data" text,
    "intervention_start_time" timestamp,
    "closure_doctor_jid" character varying(50),
    "closure_doctor_mobile" character varying(50),
    "closure_staff_jid" character varying(50),
    "notifier_flag" integer DEFAULT '0' NOT NULL,
    "notifier_time" timestamp,
    "notifier_doctor_name" character varying,
    "notifier_doctor_mobile" character varying(50),
    "notifier_doctor_jid" character varying(50),
    "notifier_staff_name" character varying,
    "notifier_staff_jid" character varying(50),
    "notifier_remarks" character varying,
    "notifier_name" character varying,
    "notifier_jid" character varying(50),
    "order_lab_code" character varying(10),
    "intervention_handled_time" timestamp,
    "merge_patient_ext_id" character varying(30),
    "finding_ffup_ids" character varying,
    "communication_ids" character varying,
    CONSTRAINT "hms_crr_pkey" PRIMARY KEY ("labrad_id", "hospital_id")
) WITH (oids = false);

CREATE INDEX "hms_crr_accession_no" ON "public"."hms_crr" USING btree ("accession_no");

CREATE INDEX "hms_crr_att_doctor" ON "public"."hms_crr" USING btree ("att_doctor_id");

CREATE INDEX "hms_crr_closure_time" ON "public"."hms_crr" USING btree ("labrad_closure_time");

CREATE INDEX "hms_crr_critical_flag" ON "public"."hms_crr" USING btree ("critical_flag");

CREATE INDEX "hms_crr_department" ON "public"."hms_crr" USING btree ("department_code");

CREATE INDEX "hms_crr_follow_up" ON "public"."hms_crr" USING btree ("labrad_follow_up");

CREATE INDEX "hms_crr_hospital" ON "public"."hms_crr" USING btree ("hospital_id");

CREATE INDEX "hms_crr_location" ON "public"."hms_crr" USING btree ("location_id");

CREATE INDEX "hms_crr_observation" ON "public"."hms_crr" USING btree ("observation_code");

CREATE INDEX "hms_crr_orderer" ON "public"."hms_crr" USING btree ("orderer_id");

CREATE INDEX "hms_crr_patient_ext_id" ON "public"."hms_crr" USING btree ("patient_ext_id");

CREATE INDEX "hms_crr_patient_visit_id" ON "public"."hms_crr" USING btree ("patient_visit_id");

CREATE INDEX "hms_crr_recipient" ON "public"."hms_crr" USING btree ("labrad_recipient");

CREATE INDEX "hms_crr_recipient_group" ON "public"."hms_crr" USING btree ("recipient_group");

CREATE INDEX "hms_crr_result_date" ON "public"."hms_crr" USING btree ("msg_date_time");

CREATE INDEX "hms_crr_timestamp" ON "public"."hms_crr" USING btree ("timestamp");

CREATE INDEX "hms_crr_vip_level" ON "public"."hms_crr" USING btree ("vip_level");

COMMENT ON COLUMN "public"."hms_crr"."critical_flag" IS '1=critical, 0=non critical';

DROP TABLE IF EXISTS "hms_clinical_messagelog";
DROP SEQUENCE IF EXISTS hms_clinical_messagelog_msgid_seq;
CREATE SEQUENCE hms_clinical_messagelog_msgid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_clinical_messagelog" (
    "msgid" bigint DEFAULT nextval('hms_clinical_messagelog_msgid_seq') NOT NULL,
    "sender" character varying(50),
    "receiver" character varying(50),
    "hospitalid" character varying(10),
    "departmentid" character varying(10),
    "designationid" character varying(10),
    "teamid" character varying(100),
    "msg" text,
    "msgtype" character varying(20),
    "timestamp" timestamp,
    "jobid" character varying(20),
    "msgdata" text,
    "replyid" bigint,
    "escalateid" bigint,
    "systemid" character varying(20),
    "messageclassid" character varying(20),
    "clinicalid" character varying(50),
    "broadcastid" character varying(50),
    "frontendtransport" character varying(20),
    "backendtransport" character varying(20),
    "status" character varying(20),
    "transporttypeid" character varying(20),
    "statustimestamp" timestamp,
    "proxyid" character varying(50),
    "timeouttime" timestamp,
    "remarks" text,
    "sendername" character varying(100),
    "receivername" character varying(100),
    "senderhospitalid" character varying(10),
    "senderdepartmentid" character varying(10),
    "senderdesignationid" character varying(10),
    "senderteamid" character varying(100),
    "direction" character varying(20),
    "msggroup" character varying(20),
    "parentid" bigint,
    "labresultid" character varying(50),
    "delivered_timestamp" timestamp,
    "replied_timestamp" timestamp,
    "tab_id" character varying,
    "sourcejid" character varying,
    "systemtype" character varying(50),
    "charater_count" integer,
    "sms_count" integer,
    "gjobid" character varying(30),
    "tm_code" character varying(20),
    CONSTRAINT "cmsg_pkey" PRIMARY KEY ("msgid"),
    CONSTRAINT "cmsg_unique_result" UNIQUE ("labresultid", "msg", "msgdata")
) WITH (oids = false);

CREATE INDEX "cmsg_clinicalid_index" ON "public"."hms_clinical_messagelog" USING btree ("clinicalid");

CREATE INDEX "cmsg_frontendtransport_index" ON "public"."hms_clinical_messagelog" USING btree ("frontendtransport");

CREATE INDEX "cmsg_hospital_index" ON "public"."hms_clinical_messagelog" USING btree ("hospitalid");

CREATE INDEX "cmsg_labresultid_index" ON "public"."hms_clinical_messagelog" USING btree ("labresultid");

CREATE INDEX "cmsg_msgtype_index" ON "public"."hms_clinical_messagelog" USING btree ("msgtype");

CREATE INDEX "cmsg_receiver_index" ON "public"."hms_clinical_messagelog" USING btree ("receiver");

CREATE INDEX "cmsg_sender_index" ON "public"."hms_clinical_messagelog" USING btree ("sender");

CREATE INDEX "cmsg_status_index" ON "public"."hms_clinical_messagelog" USING btree ("status");

DROP TABLE IF EXISTS "hms_lab_code";
DROP SEQUENCE IF EXISTS hms_lab_code_id_seq;
CREATE SEQUENCE hms_lab_code_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_lab_code" (
    "id" integer DEFAULT nextval('hms_lab_code_id_seq') NOT NULL,
    "lab_code" character varying(10),
    "lab_name" character varying(100),
    "display_position" integer,
    CONSTRAINT "hms_lab_code_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_lab_code" ("id", "lab_code", "lab_name", "display_position") VALUES
(1,	'GL',	'General Laboratory',	1),
(2,	'MB',	'Microbiology Laboratory',	2),
(3,	'RAD',	'Radiology Laboratory',	3),
(4,	'HIS',	'Histopathology',	4);

DROP TABLE IF EXISTS "hms_lab_permission";
DROP SEQUENCE IF EXISTS hms_lab_permission_id_seq;
CREATE SEQUENCE hms_lab_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_lab_permission" (
    "id" integer DEFAULT nextval('hms_lab_permission_id_seq') NOT NULL,
    "lab_code" character varying,
    "module_id" integer,
    "hospital_id" integer,
    CONSTRAINT "hms_lab_permission_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_lab_permission" ("id", "lab_code", "module_id", "hospital_id") VALUES
(2,	'MB',	102,	{{ hospital_id | default(1) }}),
(3,	'RAD',	103,	{{ hospital_id | default(1) }}),
(4,	'HIS',	101,	{{ hospital_id | default(1) }}),
(1,	'GL',	101,	{{ hospital_id | default(1) }});

DROP TABLE IF EXISTS "hms_labrad_rad_priority_display_map";
DROP SEQUENCE IF EXISTS hms_labrad_rad_priority_display_map_id_seq;
CREATE SEQUENCE hms_labrad_rad_priority_display_map_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_labrad_rad_priority_display_map" (
    "id" integer DEFAULT nextval('hms_labrad_rad_priority_display_map_id_seq') NOT NULL,
    "priority_flag" character varying(20),
    "value" character varying(20),
    "status" integer DEFAULT '1',
    CONSTRAINT "hms_labrad_rad_priority_display_map_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_labrad_rad_priority_display_map" ("id", "priority_flag", "value", "status") VALUES
(1,	'AA',	'R4A/R5',	1),
(2,	'A',	'R3/R4',	1),
(3,	'N',	'R1/R2',	1),
(4,	'',	'Blank',	1);

DROP TABLE IF EXISTS "hms_crr_manual_intervention_activity";
DROP SEQUENCE IF EXISTS hms_crr_manual_intervention_activity_id_seq;
CREATE SEQUENCE hms_crr_manual_intervention_activity_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."hms_crr_manual_intervention_activity" (
    "id" integer DEFAULT nextval('hms_crr_manual_intervention_activity_id_seq') NOT NULL,
    "labrad_id" integer NOT NULL,
    "user_jid" character varying(100),
    "user_name" character varying(100),
    "remarks" character varying(100),
    "crr_events" text,
    "timestamp" timestamp,
    CONSTRAINT "hms_crr_manual_intervention_activity_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_crr_manual_intervention_activity" ("id", "labrad_id", "user_jid", "user_name", "remarks", "crr_events", "timestamp") VALUES
(1,	554816,	'System',	'<System>',	'Case fall through Contact Centre',	'Fall through',	'2021-07-14 18:30:22.704209');

DROP TABLE IF EXISTS "hms_crr_manual_intervention";
DROP SEQUENCE IF EXISTS hms_crr_manual_intervention_id_seq;
CREATE SEQUENCE hms_crr_manual_intervention_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

DROP TABLE IF EXISTS "hms_crr_manual_intervention";
DROP SEQUENCE IF EXISTS hms_crr_manual_intervention_id_seq;
CREATE SEQUENCE hms_crr_manual_intervention_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."hms_crr_manual_intervention" (
    "id" integer DEFAULT nextval('hms_crr_manual_intervention_id_seq') NOT NULL,
    "labrad_id" integer NOT NULL,
    "manual_intervention_handled_time" timestamp,
    "take_over_flag" integer,
    "take_over_timeout_timestamp" timestamp,
    "processed" integer DEFAULT '0' NOT NULL,
    "timestamp" timestamp,
    CONSTRAINT "hms_crr_manual_intervention_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_user_activity";
DROP SEQUENCE IF EXISTS hms_user_activity_activity_id_seq;
CREATE SEQUENCE hms_user_activity_activity_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_user_activity" (
    "activity_id" integer DEFAULT nextval('hms_user_activity_activity_id_seq') NOT NULL,
    "activity_date" timestamp NOT NULL,
    "jid" character varying(50) NOT NULL,
    "nickname" character varying(100) NOT NULL,
    "hospitalid" integer NOT NULL,
    "module" character varying(50),
    "activity_type" character varying(10),
    "activity_details" text,
    "profile_name" character varying(100),
    "profile_jid" character varying(50),
    CONSTRAINT "hms_user_activities_pkey" PRIMARY KEY ("activity_id")
) WITH (oids = false);

DROP TABLE IF EXISTS "department_permissions";
DROP SEQUENCE IF EXISTS department_permissions_id_seq;
CREATE SEQUENCE department_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."department_permissions" (
    "id" integer DEFAULT nextval('department_permissions_id_seq') NOT NULL,
    "jid" character varying(100) NOT NULL,
    "departments" text,
    "created_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    "updated_at" timestamp DEFAULT date_trunc('second', CURRENT_TIMESTAMP) NOT NULL,
    CONSTRAINT "department_permissions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

DROP TABLE IF EXISTS "hms_roster_entry";
DROP SEQUENCE IF EXISTS hms_roster_entry_id_seq;
CREATE SEQUENCE hms_roster_entry_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_entry" (
    "id" integer DEFAULT nextval('hms_roster_entry_id_seq') NOT NULL,
    "hospital_id" smallint NOT NULL,
    "department_id" smallint NOT NULL,
    "template_id" smallint NOT NULL,
    "staff_leave" character varying(100) NOT NULL,
    "start_datetime" timestamp NOT NULL,
    "end_datetime" timestamp NOT NULL,
    "role_id" smallint,
    "team_id" smallint,
    "jid" character varying(50),
    "leave_id" smallint,
    "cell_id" character varying(15),
    "module_id" integer,
    "remarks" text,
    "deleted" smallint DEFAULT '0' NOT NULL,
    "created_datetime" timestamp NOT NULL,
    "created_by" character varying(50) NOT NULL,
    "modified_datetime" timestamp,
    "modified_by" character varying(50),
    "color" integer DEFAULT '0' NOT NULL,
    "start_flag" character varying(2),
    "end_flag" character varying(2),
    "reason_for_change" character varying,
    CONSTRAINT "hms_roster_entry_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "roster_entry_deleted_status" ON "public"."hms_roster_entry" USING btree ("deleted");

CREATE INDEX "roster_entry_department_id" ON "public"."hms_roster_entry" USING btree ("department_id");

CREATE INDEX "roster_entry_end_datetime" ON "public"."hms_roster_entry" USING btree ("end_datetime");

CREATE INDEX "roster_entry_hospital_id" ON "public"."hms_roster_entry" USING btree ("hospital_id");

CREATE INDEX "roster_entry_jid" ON "public"."hms_roster_entry" USING btree ("jid");

CREATE INDEX "roster_entry_leave_id" ON "public"."hms_roster_entry" USING btree ("leave_id");

CREATE INDEX "roster_entry_role_id" ON "public"."hms_roster_entry" USING btree ("role_id");

CREATE INDEX "roster_entry_start_datetime" ON "public"."hms_roster_entry" USING btree ("start_datetime");

CREATE INDEX "roster_entry_team_id" ON "public"."hms_roster_entry" USING btree ("team_id");

CREATE INDEX "roster_entry_template_id" ON "public"."hms_roster_entry" USING btree ("template_id");

COMMENT ON COLUMN "public"."hms_roster_entry"."module_id" IS '4:Monthly, 5:OnCall';

COMMENT ON COLUMN "public"."hms_roster_entry"."color" IS '0:normal, 1:yellow, 2:green';


DELIMITER ;;

CREATE TRIGGER "roster_entry_audit" AFTER DELETE OR INSERT OR UPDATE ON "public"."hms_roster_entry" FOR EACH ROW EXECUTE FUNCTION process_roster_entry_audit();;

DELIMITER ;

DROP TABLE IF EXISTS "hms_roster_entry_audit";
CREATE TABLE "public"."hms_roster_entry_audit" (
    "operation" character(1) NOT NULL,
    "stamp" timestamp NOT NULL,
    "id" bigint NOT NULL,
    "hospital_id" smallint NOT NULL,
    "department_id" smallint NOT NULL,
    "template_id" smallint NOT NULL,
    "staff_leave" character varying(100) NOT NULL,
    "start_datetime" timestamp NOT NULL,
    "end_datetime" timestamp NOT NULL,
    "role_id" smallint,
    "team_id" smallint,
    "jid" character varying(50),
    "leave_id" smallint,
    "cell_id" character varying(15),
    "module_id" integer,
    "remarks" text,
    "deleted" smallint DEFAULT '0' NOT NULL,
    "created_datetime" timestamp NOT NULL,
    "created_by" character varying(50) NOT NULL,
    "modified_datetime" timestamp,
    "modified_by" character varying(50),
    "color" integer DEFAULT '0' NOT NULL,
    "start_flag" character varying(2),
    "end_flag" character varying(2)
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_roster_entry_audit"."module_id" IS '4:Monthly, 5:OnCall';

COMMENT ON COLUMN "public"."hms_roster_entry_audit"."color" IS '0:normal, 1:yellow, 2:green';


DROP TABLE IF EXISTS "hms_roster_entry_cache";
DROP SEQUENCE IF EXISTS hms_roster_entry_cache_cache_id_seq;
CREATE SEQUENCE hms_roster_entry_cache_cache_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_entry_cache" (
    "cache_id" integer DEFAULT nextval('hms_roster_entry_cache_cache_id_seq') NOT NULL,
    "hospital_id" smallint,
    "department_id" smallint,
    "template_id" smallint,
    "doctor_name" character varying(100),
    "start_datetime" timestamp,
    "end_datetime" timestamp,
    "role_id" smallint,
    "team_id" smallint,
    "jid" character varying(50),
    "leave_id" smallint,
    "cell_id" character varying(15),
    "module_id" integer,
    "remarks" text,
    "deleted" smallint,
    "created_datetime" timestamp,
    "created_by" character varying(50),
    "modified_datetime" timestamp,
    "modified_by" character varying(50),
    "color" integer,
    "start_flag" character varying(2),
    "end_flag" character varying(2),
    "mcr" character varying(100),
    "error" text,
    "uploaded_by" character varying(50),
    "uploaded_datetime" timestamp,
    "raw_data" text,
    "posted" smallint DEFAULT '0',
    CONSTRAINT "hms_roster_entry_cache_pkey" PRIMARY KEY ("cache_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_roster_entry_log";
DROP SEQUENCE IF EXISTS hms_roster_entry_log_id_seq;
CREATE SEQUENCE hms_roster_entry_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_entry_log" (
    "id" integer DEFAULT nextval('hms_roster_entry_log_id_seq') NOT NULL,
    "template_id" integer,
    "details" text,
    "user_id" character varying(50) NOT NULL,
    "hospital_id" integer NOT NULL,
    "department_id" integer NOT NULL,
    "timestamp" timestamp DEFAULT now() NOT NULL,
    "filename" text,
    "year" integer,
    "month" integer,
    CONSTRAINT "hms_roster_entry_log_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

DROP TABLE IF EXISTS "hms_roster_design";
DROP SEQUENCE IF EXISTS hms_roster_design_roster_template_id_seq;
CREATE SEQUENCE hms_roster_design_roster_template_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_design" (
    "roster_template_id" integer DEFAULT nextval('hms_roster_design_roster_template_id_seq') NOT NULL,
    "hospital_id" integer NOT NULL,
    "department_id" integer NOT NULL,
    "roster_type_id" integer NOT NULL,
    "label_type" character varying(10),
    "corner" character varying(50),
    "orientation" character(1) DEFAULT 'P' NOT NULL,
    "mcr_display" integer DEFAULT '0' NOT NULL,
    "contact_display" integer DEFAULT '0' NOT NULL,
    "contact_list_display" integer DEFAULT '0' NOT NULL,
    "roster_status" integer DEFAULT '1' NOT NULL,
    "created_date" timestamp NOT NULL,
    "created_by" character varying(50) NOT NULL,
    "last_updated_date" timestamp,
    "last_updated_by" character varying(50),
    "weekly_view" integer DEFAULT '0',
    "am_pm_view" integer DEFAULT '0',
    "weekly_view_corner" character varying(50),
    "office_hours" integer DEFAULT '1' NOT NULL,
    "layout_type" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "hms_roster_design_pkey" PRIMARY KEY ("roster_template_id")
) WITH (oids = false);

CREATE INDEX "roster_design_department" ON "public"."hms_roster_design" USING btree ("department_id");

CREATE INDEX "roster_design_hospital" ON "public"."hms_roster_design" USING btree ("hospital_id");

CREATE INDEX "roster_design_status" ON "public"."hms_roster_design" USING btree ("roster_status");

CREATE INDEX "roster_design_type" ON "public"."hms_roster_design" USING btree ("roster_type_id");

COMMENT ON COLUMN "public"."hms_roster_design"."roster_status" IS '0=unused; 1=used';


DROP TABLE IF EXISTS "hms_roster_designation";
DROP SEQUENCE IF EXISTS hms_roster_designation_designation_id_seq;
CREATE SEQUENCE hms_roster_designation_designation_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_designation" (
    "designation_id" integer DEFAULT nextval('hms_roster_designation_designation_id_seq') NOT NULL,
    "designation" character varying(20) NOT NULL,
    "color" character varying(15) NOT NULL,
    "position" integer NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "hospitalid" integer NOT NULL,
    CONSTRAINT "hms_roster_designation_pkey" PRIMARY KEY ("designation_id", "hospitalid")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_roster_designation"."status" IS '0 = hidden, 1= displayed';

DROP TABLE IF EXISTS "hms_roster_title";
DROP SEQUENCE IF EXISTS hms_roster_title_roster_title_id_seq;
CREATE SEQUENCE hms_roster_title_roster_title_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_roster_title" (
    "roster_title_id" integer DEFAULT nextval('hms_roster_title_roster_title_id_seq') NOT NULL,
    "roster_template_id" integer NOT NULL,
    "hospital_id" integer NOT NULL,
    "department_id" integer NOT NULL,
    "roster_title" character varying(100) NOT NULL,
    "effective_start_date" timestamp NOT NULL,
    "effective_end_date" timestamp,
    "status" integer DEFAULT '1' NOT NULL,
    "created_date" timestamp NOT NULL,
    "created_by" character varying(50) NOT NULL,
    "last_updated_date" timestamp,
    "last_updated_by" character varying(50),
    CONSTRAINT "hms_roster_title_pkey" PRIMARY KEY ("roster_title_id")
) WITH (oids = false);

CREATE INDEX "roster_title_department_index" ON "public"."hms_roster_title" USING btree ("department_id");

CREATE INDEX "roster_title_end_date_index" ON "public"."hms_roster_title" USING btree ("effective_end_date");

CREATE INDEX "roster_title_hospital_index" ON "public"."hms_roster_title" USING btree ("hospital_id");

CREATE INDEX "roster_title_roster_template_index" ON "public"."hms_roster_title" USING btree ("roster_template_id");

CREATE INDEX "roster_title_roster_title_index" ON "public"."hms_roster_title" USING btree ("roster_title");

CREATE INDEX "roster_title_start_date_index" ON "public"."hms_roster_title" USING btree ("effective_start_date");

CREATE INDEX "roster_title_status_index" ON "public"."hms_roster_title" USING btree ("status");

DROP TABLE IF EXISTS "hms_section";
DROP SEQUENCE IF EXISTS hms_section_sectionid_seq;
CREATE SEQUENCE hms_section_sectionid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_section" (
    "sectionid" bigint DEFAULT nextval('hms_section_sectionid_seq') NOT NULL,
    "sectioncode" character varying(10),
    "sectionname" character varying(255) NOT NULL,
    "hospitalid" integer NOT NULL,
    "subdepartmentid" integer,
    "lis_code" character varying(10),
    "display_position" integer NOT NULL,
    "departmentid" integer,
    "status" smallint DEFAULT '1' NOT NULL,
    "created_by" character varying(255),
    "created_at" timestamp(0),
    "updated_by" character varying(255),
    "updated_at" timestamp(0),
    CONSTRAINT "hms_section_pkey" PRIMARY KEY ("sectionid")
) WITH (oids = false);

INSERT INTO "hms_section" ("sectionid", "sectioncode", "sectionname", "hospitalid", "subdepartmentid", "lis_code", "display_position", "departmentid", "status", "created_by", "created_at", "updated_by", "updated_at") VALUES
(1,	'DPANE',	'Acute and Emergency Care',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(2,	'DPACP',	'Advance Care Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(3,	'DPAIP',	'Aging In Place',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(4,	'DPADIP',	'Aging In Place (NUR)',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(5,	'DPANAES',	'Anaesthesia',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(6,	'DPAVE',	'AV & Events Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(7,	'DPBMU',	'Bed Management Unit',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(8,	'DPBIO',	'Biomedical Engineering',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(9,	'DPBDU',	'Business Development',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(10,	'SCFBO',	'Business Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(11,	'SCCARC',	'Cardiac Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(12,	'DPCARDIO',	'Cardiology',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(13,	'DPCARDC',	'Cardiovascular Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(14,	'DPCM',	'Case Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(15,	'DPCSM',	'Casemix Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(16,	'DPCRU',	'Clinical Research Unit',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(17,	'DPCSD',	'Clinical Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(18,	'SCLAB',	'Compounding Lab',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(19,	'DPCOM',	'Corporate Communications',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(20,	'DPCSS',	'CSSU',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(21,	'DPCCC',	'Customer Contact Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(22,	'SCDSC',	'Day Surgery Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(23,	'SCDENC',	'Dental Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(24,	'DPDENTAL',	'Dental Surgery',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(25,	'SCDERMC',	'Derma Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(26,	'SCDIAB',	'Diabetes',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(27,	'SCDIABC',	'Diabetes Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(28,	'DPDDR',	'Diagnostic Radiology',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(29,	'DPEDO',	'Education Development Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(30,	'DPEP',	'Emergency Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(31,	'SCENDOC',	'Endocrine Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(32,	'SCENDO',	'Endocrinology',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(33,	'SCEC',	'Endoscopy Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(34,	'DPENT',	'ENT',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(35,	'SCENTC',	'ENT Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(36,	'DPESA',	'Environmental Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(37,	'DPEYE',	'Eye',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(38,	'SCEYEC',	'Eye Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(39,	'DPFD',	'Facilities Development',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(40,	'DPFAC',	'Facilities Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(41,	'SCFCM',	'Family and Community Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(42,	'SCFIN',	'Finance & Accounting',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(43,	'SCGASC',	'Gastroenterology Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(44,	'DPGENMED',	'General Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(45,	'SCGMC',	'General Medicine Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(46,	'SCGSUR',	'General Surgery',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(47,	'SCGSC',	'General Surgery Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(48,	'SCGRM',	'Geriatric Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(49,	'SCGRMC',	'Geriatric Outpatient Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(50,	'SCHFLC',	'Health For Life Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(51,	'SCHFLCO',	'Health For Life Centre - Outreach',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(52,	'DPHCS',	'Home Care Service',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(53,	'DPADM',	'Hospital Administration',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(54,	'DPHP',	'Hospital Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(55,	'SCHRD',	'Human Resource Development',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(56,	'SCHRM',	'Human Resource Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(57,	'SCICUCCU',	'ICU 1 (CCU)',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(58,	'SCICUMED',	'ICU 1 (Medical)',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(59,	'SCICUSUR',	'ICU 2 (Surgical)',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(60,	'DPIC',	'Infection Control',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(61,	'DPINN',	'Innovation & Research',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(62,	'DPHCA',	'Inpatient HCAs',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(63,	'DPIPS',	'Inpatient Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(64,	'SCISOW',	'Isolation Ward',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(65,	'DPKTC',	'Kitchen',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(66,	'DPLAB',	'Laboratory Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(67,	'DPLABM',	'Laboratory Medicine (Drs)',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(68,	'DPLIN',	'Linen Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(69,	'DPMLR',	'Mail Room',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(70,	'SCMOT',	'Major Operating Theatre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(71,	'DPMMD',	'Materials Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(72,	'DPMRO',	'Medical Records Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(73,	'DPMSS',	'Medical Social Service',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(74,	'SCNEUROC',	'Neurosurgery Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(75,	'DPNM',	'Nursing Administration',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(76,	'DPNUT',	'Nutrition & Dietetics',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(77,	'SCOTH',	'Occupational Therapy',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(78,	'SCOPATC',	'OPAT Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(79,	'DPOPA',	'Operation Admin',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(80,	'DPOPT',	'Operations Admin/Tenancy',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(81,	'DPOPS',	'Operations Support',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(82,	'SCORTHO',	'Orthopaedic Surgery',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(83,	'SCORTHSC',	'Orthopaedic Surgery Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(84,	'DPPFU',	'Patient Feedback Unit',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(85,	'DPPSC',	'Patient Service Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(86,	'SCINP',	'Pharmacy Inpatient',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(87,	'SCOPT',	'Pharmacy Outpatient',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(88,	'SCRET',	'Pharmacy Retail',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(89,	'SCSTR',	'Pharmacy Store',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(90,	'SCPHY',	'Physiotherapy',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(91,	'DPPOPH',	'Population Health',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(92,	'DPPOR',	'Portering',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(93,	'DPPSY',	'Psychological Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(94,	'SCPSYW',	'Psychological Wellness Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(95,	'DPQRM',	'Quality and Risk Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(96,	'DPRC',	'Renal Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(97,	'SCRENAL',	'Renal Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(98,	'DPRPO',	'Residency Program Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(99,	'SCRESM',	'Respiratory Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(100,	'SCRESMC',	'Respiratory Medicine Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(101,	'DPRTS',	'Respiratory Therapy Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(102,	'DPSEC',	'Security',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(103,	'SCSPE',	'Speech Therapy',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(104,	'DPSS',	'Sponsored Student',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(105,	'SCSTC',	'Sports Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(106,	'SCSPTM',	'Sports Medicine',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(107,	'SCSTAFFC',	'Staff Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(108,	'SCABL',	'The Able Studio',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(109,	'DPTC',	'Transitional Care',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(110,	'DPTRN',	'Transport',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(111,	'DPURO',	'Urology',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(112,	'SCUROC',	'Urology Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(113,	'SCWA51',	'Ward A51',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(114,	'SCWA52',	'Ward A52',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(115,	'SCWA61',	'Ward A61',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(116,	'SCWA62',	'Ward A62',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(117,	'SCWA71',	'Ward A71',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(118,	'SCWA72',	'Ward A72',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(119,	'SCWA82',	'Ward A82',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(120,	'SCWV105',	'Ward B105',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(121,	'SCWB106',	'Ward B106',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(122,	'SCWB55',	'Ward B55',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(123,	'SCWB56',	'Ward B56',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(124,	'SCWB65',	'Ward B65',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(125,	'SCWB66',	'Ward B66',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(126,	'SCWB75',	'Ward B75',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(127,	'SCWB76',	'Ward B76',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(128,	'SCWB85',	'Ward B85',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(129,	'SCWB86',	'Ward B86',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(130,	'SCWB95',	'Ward B95',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(131,	'SCWB96',	'Ward B96',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(132,	'SCWOC',	'Women Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(133,	'DPWMC',	'Woodlands Medical Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(134,	'DVYCH',	'Yishun Community Hospital',	'{{ hospital_id }}',	NULL,	NULL,	100,	1,	1,	NULL,	NULL,	NULL,	NULL),
(135,	'SCK3014010',	'Medicine (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	2,	1,	NULL,	NULL,	NULL,	NULL),
(136,	'SCK3017010',	'Orthopaedic Surgery (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	489,	1,	NULL,	NULL,	NULL,	NULL),
(137,	'SCK2014020',	'Dermatology Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	491,	1,	NULL,	NULL,	NULL,	NULL),
(170,	'SCK3015010',	'Surgery (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	3,	1,	NULL,	NULL,	NULL,	NULL),
(203,	'DPSUBC',	'Subway Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	558,	1,	NULL,	NULL,	NULL,	NULL),
(204,	'DVWIHC',	'Woodlands Integrated Hospital Campus',	'{{ hospital_id }}',	NULL,	NULL,	100,	559,	1,	NULL,	NULL,	NULL,	NULL),
(205,	'DPAMC',	'Admiralty Medical Centre',	'{{ hospital_id }}',	NULL,	NULL,	100,	560,	1,	NULL,	NULL,	NULL,	NULL),
(236,	'DPLOB',	'Lobby',	'{{ hospital_id }}',	NULL,	NULL,	100,	455,	1,	NULL,	NULL,	NULL,	NULL),
(237,	'SCK3017080',	'Sports Medicine (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	60,	1,	NULL,	NULL,	NULL,	NULL),
(364,	'DPOCI',	'Office Of Clinical Informatics',	'{{ hospital_id }}',	NULL,	NULL,	100,	852,	1,	NULL,	NULL,	NULL,	NULL),
(271,	'DPAHSPROO',	'Ahs Programme Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	636,	1,	NULL,	NULL,	NULL,	NULL),
(272,	'SCK3012010',	'Geriatric Medicine (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	4,	1,	NULL,	NULL,	NULL,	NULL),
(273,	'SCK3021010',	'Dental Surgery (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	24,	1,	NULL,	NULL,	NULL,	NULL),
(274,	'DPGERI',	'Geri',	'{{ hospital_id }}',	NULL,	NULL,	100,	638,	1,	NULL,	NULL,	NULL,	NULL),
(275,	'DPGERINT',	'Gericare@north',	'{{ hospital_id }}',	NULL,	NULL,	100,	644,	1,	NULL,	NULL,	NULL,	NULL),
(365,	'DPAIPCCT',	'Aip-cct',	'{{ hospital_id }}',	NULL,	NULL,	100,	853,	1,	NULL,	NULL,	NULL,	NULL),
(309,	'WIHCM',	'Woodlands Integrated Healthcare Campus',	'{{ hospital_id }}',	NULL,	NULL,	100,	559,	1,	NULL,	NULL,	NULL,	NULL),
(310,	'NASS',	'Nursing Admin (sponsored Student)',	'{{ hospital_id }}',	NULL,	NULL,	100,	787,	1,	NULL,	NULL,	NULL,	NULL),
(311,	'SCK3011010',	'Anaesthesia (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	7,	1,	NULL,	NULL,	NULL,	NULL),
(312,	'SCK3015130',	'Ent (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	29,	1,	NULL,	NULL,	NULL,	NULL),
(313,	'SCK2700010',	'Icu 1',	'{{ hospital_id }}',	NULL,	NULL,	100,	797,	1,	NULL,	NULL,	NULL,	NULL),
(314,	'SCK3100400',	'Material Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	801,	1,	NULL,	NULL,	NULL,	NULL),
(315,	'SCK3100100',	'Operational Support',	'{{ hospital_id }}',	NULL,	NULL,	100,	803,	1,	NULL,	NULL,	NULL,	NULL),
(316,	'SCK3014060',	'Cardiology (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	5,	1,	NULL,	NULL,	NULL,	NULL),
(317,	'SCK2700020',	'Icu 2',	'{{ hospital_id }}',	NULL,	NULL,	100,	806,	1,	NULL,	NULL,	NULL,	NULL),
(318,	'SCK2300020',	'Physiotherapy (sports/geri/podiatry)',	'{{ hospital_id }}',	NULL,	NULL,	100,	498,	1,	NULL,	NULL,	NULL,	NULL),
(319,	'SCK2700030',	'Cardiac Care Unit',	'{{ hospital_id }}',	NULL,	NULL,	100,	797,	1,	NULL,	NULL,	NULL,	NULL),
(320,	'SCK2999991',	'Children Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	817,	1,	NULL,	NULL,	NULL,	NULL),
(308,	'DPPSYS',	'Psychology Service',	'{{ hospital_id }}',	NULL,	NULL,	100,	679,	1,	NULL,	NULL,	NULL,	NULL),
(321,	'SCYD57',	'Ward D57',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(322,	'SCYD58',	'Ward D58',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(323,	'SCYD107',	'Ward D107',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(324,	'SCYD97',	'Ward D97',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(325,	'SCYD68',	'Ward D68',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(326,	'DPWCSP',	'Clinical Services Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	821,	1,	NULL,	NULL,	NULL,	NULL),
(327,	'SCYD88',	'Ward D88',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(328,	'SCYD67',	'Ward D67',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(329,	'SCYD77',	'Ward D77',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(330,	'DPWOPP',	'Operations Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	822,	1,	NULL,	NULL,	NULL,	NULL),
(331,	'DPYOPA',	'Operations Admin',	'{{ hospital_id }}',	NULL,	NULL,	100,	823,	1,	NULL,	NULL,	NULL,	NULL),
(332,	'DPWFIN',	'Finance',	'{{ hospital_id }}',	NULL,	NULL,	100,	36,	1,	NULL,	NULL,	NULL,	NULL),
(333,	'DPWAN',	'Analytics',	'{{ hospital_id }}',	NULL,	NULL,	100,	824,	1,	NULL,	NULL,	NULL,	NULL),
(334,	'SCYD108',	'Ward D108',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(335,	'SCYD98',	'Ward D98',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(336,	'SCYD78',	'Ward D78',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(337,	'SCYD87',	'Ward D87',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(338,	'DPWNURS',	'Nursing Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	825,	1,	NULL,	NULL,	NULL,	NULL),
(339,	'SCYD48',	'Ward D48',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(340,	'DPWCDV',	'Corporate Development',	'{{ hospital_id }}',	NULL,	NULL,	100,	826,	1,	NULL,	NULL,	NULL,	NULL),
(341,	'SCYSUBA',	'Sub-acute (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	4,	1,	NULL,	NULL,	NULL,	NULL),
(342,	'DPWCOP',	'Clinical Operations',	'{{ hospital_id }}',	NULL,	NULL,	100,	827,	1,	NULL,	NULL,	NULL,	NULL),
(343,	'DPWHAD',	'Hospital Admin',	'{{ hospital_id }}',	NULL,	NULL,	100,	828,	1,	NULL,	NULL,	NULL,	NULL),
(344,	'DPYEVMGT',	'Event Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	829,	1,	NULL,	NULL,	NULL,	NULL),
(345,	'DPWCE',	'Communications & Engagement',	'{{ hospital_id }}',	NULL,	NULL,	100,	830,	1,	NULL,	NULL,	NULL,	NULL),
(346,	'DPYRAU',	'Referral And Admission Unit',	'{{ hospital_id }}',	NULL,	NULL,	100,	831,	1,	NULL,	NULL,	NULL,	NULL),
(347,	'SCWA78',	'Ktph Ward D78',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(348,	'DPOVS',	'Ophthalmology And Visual Sciences',	'{{ hospital_id }}',	NULL,	NULL,	100,	833,	1,	NULL,	NULL,	NULL,	NULL),
(349,	'DPWCS',	'Corporate Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	835,	1,	NULL,	NULL,	NULL,	NULL),
(350,	'DVWAHS',	'Allied Health Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	838,	1,	NULL,	NULL,	NULL,	NULL),
(351,	'DPWOA',	'Office Admin',	'{{ hospital_id }}',	NULL,	NULL,	100,	839,	1,	NULL,	NULL,	NULL,	NULL),
(352,	'DPWOD',	'Organisation Development',	'{{ hospital_id }}',	NULL,	NULL,	100,	840,	1,	NULL,	NULL,	NULL,	NULL),
(353,	'SCWA87',	'Ktph Ward D87',	'{{ hospital_id }}',	NULL,	NULL,	100,	175,	1,	NULL,	NULL,	NULL,	NULL),
(354,	'DPWNUR',	'Nursing Services Manpower',	'{{ hospital_id }}',	NULL,	NULL,	100,	843,	1,	NULL,	NULL,	NULL,	NULL),
(355,	'AHI',	'Alexandra Health Institute',	'{{ hospital_id }}',	NULL,	NULL,	1000,	93,	1,	NULL,	NULL,	NULL,	NULL),
(356,	'AIP',	'Ageing In Place',	'{{ hospital_id }}',	NULL,	NULL,	1000,	93,	1,	NULL,	NULL,	NULL,	NULL),
(366,	'DPPOD',	'Podiatry',	'{{ hospital_id }}',	NULL,	NULL,	100,	854,	1,	NULL,	NULL,	NULL,	NULL),
(270,	'SCK3015120',	'Eye (doctors)',	'{{ hospital_id }}',	NULL,	NULL,	100,	32,	1,	NULL,	NULL,	NULL,	NULL),
(357,	'DVWMS',	'Medical Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	834,	1,	NULL,	NULL,	NULL,	NULL),
(358,	'SCCQ',	'Clinical Quality',	'{{ hospital_id }}',	NULL,	NULL,	100,	7,	1,	NULL,	NULL,	NULL,	NULL),
(359,	'DPYKIT',	'Food Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	849,	1,	NULL,	NULL,	NULL,	NULL),
(360,	'SCMINFO',	'Medical Informatics',	'{{ hospital_id }}',	NULL,	NULL,	100,	7,	1,	NULL,	NULL,	NULL,	NULL),
(361,	'SCCFM',	'Clinical Feedback Management',	'{{ hospital_id }}',	NULL,	NULL,	100,	7,	1,	NULL,	NULL,	NULL,	NULL),
(362,	'SCMA',	'Medical Affairs',	'{{ hospital_id }}',	NULL,	NULL,	100,	7,	1,	NULL,	NULL,	NULL,	NULL),
(363,	'DPSOCSEV',	'Soc Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	850,	1,	NULL,	NULL,	NULL,	NULL),
(367,	'DVWPOPS',	'Pre Operations',	'{{ hospital_id }}',	NULL,	NULL,	100,	855,	1,	NULL,	NULL,	NULL,	NULL),
(368,	'DPWCCT',	'Community Care Transformation',	'{{ hospital_id }}',	NULL,	NULL,	100,	856,	1,	NULL,	NULL,	NULL,	NULL),
(369,	'DPWTO',	'Transformation Office',	'{{ hospital_id }}',	NULL,	NULL,	100,	857,	1,	NULL,	NULL,	NULL,	NULL),
(370,	'DPWBO',	'Patient Billing Services',	'{{ hospital_id }}',	NULL,	NULL,	100,	858,	1,	NULL,	NULL,	NULL,	NULL),
(371,	'DPWIDFE',	'Infra Dev & Fac Engineering',	'{{ hospital_id }}',	NULL,	NULL,	100,	860,	1,	NULL,	NULL,	NULL,	NULL),
(372,	'DPWCP',	'Campus Planning',	'{{ hospital_id }}',	NULL,	NULL,	100,	861,	1,	NULL,	NULL,	NULL,	NULL),
(373,	'DPWDOKI',	'Knowledge & Innovation',	'{{ hospital_id }}',	NULL,	NULL,	100,	862,	1,	NULL,	NULL,	NULL,	NULL),
(374,	'DPWPREH',	'Pre Hospital',	'{{ hospital_id }}',	NULL,	NULL,	100,	863,	1,	NULL,	NULL,	NULL,	NULL),
(375,	'DPWASOC',	'Ambulatory & Soc Operations',	'{{ hospital_id }}',	NULL,	NULL,	100,	864,	1,	NULL,	NULL,	NULL,	NULL),
(376,	'DPWMED',	'Medicine & Community',	'{{ hospital_id }}',	NULL,	NULL,	100,	865,	1,	NULL,	NULL,	NULL,	NULL),
(377,	'DPWINF',	'Informatics',	'{{ hospital_id }}',	NULL,	NULL,	100,	866,	1,	NULL,	NULL,	NULL,	NULL),
(378,	'DPWINPO',	'Inpatient Operations',	'{{ hospital_id }}',	NULL,	NULL,	100,	867,	1,	NULL,	NULL,	NULL,	NULL),
(379,	'DPWIDIFE',	'Infrastructure & Engineering',	'{{ hospital_id }}',	NULL,	NULL,	100,	868,	1,	NULL,	NULL,	NULL,	NULL),
(380,	'DPWAH',	'Allied Health Manpower',	'{{ hospital_id }}',	NULL,	NULL,	100,	869,	1,	NULL,	NULL,	NULL,	NULL),
(381,	'DVWOPS',	'Operations',	'{{ hospital_id }}',	NULL,	NULL,	100,	563,	1,	NULL,	NULL,	NULL,	NULL),
(382,	'SCPO',	'Prosthetist And Orthotist',	'{{ hospital_id }}',	NULL,	NULL,	100,	189,	1,	NULL,	NULL,	NULL,	NULL),
(384,	'SCICODC',	'Icod Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	177,	1,	NULL,	NULL,	NULL,	NULL),
(385,	'SCRHEUMC',	'Rheumatology Clinic',	'{{ hospital_id }}',	NULL,	NULL,	100,	177,	1,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "hms_message_type_config";
DROP SEQUENCE IF EXISTS hms_message_type_config_config_id_seq;
CREATE SEQUENCE hms_message_type_config_config_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_message_type_config" (
    "config_id" integer DEFAULT nextval('hms_message_type_config_config_id_seq') NOT NULL,
    "msgtype" character varying(20) NOT NULL,
    "msggroup" character varying(20) NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "message_table" character varying(50) NOT NULL,
    "sender_type" character varying(100) NOT NULL,
    "receiver_type" character varying(100) NOT NULL,
    "timeout_time" integer,
    "broadcast_limit" integer DEFAULT '50' NOT NULL,
    "priority" integer DEFAULT '2' NOT NULL,
    "sms_resent" integer,
    "sendmsg_callback_code" character varying(20),
    "timeout_callback_code" character varying(20),
    "reply_callback_code" character varying(20),
    "msg_display_name" character varying(50) NOT NULL,
    "module_access_id" character varying,
    CONSTRAINT "hms_message_type_config_pkey" PRIMARY KEY ("config_id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_message_type_config"."sender_type" IS 'system|hmsuser|patient';

COMMENT ON COLUMN "public"."hms_message_type_config"."receiver_type" IS 'system|hmsuser|patient|nok';

COMMENT ON COLUMN "public"."hms_message_type_config"."timeout_time" IS 'minutes';

COMMENT ON COLUMN "public"."hms_message_type_config"."priority" IS '1-3';

INSERT INTO "hms_message_type_config" ("config_id", "msgtype", "msggroup", "status", "message_table", "sender_type", "receiver_type", "timeout_time", "broadcast_limit", "priority", "sms_resent", "sendmsg_callback_code", "timeout_callback_code", "reply_callback_code", "msg_display_name", "module_access_id") VALUES
(2,	'normal',	'normal',	1,	'hms_messagelog',	'hmsuser',	'hmsuser',	NULL,	50,	2,	NULL,	NULL,	NULL,	NULL,	'Normal Message',	NULL),
(3,	'urgent',	'urgent',	1,	'hms_messagelog',	'hmsuser',	'hmsuser',	NULL,	50,	3,	NULL,	NULL,	NULL,	NULL,	'Urgent Message',	NULL),
(4,	'ebroadcast',	'ebroadcast',	1,	'hms_messagelog',	'hmsuser',	'hmsuser',	10,	50,	3,	1,	'EBC_SENT',	NULL,	NULL,	'Emergency Broadcast',	NULL),
(1,	'info',	'info',	1,	'hms_messagelog',	'hmsuser|system',	'hmsuser',	NULL,	50,	1,	NULL,	NULL,	NULL,	NULL,	'Info Message',	NULL),
(5,	'cvnormal',	'cvnormal',	1,	'hms_messagelog',	'hmsuser',	'hmsuser',	NULL,	50,	2,	NULL,	'CV_NORMAL',	NULL,	NULL,	'Contact Verification Message',	'35');


DROP TABLE IF EXISTS "hms_patient";
DROP SEQUENCE IF EXISTS hms_patient_patient_id_seq;
CREATE SEQUENCE hms_patient_patient_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient" (
    "patient_id" integer DEFAULT nextval('hms_patient_patient_id_seq') NOT NULL,
    "patient_int_id" character varying(50),
    "patient_ext_id" character varying(50),
    "patient_name" character varying NOT NULL,
    "patient_dob" date,
    "patient_sex" character(1),
    "patient_address" text,
    "patient_contact_no" character varying(50),
    "patient_status" integer DEFAULT '0' NOT NULL,
    "department_code" character varying(10),
    "patient_visit_id" character varying(30),
    "att_doctor_id" character varying(20),
    "att_doctor_name" character varying,
    "att_doctor_pos" character varying(10),
    "adm_doctor_id" character varying(30),
    "adm_doctor_name" character varying,
    "adm_doctor_pos" character varying(10),
    "location_id" character varying(30),
    "location_name" character varying,
    "bed_no" character varying(30),
    "admit_date_time" timestamp,
    "discharge_date_time" timestamp,
    "movement_code" character varying(10),
    "movement_type" character varying(50),
    "treatment_code" character varying(10),
    "treatment_category" character varying(50),
    "movement_date_time" timestamp,
    "msg_control_id" character varying(30),
    "msg_date_time" timestamp,
    "event_type" character varying(3),
    "event_trigger" character varying(3),
    "movement_category" character varying(10),
    "patient_class" character(1),
    "patient_financial_code" character varying(20),
    "room_no" character varying(30),
    "home_no" character varying,
    "office_no" character varying,
    "mobile_no" character varying,
    "patient_email" character varying,
    "patient_race" character varying,
    "created_date" timestamp,
    "created_by" character varying,
    "last_updated_date" timestamptz,
    "last_updated_by" character varying,
    "mobile_last_update_date" timestamp,
    "mobile_last_update_by" character varying,
    "vip_status" character varying,
    "vvip_status" character varying,
    "death_status" character varying,
    "death_date_time" timestamp,
    "hospital_id" integer,
    "death_reason" character varying(100),
    "accident_code" character varying(5),
    "movement_no" character varying(5),
    "doctor_specialty" character varying(10),
    "patient_nationality" character varying(5),
    "patient_birth_country" character varying(5),
    "patient_resident_country" character varying(5),
    CONSTRAINT "hms_patient_unique_patient_ext_id" UNIQUE ("patient_ext_id"),
    CONSTRAINT "patient_key" PRIMARY KEY ("patient_id")
) WITH (oids = false);

CREATE INDEX "patient_admit_date_time" ON "public"."hms_patient" USING btree ("admit_date_time");

CREATE INDEX "patient_att_doctor_index" ON "public"."hms_patient" USING btree ("att_doctor_id");

CREATE INDEX "patient_contact_no_index" ON "public"."hms_patient" USING btree ("patient_contact_no");

CREATE INDEX "patient_death_status" ON "public"."hms_patient" USING btree ("death_status");

CREATE INDEX "patient_department_code" ON "public"."hms_patient" USING btree ("department_code");

CREATE INDEX "patient_hospital_id" ON "public"."hms_patient" USING btree ("hospital_id");

CREATE INDEX "patient_location_id" ON "public"."hms_patient" USING btree ("location_id");

CREATE INDEX "patient_location_name" ON "public"."hms_patient" USING btree ("location_name");

CREATE INDEX "patient_mobile_index" ON "public"."hms_patient" USING btree ("mobile_no");

CREATE INDEX "patient_movement_code" ON "public"."hms_patient" USING btree ("movement_code");

CREATE INDEX "patient_movement_date_time" ON "public"."hms_patient" USING btree ("movement_date_time");

CREATE INDEX "patient_name" ON "public"."hms_patient" USING btree ("patient_name");

CREATE INDEX "patient_patient_class" ON "public"."hms_patient" USING btree ("patient_class");

CREATE INDEX "patient_race" ON "public"."hms_patient" USING btree ("patient_race");

CREATE INDEX "patient_sex" ON "public"."hms_patient" USING btree ("patient_sex");

CREATE INDEX "patient_vip_status" ON "public"."hms_patient" USING btree ("vip_status");

CREATE INDEX "patient_visit_id" ON "public"."hms_patient" USING btree ("patient_visit_id");

CREATE INDEX "patient_vvip_status" ON "public"."hms_patient" USING btree ("vvip_status");

COMMENT ON COLUMN "public"."hms_patient"."patient_ext_id" IS 'NRIC/FIN/Passport';

COMMENT ON COLUMN "public"."hms_patient"."patient_status" IS '0=new, 1=inpatient, 2=outpatient, 3=discharged';

DROP TABLE IF EXISTS "hms_patient_nok";
DROP SEQUENCE IF EXISTS hms_patient_nok_patient_nok_id_seq;
CREATE SEQUENCE hms_patient_nok_patient_nok_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_nok" (
    "patient_nok_id" integer DEFAULT nextval('hms_patient_nok_patient_nok_id_seq') NOT NULL,
    "patient_ext_id" character varying NOT NULL,
    "nok_name" character varying,
    "nok_relationship" character varying,
    "nok_address" text,
    "nok_contact" character varying,
    "status" integer DEFAULT '1' NOT NULL,
    "created_date" timestamp NOT NULL,
    "updated_date" timestamp,
    "updated_by" character varying,
    "nok_email" character varying(50),
    "nok_mobile" character varying(50),
    "nok_pager" character varying(50),
    "nok_gender" character varying(10),
    "nok_language" integer,
    "care_giver" integer DEFAULT '0',
    "spokesman" integer DEFAULT '0',
    CONSTRAINT "patient_nok_pkey" PRIMARY KEY ("patient_nok_id")
) WITH (oids = false);

CREATE INDEX "nok_patient_ext_id" ON "public"."hms_patient_nok" USING btree ("patient_ext_id");

CREATE INDEX "patient_nok_contact_index" ON "public"."hms_patient_nok" USING btree ("nok_contact");

CREATE INDEX "patient_nok_email_index" ON "public"."hms_patient_nok" USING btree ("nok_email");

CREATE INDEX "patient_nok_mobile_index" ON "public"."hms_patient_nok" USING btree ("nok_mobile");

CREATE INDEX "patient_nok_name_index" ON "public"."hms_patient_nok" USING btree ("nok_name");

CREATE INDEX "patient_nok_pager_index" ON "public"."hms_patient_nok" USING btree ("nok_pager");

DROP VIEW IF EXISTS "hms_user_transport_view";
CREATE TABLE "hms_user_transport_view" ("jid" character varying, "name" character varying, "nickname" character varying, "mobile" character varying, "pager" character varying, "email" character varying, "hospitalid" integer, "departmentid" integer, "designationid" integer, "transport_type" integer, "table_name" text);


DROP TABLE IF EXISTS "hms_user_transport_view";
CREATE VIEW "hms_user_transport_view" AS SELECT a.jid,
    a.name,
    b.nickname,
    a.mobile,
    a.pager,
    b.email,
    a.hospitalid,
    a.departmentid,
    a.designationid,
    a.transport_type,
    'hms_doctor'::text AS table_name
   FROM hms_doctor a,
    vcard b,
    vcard_details c
  WHERE (((b.jid)::text = (a.jid)::text) AND ((c.jid)::text = (a.jid)::text) AND ((c.status)::text = 'active'::text))
UNION
 SELECT ((hms_patient_nok.patient_nok_id)::text || ''::text) AS jid,
    hms_patient_nok.nok_name AS name,
    hms_patient_nok.nok_name AS nickname,
        CASE
            WHEN ((hms_patient_nok.nok_mobile)::text <> ''::text) THEN hms_patient_nok.nok_mobile
            ELSE hms_patient_nok.nok_contact
        END AS mobile,
    hms_patient_nok.nok_pager AS pager,
    hms_patient_nok.nok_email AS email,
    NULL::integer AS hospitalid,
    NULL::integer AS departmentid,
    NULL::integer AS designationid,
    NULL::integer AS transport_type,
    'hms_patient_nok'::text AS table_name
   FROM hms_patient_nok
UNION
 SELECT hms_patient.patient_ext_id AS jid,
    hms_patient.patient_name AS name,
    hms_patient.patient_name AS nickname,
        CASE
            WHEN ((hms_patient.mobile_no)::text <> ''::text) THEN hms_patient.mobile_no
            ELSE hms_patient.patient_contact_no
        END AS mobile,
    NULL::character varying AS pager,
    NULL::character varying AS email,
    8 AS hospitalid,
    NULL::integer AS departmentid,
    NULL::integer AS designationid,
    NULL::integer AS transport_type,
    'hms_patient'::text AS table_name
   FROM hms_patient;

DROP TABLE IF EXISTS "hms_characters_to_hex";
DROP SEQUENCE IF EXISTS hms_characters_to_hex_id_seq;
CREATE SEQUENCE hms_characters_to_hex_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_characters_to_hex" (
    "id" integer DEFAULT nextval('hms_characters_to_hex_id_seq') NOT NULL,
    "hex_value" character varying(30),
    "return_char" character varying(3),
    "enc_desc" character varying(70),
    "actual_character" character varying(3),
    CONSTRAINT "hms_character_to_hex_pk" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hms_characters_to_hex" ("id", "hex_value", "return_char", "enc_desc", "actual_character") VALUES
(1,	'EF BC 91',	'1',	'Character 1 - Halfwidth and Fullwidth Forms',	'１'),
(2,	'EF BC 92',	'2',	'Character 2 - Halfwidth and Fullwidth Forms',	'２'),
(3,	'EF BC 93',	'3',	'Character 3 - Halfwidth and Fullwidth Forms',	'３'),
(4,	'E2 82 81',	'1',	'Subscript 1',	'₁'),
(5,	'E2 85 BC',	'1',	'Number Forms Character Set',	'ⅼ');

DROP TABLE IF EXISTS "hms_patient_appointment";
DROP SEQUENCE IF EXISTS hms_patient_appointment_appointment_id_seq;
CREATE SEQUENCE hms_patient_appointment_appointment_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment" (
    "appointment_id" bigint DEFAULT nextval('hms_patient_appointment_appointment_id_seq') NOT NULL,
    "patient_ext_id" character varying(50) NOT NULL,
    "patient_name" character varying,
    "patient_visit_id" character varying(30),
    "movement_no" character varying(5),
    "appointment_timestamp" timestamp,
    "appointment_date" date,
    "appointment_time" time without time zone,
    "status" character varying(20) DEFAULT 'new',
    "department_code" character varying(10),
    "department_name" character varying(100),
    "location_code" character varying(10),
    "location_name" character varying(100),
    "followup_done_flag" integer DEFAULT '0',
    "uncontactable_flag" integer DEFAULT '0',
    "remarks" text,
    "created_timestamp" timestamp,
    "hospital_id" integer,
    "cancel_timestamp" timestamp,
    "message_flag" integer DEFAULT '0',
    "msg_response_count" integer DEFAULT '0',
    "group_appointment_id" bigint,
    "reminder_statuscode" integer,
    "next_reminder_sent_timestamp" timestamp,
    "reminder_level" integer DEFAULT '0' NOT NULL,
    "close_flag" integer DEFAULT '0' NOT NULL,
    "next_reminder_id" bigint,
    "reminder_timestamp" timestamp,
    "close_timestamp" timestamp,
    "followup_done2_flag" integer DEFAULT '0',
    "followup_done3_flag" integer DEFAULT '0',
    "reminder_response_message" character varying,
    "late_response_timestamp" timestamp,
    "followup_lock_flag" integer DEFAULT '0' NOT NULL,
    "appointment_class" character varying(20),
    "visit_type" character varying(50),
    CONSTRAINT "hms_patient_appointment_pkey" PRIMARY KEY ("appointment_id")
) WITH (oids = false);

CREATE INDEX "appointment_report_index" ON "public"."hms_patient_appointment" USING btree ("status", "appointment_class", "appointment_date", "appointment_date");


DROP TABLE IF EXISTS "hms_patient_appointment_action_log";
DROP SEQUENCE IF EXISTS hms_patient_appointment_action_log_log_id_seq;
CREATE SEQUENCE hms_patient_appointment_action_log_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_action_log" (
    "log_id" integer DEFAULT nextval('hms_patient_appointment_action_log_log_id_seq') NOT NULL,
    "updated_by" character varying(100) NOT NULL,
    "updated_date" timestamp NOT NULL,
    "appointment_id" integer NOT NULL,
    "patient_ext_id" character varying(50),
    "old_value" text,
    "new_value" text,
    "updated_field" character varying(50),
    CONSTRAINT "hms_patient_appointment_action_log_pkey" PRIMARY KEY ("log_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_archive";
CREATE TABLE "public"."hms_patient_appointment_archive" (
    "appointment_id" bigint NOT NULL,
    "patient_ext_id" character varying(50) NOT NULL,
    "patient_name" character varying,
    "patient_visit_id" character varying(30),
    "movement_no" character varying(5),
    "appointment_timestamp" timestamp,
    "appointment_date" date,
    "appointment_time" time without time zone,
    "status" character varying(20) DEFAULT 'new',
    "department_code" character varying(10),
    "department_name" character varying(100),
    "location_code" character varying(10),
    "location_name" character varying(100),
    "followup_done_flag" integer DEFAULT '0',
    "uncontactable_flag" integer DEFAULT '0',
    "remarks" text,
    "created_timestamp" timestamp,
    "hospital_id" integer,
    "cancel_timestamp" timestamp,
    "message_flag" integer DEFAULT '0',
    "msg_response_count" integer DEFAULT '0',
    "group_appointment_id" bigint,
    "reminder_statuscode" integer,
    "next_reminder_sent_timestamp" timestamp,
    "reminder_level" integer DEFAULT '0' NOT NULL,
    "close_flag" integer DEFAULT '0' NOT NULL,
    "next_reminder_id" bigint,
    "reminder_timestamp" timestamp,
    "close_timestamp" timestamp,
    "followup_done2_flag" integer DEFAULT '0',
    "followup_done3_flag" integer DEFAULT '0',
    "reminder_response_message" character varying,
    "late_response_timestamp" timestamp,
    CONSTRAINT "hms_patient_appointment_archive_pkey" PRIMARY KEY ("appointment_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_department";
DROP SEQUENCE IF EXISTS hms_patient_appointment_department_department_id_seq;
CREATE SEQUENCE hms_patient_appointment_department_department_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_department" (
    "department_id" integer DEFAULT nextval('hms_patient_appointment_department_department_id_seq') NOT NULL,
    "department_code" character varying(20),
    "department_name" character varying,
    "display_status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "hms_patient_appointment_department_pkey" PRIMARY KEY ("department_id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_patient_appointment_department"."display_status" IS '1=display';


DROP TABLE IF EXISTS "hms_patient_appointment_email_report_recipients";
DROP SEQUENCE IF EXISTS hms_patient_appointment_email_report_recipients_id_seq;
CREATE SEQUENCE hms_patient_appointment_email_report_recipients_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_email_report_recipients" (
    "id" integer DEFAULT nextval('hms_patient_appointment_email_report_recipients_id_seq') NOT NULL,
    "report_type_code" character varying(50) NOT NULL,
    "hospital_id" integer NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "recipient_email" text,
    "sent_time" character varying(20),
    "next_sent_timestamp" timestamp,
    "flag_mon" integer DEFAULT '0' NOT NULL,
    "flag_tue" integer DEFAULT '0' NOT NULL,
    "flag_wed" integer DEFAULT '0' NOT NULL,
    "flag_thu" integer DEFAULT '0' NOT NULL,
    "flag_fri" integer DEFAULT '0' NOT NULL,
    "flag_sat" integer DEFAULT '0' NOT NULL,
    "flag_sun" integer DEFAULT '0' NOT NULL,
    "flag_ph" integer DEFAULT '0' NOT NULL,
    "report_email_title" character varying(100),
    "report_file_name" character varying(50),
    "appointment_class" character varying(20),
    CONSTRAINT "hms_patient_appointment_email__report_type_code_hospital_id_key" UNIQUE ("report_type_code", "hospital_id"),
    CONSTRAINT "hms_patient_appointment_email_report_recipients_pkey1" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_email_report_type";
CREATE TABLE "public"."hms_patient_appointment_email_report_type" (
    "type_code" character varying(50) NOT NULL,
    "display_name" character varying(100),
    "description" text,
    "remarks" text,
    CONSTRAINT "hms_patient_appointment_email_report_type_pkey" PRIMARY KEY ("type_code")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_file_log";
DROP SEQUENCE IF EXISTS hms_patient_appointment_file_log_log_id_seq;
CREATE SEQUENCE hms_patient_appointment_file_log_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_file_log" (
    "log_id" integer DEFAULT nextval('hms_patient_appointment_file_log_log_id_seq') NOT NULL,
    "hospital_id" integer,
    "log_date" date NOT NULL,
    "created_timestamp" timestamp,
    "file_name" character varying(200),
    "valid_flag" integer DEFAULT '0' NOT NULL,
    "processed_flag" integer DEFAULT '0' NOT NULL,
    "duplicated_flag" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "hms_patient_appointment_file_log_pkey" PRIMARY KEY ("log_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_location";
DROP SEQUENCE IF EXISTS hms_patient_appointment_location_location_id_seq;
CREATE SEQUENCE hms_patient_appointment_location_location_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_location" (
    "location_id" integer DEFAULT nextval('hms_patient_appointment_location_location_id_seq') NOT NULL,
    "location_code" character varying(20),
    "location_name" character varying,
    "display_status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "hms_patient_appointment_location_pkey" PRIMARY KEY ("location_id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."hms_patient_appointment_location"."display_status" IS '1=display';


DROP TABLE IF EXISTS "hms_patient_appointment_messagelog";
DROP SEQUENCE IF EXISTS hms_patient_appointment_messagelog_appointment_msgid_seq;
CREATE SEQUENCE hms_patient_appointment_messagelog_appointment_msgid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_messagelog" (
    "appointment_msgid" bigint DEFAULT nextval('hms_patient_appointment_messagelog_appointment_msgid_seq') NOT NULL,
    "appointment_id" bigint NOT NULL,
    "patient_ext_id" character varying(50),
    "patient_visit_id" character varying(30),
    "appointment_date" date,
    "appointment_id_list" text,
    "message" text,
    "sent_timestamp" timestamp,
    "status" character varying(20) DEFAULT 'sent',
    "sent_msgid" bigint,
    "reply_msgid" character varying,
    "patient_mobile" character varying(30),
    "statuscode" integer,
    "hospital_id" integer,
    "msg_template_id" integer,
    "msg_template" character varying,
    "reminder_level" integer,
    "direction" character varying(20) DEFAULT 'outgoing',
    "msg_type_code" character varying(20),
    "sender" character varying(100),
    "sender_name" character varying(100),
    "receiver" character varying(100),
    "receiver_name" character varying(100),
    "location" character varying(100),
    "message_ref_id" bigint,
    "appointment_class" character varying(20),
    "visit_type" character varying(50),
    CONSTRAINT "hms_patient_appointment_messagelog_pkey" PRIMARY KEY ("appointment_msgid"),
    CONSTRAINT "hms_patient_appointment_messagelog_ukey" UNIQUE ("appointment_id", "message", "patient_mobile", "message_ref_id", "reminder_level")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_messagelog_migration";
CREATE TABLE "public"."hms_patient_appointment_messagelog_migration" (
    "old_appointment_msgid" bigint,
    "new_appointment_msgid" bigint
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_migration";
CREATE TABLE "public"."hms_patient_appointment_migration" (
    "old_appointment_id" bigint,
    "new_appointment_id" bigint
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_msg_template";
DROP SEQUENCE IF EXISTS hms_patient_appointment_msg_template_msg_template_id_seq;
CREATE SEQUENCE hms_patient_appointment_msg_template_msg_template_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_msg_template" (
    "msg_template_id" integer DEFAULT nextval('hms_patient_appointment_msg_template_msg_template_id_seq') NOT NULL,
    "template_name" character varying NOT NULL,
    "template_message" character varying,
    "template_type_id" integer DEFAULT '2',
    "created_by" character varying,
    "created_timestamp" timestamp,
    "last_update_by" character varying,
    "last_update_timestamp" timestamp,
    "status" integer DEFAULT '1' NOT NULL,
    "hospital_id" integer NOT NULL,
    "active_flag" integer DEFAULT '1' NOT NULL,
    "appointment_class" character varying(20),
    CONSTRAINT "hms_patient_appointment_msg_template_pkey" PRIMARY KEY ("msg_template_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_msg_template_type";
CREATE TABLE "public"."hms_patient_appointment_msg_template_type" (
    "template_id" integer NOT NULL,
    "template_type" character varying(50) NOT NULL,
    "template_name" character varying(50),
    CONSTRAINT "hms_patient_appointment_msg_template_type_pkey" PRIMARY KEY ("template_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_msg_type";
CREATE TABLE "public"."hms_patient_appointment_msg_type" (
    "msg_type" character varying NOT NULL,
    "display_name" character varying NOT NULL,
    "remarks" text,
    CONSTRAINT "hms_patient_appointment_msg_type_pkey" PRIMARY KEY ("msg_type")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_raw";
DROP SEQUENCE IF EXISTS hms_patient_appointment_raw_id_seq;
CREATE SEQUENCE hms_patient_appointment_raw_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_raw" (
    "id" integer DEFAULT nextval('hms_patient_appointment_raw_id_seq') NOT NULL,
    "mobile" character varying,
    "nric" character varying,
    "title" character varying,
    "name" character varying,
    "department" character varying,
    "appt_date" date,
    "appt_time" time without time zone,
    "location" character varying,
    "visit_type" character varying,
    "class_code" character varying,
    "table_name" character varying,
    "table_type" character varying,
    "status" integer DEFAULT '0' NOT NULL,
    "processed_timestamp" timestamp,
    "created_by" character varying NOT NULL,
    "created_timestamp" timestamp DEFAULT '2019-12-03 17:01:56.087049' NOT NULL,
    "modified_by" character varying,
    "modified_timestamp" timestamp,
    CONSTRAINT "hms_patient_appointment_raw_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_reminder_details";
CREATE TABLE "public"."hms_patient_appointment_reminder_details" (
    "appointment_id" bigint NOT NULL,
    "reminder_statuscode" integer,
    "reminder_process_timestamp" timestamp,
    "reported_flag" integer DEFAULT '0',
    CONSTRAINT "hms_patient_appointment_reminder_details_pkey" PRIMARY KEY ("appointment_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_reminder_schedule";
DROP SEQUENCE IF EXISTS hms_patient_appointment_reminder_schedule_schedule_id_seq;
CREATE SEQUENCE hms_patient_appointment_reminder_schedule_schedule_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_reminder_schedule" (
    "schedule_id" bigint DEFAULT nextval('hms_patient_appointment_reminder_schedule_schedule_id_seq') NOT NULL,
    "created_timestamp" timestamp,
    "sent_timestamp" timestamp,
    "appointment_id" bigint,
    "reminder_level" integer,
    "status" character varying(20),
    "status_remarks" character varying(50),
    "reminder_statuscode" integer,
    "appointment_class" character varying(20),
    CONSTRAINT "hms_patient_appointment_reminder_schedule_pkey" PRIMARY KEY ("schedule_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_reminder_statuscode";
CREATE TABLE "public"."hms_patient_appointment_reminder_statuscode" (
    "statuscode" integer NOT NULL,
    "display_text" character varying(50),
    "description" character varying,
    CONSTRAINT "hms_patient_appointment_reminder_statuscode_pkey" PRIMARY KEY ("statuscode")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_reminder_whitelist";
DROP SEQUENCE IF EXISTS hms_patient_appointment_reminder_whitelist_appointment_id_seq;
CREATE SEQUENCE hms_patient_appointment_reminder_whitelist_appointment_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_reminder_whitelist" (
    "appointment_id" bigint DEFAULT nextval('hms_patient_appointment_reminder_whitelist_appointment_id_seq') NOT NULL,
    "patient_ext_id" character varying(50) NOT NULL,
    "patient_name" character varying,
    "patient_visit_id" character varying(30),
    "appointment_timestamp" timestamp,
    "appointment_date" date,
    "appointment_time" time without time zone,
    "status" character varying(20) DEFAULT 'new',
    "department_code" character varying(10),
    "department_name" character varying(100),
    "location_code" character varying(10),
    "location_name" character varying(100),
    "created_timestamp" timestamp,
    "hospital_id" integer,
    "group_appointment_id" bigint,
    "appointment_class" character varying(20),
    CONSTRAINT "hms_patient_appointment_reminder_whitelist_pkey" PRIMARY KEY ("appointment_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_salutation";
DROP SEQUENCE IF EXISTS hms_patient_appointment_salutation_salutation_id_seq;
CREATE SEQUENCE hms_patient_appointment_salutation_salutation_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_salutation" (
    "salutation_id" integer DEFAULT nextval('hms_patient_appointment_salutation_salutation_id_seq') NOT NULL,
    "salutation" character varying(10) NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "hms_patient_appointment_salutation_pkey" PRIMARY KEY ("salutation_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_setting";
DROP SEQUENCE IF EXISTS hms_patient_appointment_setting_setting_id_seq;
CREATE SEQUENCE hms_patient_appointment_setting_setting_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_setting" (
    "setting_id" integer DEFAULT nextval('hms_patient_appointment_setting_setting_id_seq') NOT NULL,
    "hospitalid" integer,
    "setting_type" character varying(50),
    "setting_value" character varying(100),
    "description" text,
    "classcode" character varying(20),
    CONSTRAINT "hms_patient_appointment_setting_pkey" PRIMARY KEY ("setting_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hms_patient_appointment_sms_response";
DROP SEQUENCE IF EXISTS hms_patient_appointment_sms_response_reponse_id_seq;
CREATE SEQUENCE hms_patient_appointment_sms_response_reponse_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_patient_appointment_sms_response" (
    "reponse_id" integer DEFAULT nextval('hms_patient_appointment_sms_response_reponse_id_seq') NOT NULL,
    "response_keyword" character varying(100) NOT NULL,
    "response_message" text,
    "status" integer DEFAULT '1' NOT NULL,
    "last_update_by" character varying,
    "last_update_timestamp" timestamp,
    "hospital_id" integer,
    "valid_response_flag" integer DEFAULT '0' NOT NULL,
    "response_code" character varying(20),
    "late_response_flag" integer DEFAULT '0' NOT NULL,
    "repeat_response_flag" integer DEFAULT '0',
    "lock_followup_flag" integer DEFAULT '0',
    "appointment_class" character varying(20),
    CONSTRAINT "hms_patient_appointment_sms_response_pkey" PRIMARY KEY ("reponse_id")
) WITH (oids = false);

DROP TABLE IF EXISTS "hms_callback_msgtype";
CREATE TABLE "public"."hms_callback_msgtype" (
    "callback_id" integer NOT NULL,
    "msgtype" character varying(50),
    "msggroup" character varying(50),
    "status" integer DEFAULT '0' NOT NULL,
    "timeout_callback_ip" character varying(50),
    "timeout_callback_url" character varying(100),
    "reply_callback_ip" character varying(50),
    "reply_callback_url" character varying(100),
    "message_table" character varying(100),
    CONSTRAINT "hms_callback_msgtype_pkey" PRIMARY KEY ("callback_id")
) WITH (oids = false);

INSERT INTO "hms_callback_msgtype" ("callback_id", "msgtype", "msggroup", "status", "timeout_callback_ip", "timeout_callback_url", "reply_callback_ip", "reply_callback_url", "message_table") VALUES
(1,	'pnok_system',	'pnok_system',	1,	NULL,	NULL,	NULL,	'/web/api/processPNokReply.php?msgid={{'{{'}}msgid{{'}}'}}',	'hms_messagelog'),
(2,	'cvnormal',	'cvnormal',	1,	NULL,	NULL,	'',	'/home/contact_verification_reply.php?cvid={{'{{'}}appip{{'}}'}}&msgid={{'{{'}}msgid{{'}}'}}',	'hms_messagelog');

DROP TABLE IF EXISTS "hms_smsstatus_log2";
DROP SEQUENCE IF EXISTS hms_smsstatus_log2_index_seq;
CREATE SEQUENCE hms_smsstatus_log2_index_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hms_smsstatus_log2" (
    "index" bigint DEFAULT nextval('hms_smsstatus_log2_index_seq') NOT NULL,
    "msgid" bigint NOT NULL,
    "smsstatus" character varying(50),
    "timestamp" timestamp,
    "msgtype" character varying(50),
    "jobid" character varying(20)
) WITH (oids = false);

CREATE INDEX "hms_smsstatus_log2_index" ON "public"."hms_smsstatus_log2" USING btree ("index");

--
-- Name: Grant {{ pgsql_app_usr }}
--

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER ON ALL TABLES IN SCHEMA public TO {{ pgsql_app_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_app_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_dba_usr }};
GRANT USAGE ON SCHEMA public TO {{ pgsql_read_usr }};
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO {{ pgsql_app_usr }};
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO {{ pgsql_app_usr }};