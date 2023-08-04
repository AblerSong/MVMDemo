package com.example.androidmvm.mediator

import android.view.View
import com.example.androidmvm.R
import com.example.androidmvm.viewHolder.ExpandViewHolder
import com.example.androidmvm.viewHolder.InputViewHolder
import com.example.androidmvm.viewHolder.MoreViewHolder
import com.example.androidmvm.viewHolder.ProvinceViewHolder
import com.example.androidmvm.viewModel.ButtonViewModel
import com.example.androidmvm.viewModel.InputViewModel
import io.reactivex.rxjava3.core.Observable

class AdvancedMediator : BaseMediator () {
    val price1: InputViewModel = InputViewModel()
    val price2: InputViewModel = InputViewModel()
    val total: InputViewModel = InputViewModel()
    val expand: ButtonViewModel = ButtonViewModel()
    val more: ButtonViewModel = ButtonViewModel()
    val province: ButtonViewModel = ButtonViewModel()

    var dataList: List<Map<String, Any>> = listOf()

    private fun initPrice() {
        price1.text.onNext("price1")
        price2.text.onNext("price2")
        total.text.onNext("total")

        val totalStr = { price1: String, price2: String ->
            if (price1.isNotEmpty() && price2.isNotEmpty()) {
                (price1.toInt() + price2.toInt()).toString()
            } else {
                "0"
            }
        }

        val d1 = Observable.combineLatest(price1.value, price2.value, totalStr).subscribe {
            total.value.onNext(it)
        }

        compositeDisposable.add(d1)
    }

    private fun initMore() {
        var d2 = more.buttonState.skip(1).subscribe {
            dataList = if (it) {
                listOf<Map<String, Any>> (mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", total))) + initList()
            } else {
                initList()
            }

            adapterSubject.onNext(true)
        }

        compositeDisposable.add(d2)
    }

    fun initProvince() {
        province.radioHide.onNext(View.GONE)
        province.buttonText.onNext("天津市")
        province.clickItem = {
           RouterManager.routerSubject.onNext(R.layout.activity_province)
        }
    }

    init {
        initPrice()
        initMore()
        initProvince()

        dataList = initList()
    }

    fun initList(): List<Map<String, Any>> {
        val m1 = mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", price1))
        val m2 = mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", price2))
        val m3 = mapOf(Pair("viewType", R.layout.input_item), Pair("viewHolder", InputViewHolder::class.java), Pair("viewModel", total))
        val m4 = mapOf(Pair("viewType", R.layout.expand_item), Pair("viewHolder", ExpandViewHolder::class.java), Pair("viewModel", expand))
        val m5 = mapOf(Pair("viewType", R.layout.more_item), Pair("viewHolder", MoreViewHolder::class.java), Pair("viewModel", more))
        val m6 = mapOf(Pair("viewType", R.layout.province_item), Pair("viewHolder", ProvinceViewHolder::class.java), Pair("viewModel", province))
        return listOf<Map<String, Any>>(m1, m2, m3, m4, m5, m6)
    }
}