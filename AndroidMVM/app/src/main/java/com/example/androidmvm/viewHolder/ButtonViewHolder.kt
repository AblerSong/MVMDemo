package com.example.androidmvm.viewHolder

import android.view.View
import android.widget.Button
import com.example.androidmvm.R
import com.example.androidmvm.viewModel.ButtonViewModel

class ButtonViewHolder(itemView: View) : BaseViewHolder(itemView) {
    val button: Button = itemView.findViewById(R.id.button5)

    override fun bind(data: Any) {
        super.bind(data)

        val item = data as Map<String, Any>
        val viewModel = item["viewModel"] as ButtonViewModel

        val d1 = viewModel.buttonState.subscribe {
            button.isEnabled = it
        }
        compositeDisposable.add(d1)

        button.setOnClickListener {
            viewModel.clickItem()
        }
    }
}