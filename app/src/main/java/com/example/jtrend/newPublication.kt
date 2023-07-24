package com.example.jtrend

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import java.sql.PreparedStatement
import java.sql.SQLException
import java.sql.Statement

class newPublication : AppCompatActivity() {

    lateinit var tittlePost:EditText;
    lateinit var bodyPost:EditText;
    lateinit var postButton: Button;
    lateinit var comeBackButton: TextView;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_new_publication)
        initComponents();
        setEvents();
    }


    private fun setEvents(){
        postButton.setOnClickListener { share(
            tittlePost.text.toString(),
            bodyPost.text.toString()
        ); }
        comeBackButton.setOnClickListener { this.finish(); }
    }




    private fun share(tittle:String, body:String){
        var query = "EXEC usp_InsertarPublicacion '$tittle','$body', ${intent.getIntExtra("ID_USUARIO", 0)}";
        var ps:PreparedStatement? = Connection.getConnection()?.prepareStatement(query);
        try{
            ps?.execute()
            Toast.makeText(this, "Publicado correctamente", Toast.LENGTH_SHORT).show()
            this.finish()
        } catch (e:Exception){
            Toast.makeText(this, "Hubo un error", Toast.LENGTH_SHORT).show()
        }
    }


    private fun initComponents(){
        tittlePost = findViewById(R.id.tittlePublication)
        bodyPost = findViewById(R.id.ContentPublication)
        postButton = findViewById(R.id.sharePost)
        comeBackButton = findViewById(R.id.closePage)
    }


}