package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class find_empno02 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_empno02);

        Button toLogin = (Button)findViewById(R.id.find_empno_login);
        toLogin.setOnClickListener(toLoginPage);

        Button toPass = (Button)findViewById(R.id.find_empno_pass);
        toPass.setOnClickListener(toPassPage);
    }

    View.OnClickListener toLoginPage = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), login.class);
            startActivity(int01);
        }
    };

    View.OnClickListener toPassPage = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), find_pass.class);
            startActivity(int01);
        }
    };

}
