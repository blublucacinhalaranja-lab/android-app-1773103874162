package com.example.declaracaoapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.declaracaoapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.textViewDeclaracao.text = getString(R.string.declaracao)
    }
}