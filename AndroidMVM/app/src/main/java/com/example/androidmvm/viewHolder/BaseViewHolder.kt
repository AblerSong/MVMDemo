package com.example.androidmvm.viewHolder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import io.reactivex.rxjava3.disposables.CompositeDisposable

open class BaseViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val compositeDisposable = CompositeDisposable()
    // 绑定数据
    open fun bind(data: Any) {
        compositeDisposable.clear()
    }
}