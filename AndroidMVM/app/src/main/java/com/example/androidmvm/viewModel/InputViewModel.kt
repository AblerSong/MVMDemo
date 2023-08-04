package com.example.androidmvm.viewModel
import io.reactivex.rxjava3.subjects.BehaviorSubject

class InputViewModel (
    val text: BehaviorSubject<String> = BehaviorSubject.createDefault(""),
    val value: BehaviorSubject<String> = BehaviorSubject.createDefault("")
) {

}