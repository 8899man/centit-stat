create table Q_QueryModel  (
   ModelName            VARCHAR2(64)                    not null,
   Database_Code        varchar2(32),
   ModelType            CHAR,
   OwnerType            CHAR,
   OwnerCode            VARCHAR2(64),
   QUERYSQL             VARCHAR2(4000),
   QueryDESC            VARCHAR2(512),
   formNameFormat       VARCHAR2(256),
   resultName           VARCHAR2(64),
   rowDrawChart         CHAR,
   drawChartBeginCol    NUMBER(4),
   drawChartEndCol      NUMBER(4),
   additionRow          CHAR,
   rowLogic             VARCHAR2(64),
   rowLogicValue        NUMBER(4),
   LOGICURL             VARCHAR2(512),
   ColumnSql            VARCHAR2(2048),
   ISTREE               varchar2(8),
   HASSUM               varchar2(8),
   WIZARD_NO            varchar2(32),
   constraint PK_Q_QUERYMODEL primary key (ModelName)
);

comment on column Q_QueryModel.ModelType is
'2 �� ��ά��  3 ��ͬ�ȷ��� 4�����ȷ��� 5�������Ʊ�';

comment on column Q_QueryModel.OwnerType is
'�������߸���';

comment on column Q_QueryModel.rowDrawChart is
'�Ƿ��� T ��ͳ��ͼ F ����';

comment on column Q_QueryModel.additionRow is
'0 : û��  1 �ϼ�  2 ��ֵ  3 �ϼ� �� ��ֵ';

comment on column Q_QueryModel.WIZARD_NO is
'�����Ϊ��˵����ͨ����ѯ�����ɵ�';

create table Q_QueryCondition  (
   ModelName            VARCHAR2(64)                    not null,
   condName             VARCHAR2(64)                    not null,
   condLabel            VARCHAR2(200)                   not null,
   condDisplayStyle     CHAR                            not null,
   paramType            VARCHAR2(64),
   compareType          CHAR,
   paramReferenceType   CHAR,
   paramReferenceData   VARCHAR2(1000),
   paramValidateRegex   VARCHAR2(200),
   paramValidateInfo    VARCHAR2(200),
   paramDefaultValue    VARCHAR2(200),
   condOrder            number(2),
   constraint PK_Q_QUERYCONDITION primary key (ModelName, condName)
);

comment on column Q_QueryCondition.condDisplayStyle is
'N:��ͨ nomal H ���� hide R ֻ�� readonly';

comment on column Q_QueryCondition.paramType is
'S:�ı� N����  D������ T��ʱ�����datetime)  ';

comment on column Q_QueryCondition.compareType is
'������ʱ���ֶΣ� 3 ͬ�ȷ���  4 ���ȷ��� 0 ����';

comment on column Q_QueryCondition.paramReferenceType is
'0��û�У�1�� �����ֵ� 2��JSON���ʽ 3��sql���  Y����� M���·�';

comment on column Q_QueryCondition.paramReferenceData is
'����paramReferenceType���ͣ�1,2,3����д��Ӧֵ';

comment on column Q_QueryCondition.paramValidateRegex is
'regex���ʽ';

comment on column Q_QueryCondition.paramValidateInfo is
'Լ����ͨ����ʾ��Ϣ';

comment on column Q_QueryCondition.paramDefaultValue is
'����Ĭ��ֵ';

create table Q_QueryColumn  (
   ModelName            VARCHAR2(64)                    not null,
   colName              VARCHAR2(64)                    not null,
   showType             CHAR,
   optType              CHAR,
   drawChart            CHAR,
   colType              CHAR,
   colLogic             VARCHAR2(120),
   COLORDER             number(2),
   ISSHOW               CHAR,
   COLFORMAT            VARCHAR2(64),
   LINKTYPE             VARCHAR(32),
   DEFAULTVALUE         VARCHAR(64),
   cssstyle VARCHAR2(120),
   CATALOGCODE VARCHAR2(64),
   constraint PK_Q_QUERYCOLUMN primary key (ModelName, colName)
);

comment on column Q_QueryColumn.showType is
'R ��ͷ  C ��ͷ  D ��ֵ';

comment on column Q_QueryColumn.optType is
'0 : ���� 1 ��� 2 ��ƽ��ֵ 3 ��� ��ƽ��ֵ';

comment on column Q_QueryColumn.drawChart is
' T ��ͳ��ͼ F ����';