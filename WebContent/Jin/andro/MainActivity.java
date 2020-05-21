package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button lolol = (Button)findViewById(R.id.btn);
        lolol.setOnClickListener(lololPage);

    }

    View.OnClickListener lololPage = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), login.class);
            startActivity(int01);
        }
    };
}
