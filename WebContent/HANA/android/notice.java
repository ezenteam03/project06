package com.example.hfinal;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class notice extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notice);




        RecyclerView recyclerView = findViewById(R.id.abc);


        // RecyclerView의 orientation을  Vertical로 선언..
        LinearLayoutManager layoutManager = new LinearLayoutManager(this,
                LinearLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);

        // adapter에 데이터할당..
        notice_adapter adapter = new notice_adapter();

        adapter.addItem(new notice_vo("공지공지"));
        adapter.addItem(new notice_vo("공지공지"));
        adapter.addItem(new notice_vo("공지공지"));
        adapter.addItem(new notice_vo("공지공지"));
        adapter.addItem(new notice_vo("공지공지"));




        // recycleriew와 adater와 연결처리..
        recyclerView.setAdapter(adapter);





        Button btp = (Button) findViewById(R.id.button2_10);
        btp.setOnClickListener(pers);

        //글쓰기 버튼
        Button btnw = (Button) findViewById(R.id.btnNwrite);
        btnw.setOnClickListener(notiw);


        }



         View.OnClickListener pers = new View.OnClickListener(){
            Intent int01;
             public void onClick(View v){
                int01 = new Intent(getApplicationContext(), personal.class);
            startActivity(int01);
            }
        };

        View.OnClickListener notiw = new View.OnClickListener(){
            Intent int01;
            public void onClick(View v){
                int01 = new Intent(getApplicationContext(), notice_w.class);
                startActivity(int01);
            }
        };

}
