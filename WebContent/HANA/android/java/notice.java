package com.example.hfinal;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class notice extends AppCompatActivity {
    /*
     * http://주소
     * */
    EditText titleET;
    static RequestQueue requestQueue;
    Button button;
    RecyclerView recyclerView;
    notice_adapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notice);

        titleET = findViewById(R.id.titleET);
        button  = findViewById(R.id.searchNotice);

        // Volley에 있는 요청 객체를 초기에 설정..
        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        recyclerView = findViewById(R.id.abc);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);

        adapter = new notice_adapter();
        recyclerView.setAdapter(adapter);
        makeRequest();
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adapter = new notice_adapter();
                recyclerView.setAdapter(adapter);
                makeRequest();
            }
        });
        Button btp = (Button) findViewById(R.id.button2_10);
        btp.setOnClickListener(pers);

        //글쓰기 버튼
        Button btnw = (Button) findViewById(R.id.btnNwrite);
        btnw.setOnClickListener(notiw);
    }


    public void makeRequest() {

        String title=titleET.getText().toString();
        String url = "http://192.168.4.115:5080/project06_git/notice.do?method=applist"+"&"+"title="+title;

        Log.d("### url:",url);
        StringRequest request = new StringRequest(
                Request.Method.GET,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        println("응답 -> " + response);
                        // 응답을 통해서 json데이터를 처리할 메서드 선언..
                        processResponse(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        println("에러 -> " + error.getMessage());
                    }
                }
        ) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<String,String>();

                return params;
            }
        };

        request.setShouldCache(false);
        requestQueue.add(request);
        println("요청 보냄.");
    }

    public void println(String data) {
        Log.d("notice", data);
    }
    public void processResponse(String response) {
        Gson gson = new Gson();
        notice_List notice_list = gson.fromJson(response, notice_List.class);
        for(notice_vo notice_vo:notice_list.getAndlist()){
            adapter.addItem(notice_vo);
        }
        ;
        adapter.notifyDataSetChanged();
    }


        View.OnClickListener pers = new View.OnClickListener(){
            Intent int01;
             public void onClick(View v){
                int01 = new Intent(getApplicationContext(), meet.class);
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
