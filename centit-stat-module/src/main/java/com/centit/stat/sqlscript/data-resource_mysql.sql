DROP TABLE IF EXISTS Q_DATA_RESOURCE;

DROP TABLE IF EXISTS Q_DATA_RESOURCE_COLUMN;

DROP TABLE IF EXISTS Q_DATA_RESOURCE_PARAM;

CREATE TABLE Q_DATA_RESOURCE
(
   RESOURCE_ID          VARCHAR(64) NOT NULL,
   DATABASE_CODE        VARCHAR(32),
   OWNER_TYPE           CHAR(1) COMMENT '机构或者个人',
   OWNER_CODE           VARCHAR(64),
   QUERY_SQL            VARCHAR(4000),
   QUERY_DESC           VARCHAR(512),
   RESOURCE_NAME_FORMAT VARCHAR(256) COMMENT '根据参数转换',
   RECORDER             VARCHAR(32),
   RECORD_DATE           DATETIME,
   PRIMARY KEY (RESOURCE_ID)
);

CREATE TABLE Q_DATA_RESOURCE_COLUMN
(
   RESOURCE_ID          VARCHAR(64) NOT NULL,
   COLUMN_CODE          VARCHAR(64) NOT NULL,
   COLUMN_NAME          VARCHAR(64),
   IS_STAT_DATA         CHAR(1),
   DATA_TYPE            VARCHAR(16),
   CATALOG_CODE         VARCHAR(64),
   PRIMARY KEY (RESOURCE_ID, COLUMN_CODE)
);

CREATE TABLE Q_DATA_RESOURCE_PARAM
(
   RESOURCE_ID          VARCHAR(64) NOT NULL,
   PARAM_NAME           VARCHAR(64) NOT NULL,
   PARAM_LABEL          VARCHAR(200) NOT NULL,
   PARAM_DISPLAY_STYLE  CHAR(1) NOT NULL COMMENT 'N:普通 normal H 隐藏 hide R 只读 readonly',
   PARAM_TYPE           VARCHAR(64) COMMENT 'S:文本 N数字  D：日期 T：时间戳（datetime)  ',
   PARAM_REFERENCE_TYPE CHAR(1) COMMENT '0：没有：1： 数据字典 2：JSON表达式 3：sql语句  Y：年份 M：月份',
   PARAM_REFERENCE_DATA VARCHAR(1000) COMMENT '根据paramReferenceType类型（1,2,3）填写对应值',
   PARAM_VALIDATE_REGEX VARCHAR(200) COMMENT 'regex表达式',
   PARAM_VALIDATE_INFO  VARCHAR(200) COMMENT '约束不通过提示信息',
   PARAM_DEFAULT_VALUE  VARCHAR(200) COMMENT '参数默认值',
   PARAM_ORDER          NUMERIC(2,0),
   PRIMARY KEY (RESOURCE_ID, PARAM_NAME)
);
