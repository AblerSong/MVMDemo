package com.example.androidmvm.viewHolder

import android.view.View
import android.widget.Button
import android.widget.RadioButton
import com.example.androidmvm.R
import com.example.androidmvm.viewModel.ButtonViewModel
import com.jakewharton.rxbinding4.view.clicks
import java.util.concurrent.TimeUnit

class ProvinceViewHolder(itemView: View) : BaseViewHolder(itemView) {
    private val button = itemView.findViewById<Button>(R.id.button8)
    private val radioButton = itemView.findViewById<RadioButton>(R.id.radioButton)

    override fun bind(data: Any) {
        super.bind(data)

        val item = data as Map<String, Any>
        val viewModel = item["viewModel"] as ButtonViewModel

        val d1 = viewModel.buttonText.subscribe {
            button.setText(it)
        }

        val d2 = viewModel.isChecked.subscribe {
            radioButton.isChecked = it
        }

        val d3 = viewModel.radioHide.subscribe {
            radioButton.visibility = it
        }

        val d4 = button.clicks().throttleFirst(1, TimeUnit.SECONDS).subscribe{
            viewModel.clickItem()
        }

        compositeDisposable.add(d1)
        compositeDisposable.add(d2)
        compositeDisposable.add(d3)
        compositeDisposable.add(d4)
    }
}