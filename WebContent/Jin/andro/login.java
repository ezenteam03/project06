package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class login extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
/*
        Button myPage = (Button)findViewById(R.id.login_but);
        myPage.setOnClickListener(login);
*/
        Button findEmpno = (Button)findViewById(R.id.find_empno_but);
        findEmpno.setOnClickListener(empno);

        Button findPass = (Button)findViewById(R.id.find_pass_but);
        findPass.setOnClickListener(pass);

    }
/*
    View.OnClickListener login = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), mypage.class);
            startActivity(int01);
        }
    };
*/
    View.OnClickListener pass = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), find_pass.class);
            startActivity(int01);
        }
    };

    View.OnClickListener empno = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), find_empno.class);
            startActivity(int01);
        }
    };


}
