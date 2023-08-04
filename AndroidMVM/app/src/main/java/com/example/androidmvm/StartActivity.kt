package com.example.androidmvm

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.example.androidmvm.mediator.MediatorManager
import com.example.androidmvm.mediator.StartMediator
import io.reactivex.rxjava3.subjects.PublishSubject

class StartActivity : BaseActivity() {
    private val mediator: StartMediator
        get() {
            val mediator = MediatorManager.startMediator.let {
                if (it == null) {
                    val mediator = StartMediator()
                    MediatorManager.startMediator = mediator
                    return mediator
                } else {
                    it
                }
            }
            return mediator
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_start)

        initBind()

    }

    private fun initBind() {
        val username = findViewById<EditText>(R.id.editTextText)
        val password = findViewById<EditText>(R.id.editTextText2)

        bindEach(username, mediator.username)
        bindEach(password, mediator.password)

        val button = findViewById<Button>(R.id.button4)
        mediator.buttonState.observe(this) {
            button.isEnabled = it
        }
    }

    fun clickLogin(view: View) {
        mediator.clickLogin()
    }
}