**本文章已授权微信公众号郭霖（guolin_blog）转载。**

本文章讲解的内容是**Android Studio自定义模板——一键生成框架模板代码**。

**框架GitHub地址**：

**Dagger2版本：**[Dagger2](https://github.com/TanJiaJunBeyond/AndroidGenericFramework)

**Koin版本：**[Koin](https://github.com/TanJiaJunBeyond/AndroidGenericFramework/tree/mvvm-koin)

为了快速使用**Android通用框架**开发项目，我配置了一套属于它的**模板**，可以**一键生成框架模板代码**。

**模板GitHub地址：**[AndroidGenericFrameworkTemplate](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate)

# 使用方法

将**模板**下载回来，目录如下图所示：

![AndroidGenericFrameworkTemplateDirectory.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidGenericFrameworkTemplateDirectory.png)

* **TanJiaJunActivityForDagger2**：用于生成**Dagger2**版本的**Activity对应的xml**、**Activity**和**ViewModel**。
* **TanJiaJunFragmentForDagger2**：用于生成**Dagger2**版本的**Fragment对应的xml**、**Fragment**和**ViewModel**。
* **TanJiaJunActivityForKoin**：用于生成**Koin**版本的**Activity对应的xml**、**Activity**和**ViewModel**。
* **TanJiaJunFragmentForKoin**：用于生成**Koin**版本的**Fragment对应的xml**、**Fragment**和**ViewModel**。

然后把**TanJiaJunActivityForDagger2**和**TanJiaJunActivityForKoin**放到**Activity模板目录**下，把**TanJiaJunActivityForKoin**和**TanJiaJunFragmentForKoin**放到**Fragment模板目录**下。

**Activity模板目录地址：/Applications/Android Studio.app/Contents/plugins/android/lib/templates/activities**，如下图所示：

![AndroidActivityTemplateDirectory.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidActivityTemplateDirectory.png)

**Fragment模板目录地址：/Applications/Android Studio.app/Contents/plugins/android/lib/templates/fragments**，如下图所示：

![AndroidFragmentTemplateDirectory.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidFragmentTemplateDirectory.png)

最后重启**Android Studio**，然后就可以使用这些**模板**了，如下图所示：

**Activity**：

![AndroidActivityTemplateMenu.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidActivityTemplateMenu.png)

**Fragment**：

![AndroidFragmentTemplateMenu.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidFragmentTemplateMenu.png)

**创建面板**界面如下图所示：

![AndroidGenericFrameworkTemplateCreatePanel.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/AndroidGenericFrameworkTemplateCreatePanel.png)

下面用**TanJiaJunActivityForDagger2**来描述**目录结构**。

# 目录结构

**目录结构**如下图所示：

![TanJiaJunActivityForDagger2Directory.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/TanJiaJunActivityForDagger2Directory.png)

## globals.xml.ftl

用于定义**全局变量**，代码如下所示：

```xml
<?xml version="1.0"?>
<globals>

    <#include "../common/common_globals.xml.ftl" />

    <global id="hasNoActionBar" type="boolean" value="false" />
    <global id="simpleLayoutName" value="${layoutName}" />
    <global id="excludeMenu" type="boolean" value="true" />
    <global id="generateActivityTitle" type="boolean" value="false" />
    <global id="nativeSrcOut" value="${escapeXmlAttribute(projectOut)}/src/main/cpp" />

</globals>
```

## recipe.xml.ftl

该文件可以定义如下常用的**标签**：

* **copy**：**复制文件到目标目录**，可以用于将**图标**复制到**项目的文件夹**。
* **merge**：**合并**，可以用于将**文件**和**项目中现有的文件**合并。
* **instantiate**：通过**FreeMarker**将**ftl文件**中的**变量**都转换成对应的**值**，并且生成**我们想要的文件**。
* **open**：在**代码**生成后，**打开指定的文件**。

**FreeMarker**是一个**模板引擎**，它可以用来生成**输出文本**（例如：**HTML网页**、**电子邮件**、**配置文件**、**源代码**等）的**通用工具**，如下图所示：

![FreeMarker.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/FreeMarker.png)

**FreeMarker**的工作原理，如下图所示：

![TheWorkingPrincipleOfFreeMarker.jpg](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/TheWorkingPrincipleOfFreeMarker.jpg)

代码如下所示：

```xml
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
```

我解释下代码的逻辑：在指定的目录下，用**activity_tan_jia_jun_for_dagger2.xml.ftl**文件生成**${layoutName}.xml**文件，用**TanJiaJunActivityForDagger2.kt.ftl**文件生成**${activityName}.kt**文件，用**TanJiaJunViewModelForDagger2.kt.ftl**文件生成**${viewModelName}.kt**文件，最后打开**${activityName}.kt**文件。

## root

存放**ftl文件**，也就是**模板代码**，代码如下所示：

**activity_tan_jia_jun_for_dagger2.xml.ftl**：

```xml
<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <data>

        <variable
            name="viewModel"
            type="${kotlinEscapedPackageName}.ui.${businessName}.viewmodel.${viewModelName}" />

    </data>

    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@color/background_color">

    </androidx.constraintlayout.widget.ConstraintLayout>

</layout>
```

**TanJiaJunActivityForDagger2.kt.ftl**：

```kotlin
package ${kotlinEscapedPackageName}.ui.${businessName}.activity

import android.os.Bundle
import androidx.activity.viewModels
import ${applicationPackage}.R
import ${applicationPackage}.databinding.Activity${objectKind}Binding
import com.tanjiajun.androidgenericframework.ui.BaseActivity
import ${kotlinEscapedPackageName}.ui.${businessName}.viewmodel.${viewModelName}

class ${activityName} : BaseActivity<Activity${objectKind}Binding, ${viewModelName}>() {

    override val layoutRes: Int = R.layout.${layoutName}
    override val viewModel by viewModels<${viewModelName}> { viewModelFactory }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

}
```

**TanJiaJunViewModelForDagger2.kt.ftl**：

```kotlin
package ${kotlinEscapedPackageName}.ui.${businessName}.viewmodel

import com.tanjiajun.androidgenericframework.ui.BaseViewModel
import javax.inject.Inject

class ${viewModelName} @Inject constructor() : BaseViewModel() {

}
```

## template_blank_activity.png

展示**模板**界面的**缩略图**，如下图所示：

![TemplateBlankActivity.png](https://github.com/TanJiaJunBeyond/AndroidGenericFrameworkTemplate/raw/master/screenshot/TemplateBlankActivity.png)

## template.xml

用于定义**创建面板**的**控件**，代码如下所示：

```xml
<?xml version="1.0"?>
<template
    format="8"
    revision="8"
    name="TanJiaJun Activity For Dagger2"
    minApi="9"
    minBuildApi="26"
    description="Creates a new activity of Android Generic Framework For Dagger2.">

    <category value="Activity" />

    <formfactor value="Mobile" />

    <parameter
        id="packageName"
        name="Package Name"
        type="string"
        constraints="package"
        default="com.tanjiajun.androidgenericframework" />

    <parameter
        id="businessName"
        name="Business Name"
        type="string"
        constraints="nonempty"
        default="main" />

    <parameter
        id="objectKind"
        name="Object Kind"
        type="string"
        constraints="nonempty"
        default="TanJiaJun" />

    <parameter
        id="activityName"
        name="Activity Name"
        type="string"
        constraints="class|unique|nonempty"
        suggest="${extractLetters(objectKind)}Activity"
        default="TanJiaJunActivity"
        help="The name of the activity class to create." />

    <parameter
        id="layoutName"
        name="Layout Name"
        type="string"
        constraints="layout|unique|nonempty"
        suggest="${activityToLayout(activityName)}"
        default="activity_tan_jia_jun"
        help="The name of the layout to create for the activity." />

    <parameter
        id="viewModelName"
        name="ViewModel Name"
        type="string"
        constraints="class|unique|nonempty"
        suggest="${extractLetters(objectKind)}ViewModel"
        default="TanJiaJunViewModel"
        help="The name of the viewModel class to create." />

    <!-- 128x128 thumbnails relative to template.xml -->
    <thumbs>
        <!-- default thumbnail is required -->
        <thumb>template_blank_activity.png</thumb>
    </thumbs>

    <globals file="globals.xml.ftl" />

    <execute file="recipe.xml.ftl" />

</template>
```

* **packageName**：**包名**，默认值是**com.tanjiajun.androidgenericframework**。
* **businessName**：**业务名称**，默认值是**main**。
* **objectKind**：**对象类型**，默认值是**TanJiaJun**。
* **activityName**：**Activity名称**，默认值是**TanJiaJunActivity**。
* **layoutName**：**布局名称**，默认值是**activity_tan_jia_jun**。
* **viewModelName**：**ViewModel名称**，默认值是**TanJiaJunViewModel**。

每一个**parameter**对应**创建面板**的一个**控件**，控件的**id**可以得到**用户输入的值**，用于渲染**ftl文件**。

下面以**TanJiaJunAcitivityForDagger2**为例生成相应的代码。

# 生成代码

**activity_tan_jia_jun.xml**，代码如下所示：

```xml
<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <data>

        <variable
            name="viewModel"
            type="com.tanjiajun.androidgenericframework.ui.ui.main.viewmodel.TanJiaJunViewModel" />

    </data>

    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@color/background_color">

    </androidx.constraintlayout.widget.ConstraintLayout>

</layout>
```

**TanJiaJunActivity.kt**，代码如下所示：

```kotlin
package com.tanjiajun.androidgenericframework.ui.ui.main.activity

import android.os.Bundle
import androidx.activity.viewModels
import com.tanjiajun.androidgenericframework.R
import com.tanjiajun.androidgenericframework.databinding.ActivityTanJiaJunBinding
import com.tanjiajun.androidgenericframework.ui.BaseActivity
import com.tanjiajun.androidgenericframework.ui.ui.main.viewmodel.TanJiaJunViewModel

class TanJiaJunActivity : BaseActivity<ActivityTanJiaJunBinding, TanJiaJunViewModel>() {

    override val layoutRes: Int = R.layout.activity_tan_jia_jun
    override val viewModel by viewModels<TanJiaJunViewModel> { viewModelFactory }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

}
```

**TanJiaJunViewModel.kt**：代码如下所示：

```kotlin
package com.tanjiajun.androidgenericframework.ui.ui.main.viewmodel

import com.tanjiajun.androidgenericframework.ui.BaseViewModel
import javax.inject.Inject

class TanJiaJunViewModel @Inject constructor() : BaseViewModel() {

}
```



**我的GitHub：**[TanJiaJunBeyond](https://github.com/TanJiaJunBeyond)

**Android通用框架：**[Android通用框架](https://github.com/TanJiaJunBeyond/AndroidGenericFramework)

**我的掘金：**[谭嘉俊](https://juejin.im/user/593f7b33fe88c2006a37eb9b)

**我的简书：**[谭嘉俊](https://www.jianshu.com/u/257511d0c878)

**我的CSDN：**[谭嘉俊](https://blog.csdn.net/qq_20417381)
