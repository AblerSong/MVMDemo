package com.example.androidmvm.viewHolder

import android.view.View
import android.widget.EditText
import android.widget.TextView
import com.example.androidmvm.R
import com.example.androidmvm.viewModel.InputViewModel
import com.jakewharton.rxbinding4.widget.textChanges

class InputViewHolder(itemView: View) : BaseViewHolder(itemView) {
    val textView: TextView = itemView.findViewById(R.id.textView3)
    val editText: EditText = itemView.findViewById(R.id.editTextText3)

    override fun bind(data: Any) {
        super.bind(data)

        val item = data as Map<String, Any>
        val viewModel = item["viewModel"] as InputViewModel

        val d1 = viewModel.text.subscribe {
            textView.text = it
        }

        val d2 = editText.textChanges()
            .skipInitialValue()
            .map { it.toString() }
            .subscribe { viewModel.value.onNext(it) }

        val d3 = viewModel.value
            .distinctUntilChanged()
            .subscribe { text ->
                if (editText.text.toString() != text) {
                    editText.setText(text)
                    editText.setSelection(text.length)
                }
            }
        compositeDisposable.add(d1)
        compositeDisposable.add(d2)
        compositeDisposable.add(d3)
    }
}