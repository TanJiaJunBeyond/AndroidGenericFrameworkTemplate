package ${kotlinEscapedPackageName}.ui.${businessName}.activity

import android.os.Bundle
import ${applicationPackage}.R
import ${applicationPackage}.databinding.Activity${objectKind}Binding
import com.tanjiajun.androidgenericframework.ui.BaseActivity
import ${kotlinEscapedPackageName}.ui.${businessName}.viewmodel.${viewModelName}
import org.koin.androidx.scope.lifecycleScope
import org.koin.androidx.viewmodel.scope.viewModel

class ${activityName} : BaseActivity<Activity${objectKind}Binding, ${viewModelName}>() {

    override val layoutRes: Int = R.layout.${layoutName}
    override val viewModel by lifecycleScope.viewModel<${viewModelName}>(this)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

}