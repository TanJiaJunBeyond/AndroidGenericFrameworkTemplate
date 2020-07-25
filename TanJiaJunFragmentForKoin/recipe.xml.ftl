<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>

    <@kt.addAllKotlinDependencies />

    <instantiate
        from="root/res/layout/fragment_tan_jia_jun_for_koin.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate
        from="root/src/app_package/TanJiaJunFragmentForKoin.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/fragment/${fragmentName}.kt" />

    <instantiate
        from="root/src/app_package/TanJiaJunViewModelForKoin.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/${businessName}/viewmodel/${viewModelName}.kt" />

    <open file="${escapeXmlAttribute(srcOut)}/ui/${businessName}/fragment/${fragmentName}.kt" />

</recipe>