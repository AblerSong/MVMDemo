package com.example.androidmvm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.androidmvm.adapter.MyAdapter
import com.example.androidmvm.mediator.AdvancedMediator
import com.example.androidmvm.mediator.MediatorManager

class AdvancedActivity : BaseActivity() {
    private val mediator: AdvancedMediator
        get() {
            val mediator = MediatorManager.advancedMediator.let {
                if (it == null) {
                    val mediator = AdvancedMediator()
                    MediatorManager.advancedMediator = mediator
                    return mediator
                } else {
                    it
                }
            }

            return mediator
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_advanced)

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerView1)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = MyAdapter(mediator.dataList)

        mediator.adapterSubject.subscribe {
            recyclerView.adapter = MyAdapter(mediator.dataList)
            recyclerView.adapter?.notifyDataSetChanged()
        }
    }
}