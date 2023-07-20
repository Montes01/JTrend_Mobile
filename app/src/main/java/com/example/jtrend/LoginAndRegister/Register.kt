package com.example.jtrend.LoginAndRegister

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.example.jtrend.Connection
import com.example.jtrend.R
import java.sql.PreparedStatement

class Register : AppCompatActivity() {
    lateinit var documento: EditText;
    lateinit var nombres: EditText;
    lateinit var apellidos: EditText;
    lateinit var correo: EditText;
    lateinit var contraseña: EditText;
    lateinit var fechaNacimiento: EditText;
    lateinit var buttonRegister: Button;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_register)
        initComponents();
        settingEvents();
    }

    private fun settingEvents() {
        buttonRegister.setOnClickListener { userRegister(
            documento.text.toString(),
            nombres.text.toString(),
            apellidos.text.toString(),
            correo.text.toString(),
            contraseña.text.toString(),
            fechaNacimiento.text.toString(),
        ) }
    }

    private fun userRegister(
        documento: String,
        nombres: String,
        apellidos: String,
        correo: String,
        contraseña: String,
        fechaNacimiento: String
    ) {
        val sql: String =
            "EXEC usp_InsertarUsuario $documento, '$nombres', '$apellidos', '$correo', '$contraseña', '$fechaNacimiento'";
        var ps:PreparedStatement? = Connection.getConnection()?.prepareStatement(sql)
        try{
            ps?.execute()
            Toast.makeText(this, "Registrado exitosamente", Toast.LENGTH_SHORT).show()
            this.finish()
        } catch (e:Exception){
            Toast.makeText(this, "Hubo un error al registrarte", Toast.LENGTH_SHORT).show()
            Log.d("Execute Exception", "userRegister: ${e.message}")
        }
    }


    private fun initComponents() {
        documento = findViewById(R.id.inputDocumento);
        buttonRegister = findViewById(R.id.buttonRegister);
        nombres = findViewById(R.id.inputNombres);
        apellidos = findViewById(R.id.inputApellidos);
        correo = findViewById(R.id.inputEmail);
        contraseña = findViewById(R.id.inputPassword);
        fechaNacimiento = findViewById(R.id.inputDate);
    }
}