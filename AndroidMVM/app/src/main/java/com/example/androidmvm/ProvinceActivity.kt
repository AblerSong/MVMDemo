package com.example.androidmvm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.androidmvm.adapter.MyAdapter
import com.example.androidmvm.mediator.MediatorManager
import com.example.androidmvm.mediator.ProvinceMediator

class ProvinceActivity : BaseActivity() {

    private val mediator: ProvinceMediator
        get() {
            val mediator = MediatorManager.provinceMediator.let {
                if (it == null) {
                    val mediator = ProvinceMediator()
                    MediatorManager.provinceMediator = mediator
                    return mediator
                } else {
                    it
                }
            }

            return mediator
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_province)

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerView3)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = MyAdapter(mediator.dataList)
    }

    override fun onStart() {
        super.onStart()
        mediator.onStart()
    }
}