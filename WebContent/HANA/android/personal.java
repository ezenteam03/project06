package com.example.hfinal;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class personal extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personal);


        RecyclerView recyclerView = findViewById(R.id.ddd);


        // RecyclerView의 orientation을  Vertical로 선언..
        LinearLayoutManager layoutManager = new LinearLayoutManager(this,
                LinearLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);

        // adapter에 데이터할당..
        personal_adapter adapter = new personal_adapter();

        adapter.addItem(new personal_vo("회의회의"));
        adapter.addItem(new personal_vo("회의회의"));
        adapter.addItem(new personal_vo("회의회의"));
        adapter.addItem(new personal_vo("회의회의"));
        adapter.addItem(new personal_vo("회의회의"));





        // recycleriew와 adater와 연결처리..
        recyclerView.setAdapter(adapter);







        Button bt6 = (Button) findViewById(R.id.button2_6);
        bt6.setOnClickListener(noti);



        //글쓰기 버튼
        Button btpw = (Button) findViewById(R.id.btnPwrite);
        btpw.setOnClickListener(persw);
    }

    View.OnClickListener noti = new View.OnClickListener() {
        Intent int01;

        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), notice.class);
            startActivity(int01);
        }
    };



    // 글쓰기버튼
    View.OnClickListener persw = new View.OnClickListener(){
        Intent int01;
        public void onClick(View v){
            int01 = new Intent(getApplicationContext(), personal_w.class);
            startActivity(int01);
        }
    };
}
