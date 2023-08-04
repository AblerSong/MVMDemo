package com.example.androidmvm

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.widget.doOnTextChanged
import androidx.lifecycle.MutableLiveData
import io.reactivex.rxjava3.disposables.CompositeDisposable
import io.reactivex.rxjava3.subjects.PublishSubject
import java.lang.ref.WeakReference

open class BaseActivity : AppCompatActivity() {
    var compositeDisposable = CompositeDisposable()

    companion object {
        lateinit var currentActivity: WeakReference<AppCompatActivity>
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        currentActivity = WeakReference(this)
    }

    override fun onDestroy() {
        super.onDestroy()
        compositeDisposable.clear()
        if (currentActivity.get() == this) {
            currentActivity.clear()
        }
    }

    fun bindEach(editText: EditText, liveData: MutableLiveData<String>) {
        editText.doOnTextChanged { text, _, _, _ ->
            if (liveData.value != text.toString()) {
                liveData.value = text.toString()
            }
        }

        liveData.observe(this) { newText ->
            if (editText.text.toString() != newText) {
                editText.setText(newText)
            }
        }
    }
}

class ApplicationTool : Application() {
    companion object {
        var _context: Application? = null
        fun getContext(): Application {
            return _context!!
        }

    }

    override fun onCreate() {
        super.onCreate()
        _context = this

    }
}

object ToastManager {
    val toastSubject = PublishSubject.create<String>()
    init {
        toastSubject.subscribe {
            val toast = Toast.makeText(ApplicationTool.getContext(), it, Toast.LENGTH_SHORT)
            toast.show()
        }
    }
}