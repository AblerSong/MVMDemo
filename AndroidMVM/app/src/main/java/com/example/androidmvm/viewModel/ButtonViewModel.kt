package com.example.androidmvm.viewModel

import android.view.View
import io.reactivex.rxjava3.subjects.BehaviorSubject

class ButtonViewModel (
    val buttonState: BehaviorSubject<Boolean> = BehaviorSubject.createDefault(false),
    val radioState: BehaviorSubject<Boolean> = BehaviorSubject.createDefault(false),
    val radioHide: BehaviorSubject<Int> = BehaviorSubject.createDefault(View.VISIBLE),
    var buttonText: BehaviorSubject<String> = BehaviorSubject.createDefault(""),
    var isChecked: BehaviorSubject<Boolean> = BehaviorSubject.createDefault(false)
) {
    var clickItem = {
        val state = !(buttonState.value ?: false)
        buttonState.onNext(state)
    }
}