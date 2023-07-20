package com.example.jtrend.RecyclerView

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.jtrend.R

class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
    var userName = itemView.findViewById<TextView>(R.id.UserNameShare)
    var ContentShare = itemView.findViewById<TextView>(R.id.ContentShare)

}