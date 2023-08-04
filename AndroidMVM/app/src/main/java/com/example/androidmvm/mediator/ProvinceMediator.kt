package com.example.androidmvm.mediator

import com.example.androidmvm.R
import com.example.androidmvm.viewHolder.ProvinceViewHolder
import com.example.androidmvm.viewModel.ButtonViewModel

class ProvinceMediator : BaseMediator () {

    val provinceData = listOf<Map<String, String>>(
        mapOf(Pair("province","北京市"), Pair("code","110000")),
        mapOf(Pair("province","天津市"), Pair("code","120000")),
        mapOf(Pair("province","河北省"), Pair("code","130000")),
        mapOf(Pair("province","山西省"), Pair("code","140000")),
        mapOf(Pair("province","内蒙古自治区"), Pair("code","150000")),
        mapOf(Pair("province","辽宁省"), Pair("code","210000")),
    )
    private fun initDataList() : List<Map<String, Any>>  {
        val list = provinceData.map {
            val province= it["province"] ?: ""

            val viewModel = ButtonViewModel()
            viewModel.buttonText.onNext(province)
            
            viewModel.clickItem = {
                RouterManager.routerSubject.onNext(R.layout.activity_advanced)
                MediatorManager.advancedMediator?.province?.buttonText?.onNext(province)
            }
            mapOf(Pair("viewType", R.layout.province_item), Pair("viewHolder", ProvinceViewHolder::class.java), Pair("viewModel", viewModel))
        }
        return  list
    }
    val dataList: List<Map<String, Any>> by lazy {
        initDataList()
    }

    override fun onStart() {
        super.onStart()

        dataList.apply {
            forEach {
                val viewModel = it["viewModel"] as ButtonViewModel
                viewModel.isChecked.onNext(false)
            }
            forEach {
                val text = MediatorManager.advancedMediator?.province?.buttonText?.value ?: ""
                val viewModel = it["viewModel"] as ButtonViewModel
                val text1 = viewModel?.buttonText?.value ?: ""
                if (text == text1) {
                    viewModel.isChecked.onNext(true)
                }
            }
        }
    }
}