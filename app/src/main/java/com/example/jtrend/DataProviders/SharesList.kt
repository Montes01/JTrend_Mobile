package com.example.jtrend.DataProviders

import android.util.Log
import android.widget.Toast
import com.example.jtrend.Connection
import com.example.jtrend.MainActivity
import com.example.jtrend.POO.Publicacion
import java.sql.PreparedStatement
import java.sql.ResultSet

object SharesList {
    var Shares: MutableList<Publicacion> = mutableListOf();
    var sql: String = "";
    var preparedStatement: PreparedStatement? = null;
    fun GetShares(consulta: String): MutableList<Publicacion> {
        sql = "EXEC usp_SeleccionarPublicacionesEnOrdenConParametros '${consulta}'";
        preparedStatement = Connection.getConnection()?.prepareStatement(sql)
        try {
            var list: ResultSet? = preparedStatement?.executeQuery();
            while (list?.next() != null) {
                Shares.add(
                    Publicacion(
                        list.getString("Nombres").toString(),
                        list.getString("Titulo").toString(),
                        list.getString("Contenido").toString()
                    )
                )
            }
        } catch (e: Exception) {
            Log.d("ListError", "GetShares: ${e.message}")
        }
        return Shares
    }


}