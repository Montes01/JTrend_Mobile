package com.example.jtrend.LoginAndRegister

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import com.example.jtrend.Connection
import com.example.jtrend.MainActivity
import com.example.jtrend.R
import java.sql.ResultSet
import java.sql.Statement

class Login : AppCompatActivity() {

    lateinit var emailInput: EditText;
    lateinit var passwordInput: EditText;
    lateinit var loginButton: Button;
    lateinit var registerText: TextView;
    lateinit var principalPage: Intent;
    lateinit var registerPage: Intent;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        initComponents()
        setEvents()
    }

    private fun initComponents() {
        emailInput = findViewById(R.id.LoginEmail);
        passwordInput = findViewById(R.id.LoginPassword);
        loginButton = findViewById(R.id.LoginButton);
        registerText = findViewById(R.id.RegisterText);
        principalPage = Intent(this, MainActivity()::class.java);
        registerPage = Intent(this, Register()::class.java);
    }

    private fun setEvents() {
        loginButton.setOnClickListener {
            login(
                emailInput.text.toString(),
                passwordInput.text.toString()
            );
        }
        registerText.setOnClickListener{ startActivity(registerPage)}
    }




    private fun login(email: String, password: String) {
        var consulta: String = "EXEC usp_ValidacionCuenta '$email', '$password'";
        var state: Statement? = Connection.getConnection()?.createStatement();
        try {
            var table: ResultSet? = state?.executeQuery(consulta);
            table?.next();
            principalPage.putExtra("ID_USUARIO", table?.getInt("IDUsuario"));
            startActivity(principalPage);
        } catch (e: Exception) {
            Toast.makeText(this, "Correo o contraseña incorrectos", Toast.LENGTH_SHORT).show();
            Log.d("NotLogin", "${e.message}");
        }
    }
}