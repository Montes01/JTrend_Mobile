package com.example.jtrend

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.SearchView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.jtrend.DataProviders.SharesList
import com.example.jtrend.POO.Publicacion
import com.example.jtrend.RecyclerView.Adapter

class MainActivity : AppCompatActivity() {
    lateinit var listaRecycler:RecyclerView;
    lateinit var searchVar:SearchView;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        initComponents()
        setListContent();
    }

    private fun setListContent(){
        listaRecycler.layoutManager = LinearLayoutManager(this);
        listaRecycler.adapter = Adapter(SharesList.GetShares(""));
    }
    private fun initComponents(){
        listaRecycler = findViewById(R.id.PublicationList)
        searchVar = findViewById(R.id.BusquedaPublis)
    }



}