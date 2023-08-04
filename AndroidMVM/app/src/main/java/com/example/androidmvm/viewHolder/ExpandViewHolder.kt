package com.example.androidmvm.viewHolder

import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import com.example.androidmvm.R
import com.example.androidmvm.viewModel.ButtonViewModel
import com.jakewharton.rxbinding4.view.clicks
import java.util.concurrent.TimeUnit

class ExpandViewHolder(itemView: View) : BaseViewHolder(itemView) {
    val button = itemView.findViewById<Button>(R.id.button6)
    val textView = itemView.findViewById<TextView>(R.id.textView4)

    override fun bind(data: Any) {
        super.bind(data)

        val item = data as Map<String, Any>
        val viewModel = item["viewModel"] as ButtonViewModel

        val d1 = button.clicks().throttleFirst(1, TimeUnit.SECONDS).subscribe{
            viewModel.clickItem()
        }

        val d2 = viewModel.buttonState.subscribe {
            if (it) {
                val layoutParams = ConstraintLayout.LayoutParams(90, 800)
                layoutParams.leftToLeft = ConstraintLayout.LayoutParams.PARENT_ID
                layoutParams.topToTop = ConstraintLayout.LayoutParams.PARENT_ID
                layoutParams.topMargin = 60
                layoutParams.leftMargin = 60
                textView.layoutParams = layoutParams
                textView.requestLayout()
            } else {
                val layoutParams = ConstraintLayout.LayoutParams(40, 450)
                layoutParams.leftToLeft = ConstraintLayout.LayoutParams.PARENT_ID
                layoutParams.topToTop = ConstraintLayout.LayoutParams.PARENT_ID
                layoutParams.topMargin = 0
                layoutParams.leftMargin = 0
                textView.layoutParams = layoutParams
                textView.requestLayout()
            }
        }

        compositeDisposable.add(d1)
        compositeDisposable.add(d2)
    }
}