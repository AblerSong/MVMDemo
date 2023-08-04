package com.example.androidmvm.mediator

import android.content.Intent
import com.example.androidmvm.AdvancedActivity
import com.example.androidmvm.BaseActivity
import com.example.androidmvm.MainActivity
import com.example.androidmvm.ProvinceActivity
import com.example.androidmvm.R
import io.reactivex.rxjava3.disposables.CompositeDisposable
import io.reactivex.rxjava3.subjects.PublishSubject

open class BaseMediator {
    var compositeDisposable = CompositeDisposable()
    val adapterSubject = PublishSubject.create<Boolean>()

    open fun onStart() {}
}


object RouterManager {
    val routerSubject = PublishSubject.create<Int>()
    init {
        routerSubject.subscribe {
            val targetClass = when (it) {
                R.layout.activity_province -> ProvinceActivity::class
                R.layout.activity_advanced -> AdvancedActivity::class
                else -> MainActivity::class
            }
            val context = BaseActivity.currentActivity.get()!!
            val intent = Intent(context, targetClass.java)
            context.startActivity(intent)
        }
    }
}
