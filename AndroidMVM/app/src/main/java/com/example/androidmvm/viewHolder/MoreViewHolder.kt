package com.example.androidmvm.viewHolder

import android.view.View
import android.widget.Button
import com.example.androidmvm.R
import com.example.androidmvm.viewModel.ButtonViewModel
import com.jakewharton.rxbinding4.view.clicks

class MoreViewHolder(itemView: View) : BaseViewHolder(itemView) {
    private val button = itemView.findViewById<Button>(R.id.button7)

    override fun bind(data: Any) {
        super.bind(data)

        val item = data as Map<String, Any>
        val viewModel = item["viewModel"] as ButtonViewModel

        val d1 = button.clicks().throttleFirst(1, java.util.concurrent.TimeUnit.SECONDS).subscribe{
            viewModel.clickItem()
        }

        compositeDisposable.add(d1)
    }
}