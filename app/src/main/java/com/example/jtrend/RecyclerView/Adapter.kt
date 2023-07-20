package com.example.jtrend.RecyclerView

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.jtrend.POO.Publicacion
import com.example.jtrend.R

class Adapter (private var dataSource: List<Publicacion>) : RecyclerView.Adapter<ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(
            LayoutInflater.from(parent.context).inflate(R.layout.publis_list_view, parent, false)
        );
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val data = dataSource[position];
        holder.userName.text = data.userName;
        holder.ContentShare.text = data.body
    }

    override fun getItemCount(): Int = dataSource.size;


}