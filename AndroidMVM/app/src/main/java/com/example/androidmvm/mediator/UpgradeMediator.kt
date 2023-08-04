package com.example.androidmvm.mediator

import com.example.androidmvm.R
import com.example.androidmvm.ToastManager
import com.example.androidmvm.viewHolder.ButtonViewHolder
import com.example.androidmvm.viewHolder.InputViewHolder
import com.example.androidmvm.viewModel.ButtonViewModel
import com.example.androidmvm.viewModel.InputViewModel
import io.reactivex.rxjava3.core.Observable

class UpgradeMediator : BaseMediator () {
    val usernameViewModel: InputViewModel = InputViewModel()
    val passwordViewModel: InputViewModel = InputViewModel()
    val buttonViewModel: ButtonViewModel = ButtonViewModel()

    init {
        usernameViewModel.text.onNext("username")
        passwordViewModel.text.onNext("password")

        val isNotEmpty: (String, String) -> Boolean = { name: String, age: String ->
            name.isNotEmpty() && age.isNotEmpty()
        }
        val d1 = Observable.combineLatest(usernameViewModel.value, passwordViewModel.value, isNotEmpty).subscribe {
            buttonViewModel.buttonState.onNext(it)
        }

        buttonViewModel.clickItem = {
            val username = usernameViewModel.value.value
            val password = passwordViewModel.value.value
            if (username == "admin" && password == "123456") {
                RouterManager.routerSubject.onNext(R.layout.activity_main)
            } else {
                ToastManager.toastSubject.onNext("input error")
            }
        }

        compositeDisposable.add(d1)
    }

    val dataList by lazy { initList() }

    private fun initList(): List<Map<String, Any>> {
        val m1 = mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", usernameViewModel))
        val m2 = mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", passwordViewModel))
        val m3 = mapOf(Pair("viewType", R.layout.button_item), Pair("viewHolder", ButtonViewHolder::class.java), Pair("viewModel", buttonViewModel))

        return listOf<Map<String, Any>>(m1, m2, m3)
    }
}