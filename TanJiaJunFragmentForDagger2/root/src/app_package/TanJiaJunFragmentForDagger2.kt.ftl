package ${kotlinEscapedPackageName}.ui.${businessName}.fragment

import android.os.Bundle
import android.view.View
import androidx.fragment.app.viewModels
import ${applicationPackage}.R
import ${applicationPackage}.databinding.Fragment${objectKind}Binding
import com.tanjiajun.androidgenericframework.ui.BaseFragment
import ${kotlinEscapedPackageName}.ui.${businessName}.viewmodel.${viewModelName}

class ${fragmentName} private constructor()
    : BaseFragment<Fragment${objectKind}Binding, ${viewModelName}>() {

    override val layoutRes: Int = R.layout.${layoutName}
    override val viewModel by viewModels<${viewModelName}> { viewModelFactory }
    override val transactionTag: String = ""

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {

    }

    companion object {
        fun newInstance() = ${fragmentName}()
    }

}