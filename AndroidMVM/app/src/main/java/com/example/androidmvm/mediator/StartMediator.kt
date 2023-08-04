package com.example.androidmvm.mediator

import androidx.lifecycle.MediatorLiveData
import androidx.lifecycle.MutableLiveData
import com.example.androidmvm.ToastManager

class StartMediator : BaseMediator () {
    val username = MutableLiveData<String>()
    val password = MutableLiveData<String>()
    val buttonState = MediatorLiveData<Boolean>()

    init {
        buttonState.addSource(username) {
            val value = password.value
            buttonState.value = checkCondition(it, value)
        }

        buttonState.addSource(password) {
            val value = username.value
            buttonState.value = checkCondition(value, it)
        }
    }

    fun clickLogin() {
        if (username.value == "admin" && password.value == "123456") {
            ToastManager.toastSubject.onNext("input success")
        } else {
            ToastManager.toastSubject.onNext("input error")
        }
    }

    private fun checkCondition(value1: String?, value2: String?): Boolean {
        println("======1======")
        // 这里是你根据变量1和变量2的值进行条件判断的逻辑
        return value1 != null && value2 != null && value1.isNotEmpty() && value2.isNotEmpty()
    }
}