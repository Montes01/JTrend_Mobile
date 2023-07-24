package com.example.jtrend

import android.content.Context
import android.os.StrictMode
import android.util.Log
import android.widget.Toast
import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

object Connection {
    val user = "sqlMontes";
    val pass = "123456";
    val ip = "10.199.16.44";
    val port = "1433";
    val bd = "JTrend";
    fun getConnection():Connection?{
        val policy = StrictMode.ThreadPolicy.Builder().permitAll().build()
        StrictMode.setThreadPolicy(policy)
        var conn:Connection? = null;
        val path = "jdbc:jtds:sqlserver://$ip:$port;databaseName=$bd"
        try{
            Class.forName("net.sourceforge.jtds.jdbc.Driver")
            conn = DriverManager.getConnection(path, user, pass)
        } catch (e:ClassNotFoundException){
            Log.d("ConnnectionException", "getConnection: CLASSNOTFOUND "+ e.message)
        } catch (e:SQLException){
            Log.d("ConnnectionException", "getConnection: SQLException " + e.message)
        }
    return conn;
    }
}
