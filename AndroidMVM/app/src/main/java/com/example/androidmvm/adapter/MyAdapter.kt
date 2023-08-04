package com.example.androidmvm.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.androidmvm.R
import com.example.androidmvm.viewHolder.BaseViewHolder
import com.example.androidmvm.viewHolder.ButtonViewHolder
import com.example.androidmvm.viewHolder.ExpandViewHolder
import com.example.androidmvm.viewHolder.InputViewHolder
import com.example.androidmvm.viewHolder.MoreViewHolder
import com.example.androidmvm.viewHolder.ProvinceViewHolder

class MyAdapter(var dataList: List<Map<String, Any>>) : RecyclerView.Adapter<BaseViewHolder>() {

    // Can be further encapsulated
    private fun initViewHolder(parent: ViewGroup, viewType: Int): BaseViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        val itemView = inflater.inflate(viewType, parent, false)
        return when (viewType) {
            R.layout.button_item -> ButtonViewHolder(itemView)
            R.layout.input_item -> InputViewHolder(itemView)
            R.layout.expand_item -> ExpandViewHolder(itemView)
            R.layout.more_item -> MoreViewHolder(itemView)
            R.layout.province_item -> ProvinceViewHolder(itemView)
            else -> BaseViewHolder(itemView)
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BaseViewHolder {
        return initViewHolder(parent, viewType)
    }

    override fun onBindViewHolder(holder: BaseViewHolder, position: Int) {
        val data = dataList[position]
        holder.bind(data)
    }

    override fun getItemViewType(position: Int): Int {
        val data = dataList[position]
        return data["viewType"] as Int
    }

    override fun getItemCount(): Int {
        return dataList.size
    }
}