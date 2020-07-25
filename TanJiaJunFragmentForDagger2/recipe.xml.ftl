<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>

    <@kt.addAllKotlinDependencies />

    <instantiate
        from="root/res/layout/fragment_tan_jia_jun_for_dagger2.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate
        from="root/src/app_package/TanJiaJunFragmentForDagger2.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/fragment/${fragmentName}.kt" />

    <instantiate
        from="root/src/app_package/TanJiaJunViewModelForDagger2.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/viewmodel/${viewModelName}.kt" />

    <open file="${escapeXmlAttribute(srcOut)}/ui/${businessName}/fragment/${fragmentName}.kt" />

</recipe>