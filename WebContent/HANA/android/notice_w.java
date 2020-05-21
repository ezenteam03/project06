package com.example.hfinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class notice_w extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notice_w);

        Button btp = (Button) findViewById(R.id.button2_10);
        btp.setOnClickListener(pers);


        //글쓰기 버튼 누르면 다시 공지 게시판으로!
        Button btnnn = (Button) findViewById(R.id.btnnn);
        btnnn.setOnClickListener(noti);
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
            int01 = new Intent(getApplicationContext(), personal.class);
            startActivity(int01);
        }
    };

}
