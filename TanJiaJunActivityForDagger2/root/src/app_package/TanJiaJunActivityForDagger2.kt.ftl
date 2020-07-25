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