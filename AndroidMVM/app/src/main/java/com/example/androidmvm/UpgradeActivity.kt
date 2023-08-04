package com.example.androidmvm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.androidmvm.adapter.MyAdapter
import com.example.androidmvm.mediator.MediatorManager
import com.example.androidmvm.mediator.UpgradeMediator

class UpgradeActivity : BaseActivity() {

    private val mediator: UpgradeMediator
        get() {
            val mediator = MediatorManager.upgradeMediator.let {
                if (it == null) {
                    val mediator = UpgradeMediator()
                    MediatorManager.upgradeMediator = mediator
                    return mediator
                } else {
                    it
                }
            }

            return mediator
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_upgrade)

        initRecyclerView()
    }

    private fun initRecyclerView() {
        val recyclerView = findViewById<RecyclerView>(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(this)

        val dataList = mediator.dataList
        recyclerView.adapter = MyAdapter(dataList)
    }
}