<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${package}.mapper.${className}Mapper">

	<!-- 可根据自己的需求，是否要使用 -->
    <resultMap type="${package}.entity.${className}" id="${classname}Map">
#foreach($column in $columns)
        <result property="${column.attrname}" column="${column.columnName}"/>
#end
    </resultMap>

</mapper>