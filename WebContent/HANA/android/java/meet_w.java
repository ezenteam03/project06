package com.example.hfinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class meet_w extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_meet_w);

        Button bt6 = (Button) findViewById(R.id.button2_6);
        bt6.setOnClickListener(noti);



        //글쓰기 버튼 누르면 다시 1:1 게시판으로!
        Button btnp = (Button) findViewById(R.id.btnp);
        btnp.setOnClickListener(pers);

    }

    View.OnClickListener noti = new View.OnClickListener() {
        Intent int01;

        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), notice.class);
            startActivity(int01);
        }
    };



    View.OnClickListener pers = new View.OnClickListener(){
        Intent int01;
        public void onClick(View v){
            int01 = new Intent(getApplicationContext(), meet.class);
            startActivity(int01);
        }
    };
}
