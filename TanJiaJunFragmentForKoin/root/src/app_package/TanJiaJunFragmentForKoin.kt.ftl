package ${kotlinEscapedPackageName}.ui.${businessName}.fragment

import android.os.Bundle
import android.view.View
import ${applicationPackage}.R
import ${applicationPackage}.databinding.Fragment${objectKind}Binding
import com.tanjiajun.androidgenericframework.ui.BaseFragment
import ${kotlinEscapedPackageName}.ui.${businessName}.viewmodel.${viewModelName}
import org.koin.androidx.scope.lifecycleScope
import org.koin.androidx.viewmodel.scope.viewModel

class ${fragmentName} private constructor()
    : BaseFragment<Fragment${objectKind}Binding, ${viewModelName}>() {

    override val layoutRes: Int = R.layout.${layoutName}
    override val viewModel by lifecycleScope.viewModel<${viewModelName}>(this)
    override val transactionTag: String = ""

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {

    }

    companion object {
        fun newInstance() = ${fragmentName}()
    }

}