package com.centit.stat.chart.po;

import com.centit.support.database.orm.GeneratorCondition;
import com.centit.support.database.orm.GeneratorTime;
import com.centit.support.database.orm.GeneratorType;
import com.centit.support.database.orm.ValueGenerator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/*Name	Code	Comment	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
图表ID	chart_ID		VARCHAR2(64)	64		TRUE	FALSE	TRUE
包ID	RESOURCE_ID		VARCHAR2(64)	64		FALSE	TRUE	FALSE
图表名称模板	chart_Name_Format		VARCHAR2(256)	256		FALSE	FALSE	FALSE
图表类型	chart_type		VARCHAR2(16)	16		FALSE	FALSE	FALSE
图表自定义属性	chart_design	json格式的图表自定义说明	CLOB			FALSE	FALSE	FALSE
更改人员	Recorder		VARCHAR2(32)	32		FALSE	FALSE	FALSE
更改时间	RecordDate		DATE			FALSE	FALSE	FALSE*/
@Data
@Entity
@ApiModel
@Table(name = "Q_CHART_MODEL")
public class ChartModel implements Serializable {

    private static final long serialVersionUID = -386841647338129662L;

    @Id
    @Column(name = "CHART_ID")
    @ApiModelProperty(value = "图表ID", hidden = true)
    @ValueGenerator(strategy = GeneratorType.UUID)
    private String chartId;

    @Column(name = "RESOURCE_ID")
    @ApiModelProperty(value = "包ID", required = true)
    @NotBlank
    private String resourceId;

    @Column(name = "CHART_NAME_FORMAT")
    @ApiModelProperty(value = "图表名称模板", required = true)
    @NotBlank
    private String chartNameFormat;

    @Column(name = "CHART_TYPE")
    @ApiModelProperty(value = "图表类型", required = true)
    @NotBlank
    private String chartType;

    @Column(name = "CHART_DESIGN")
    @ApiModelProperty(value = "图表自定义属性 json格式的图表自定义说明", required = true)
    @NotBlank
    private String chartDesign;

    @Column(name = "RECORDER")
    @ApiModelProperty(value = "更改人员", hidden = true)
    private String recorder;

    @Column(name = "RECORD_DATE")
    @ApiModelProperty(value = "更改时间", hidden = true)
    @ValueGenerator(strategy = GeneratorType.FUNCTION, occasion = GeneratorTime.NEW_UPDATE, condition = GeneratorCondition.ALWAYS, value = "today()")
    private Date recordDate;

    @OneToMany(targetEntity = ChartResourceColumn.class)
    @JoinColumn(name = "chartId", referencedColumnName = "chartId")
    @ApiModelProperty(value = "图表选择的列")
    private List<ChartResourceColumn> columns;
}
