package com.example.androidmvm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.example.androidmvm.mediator.MediatorManager

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun clickStart(view: View) {
        val intent = Intent(this, StartActivity::class.java)
        startActivity(intent)
    }
    fun clickUpgrade(view: View) {
        MediatorManager.upgradeMediator = null
        val intent = Intent(this, UpgradeActivity::class.java)
        startActivity(intent)
    }
    fun clickAdvanced(view: View) {
        val intent = Intent(this, AdvancedActivity::class.java)
        startActivity(intent)
    }
}