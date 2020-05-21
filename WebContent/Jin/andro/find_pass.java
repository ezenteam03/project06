package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class find_pass extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_pass);

        Button findpass02 = (Button)findViewById(R.id.find_pass_but01);
        findpass02.setOnClickListener(findPass02);

    }

    View.OnClickListener findPass02 = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), find_pass02.class);
            startActivity(int01);
        }
    };
}
