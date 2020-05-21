package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class find_pass02 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_pass02);

        Button toLoginpass = (Button)findViewById(R.id.find_pass_login_btn);
        toLoginpass.setOnClickListener(toLoginPass);

    }

    View.OnClickListener toLoginPass = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), login.class);
            startActivity(int01);
        }
    };
}
