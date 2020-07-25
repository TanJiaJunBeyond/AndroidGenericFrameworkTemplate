<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>

    <@kt.addAllKotlinDependencies />

    <instantiate
        from="root/res/layout/activity_tan_jia_jun_for_dagger2.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate
        from="root/src/app_package/TanJiaJunActivityForDagger2.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/activity/${activityName}.kt" />

    <instantiate
        from="root/src/app_package/TanJiaJunViewModelForDagger2.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/viewmodel/${viewModelName}.kt" />

    <open file="${escapeXmlAttribute(srcOut)}/ui/${businessName}/activity/${activityName}.kt" />

</recipe>