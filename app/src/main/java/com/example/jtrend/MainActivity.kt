package com.example.jtrend

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.SearchView
import android.widget.TextView
import androidx.activity.result.contract.ActivityResultContracts
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.jtrend.DataProviders.SharesList
import com.example.jtrend.POO.Publicacion
import com.example.jtrend.RecyclerView.Adapter

class MainActivity : AppCompatActivity() {
    lateinit var listaRecycler:RecyclerView;
    lateinit var searchVar:SearchView;
    lateinit var newPublicactionPage: Intent;
    lateinit var newPostOpen:TextView;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        initComponents()
        setListContent();
        setEvents();
    }


    private fun setEvents(){
        newPublicactionPage.putExtra("ID_USUARIO", intent.getIntExtra("ID_USUARIO", 0))
        newPostOpen.setOnClickListener{startActivity(newPublicactionPage)}
    }

    private fun setListContent(){
        listaRecycler.layoutManager = LinearLayoutManager(this);
        listaRecycler.adapter = Adapter(SharesList.GetShares(""));
    }
    private fun initComponents(){
        newPostOpen = findViewById(R.id.addPost)
        newPublicactionPage = Intent(this, newPublication()::class.java)
        listaRecycler = findViewById(R.id.PublicationList)
        searchVar = findViewById(R.id.BusquedaPublis)
    }



}