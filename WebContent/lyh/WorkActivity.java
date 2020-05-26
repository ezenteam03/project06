package com.example.empsearch;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

public class WorkActivity extends AppCompatActivity {
/*
* http://211.238.140.48:5080/springweb/emplist2.do
* */
    EditText enameET;
    EditText jobET;
    static RequestQueue requestQueue;

    RecyclerView recyclerView;
    WorkAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        enameET = findViewById(R.id.enameET);
        //jobET = findViewById(R.id.jobET);
        Button button = findViewById(R.id.button);

        // Volley에 있는 요청 객체를 초기에 설정..
        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        recyclerView = findViewById(R.id.recyclerView);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);


        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adapter = new WorkAdapter();
                recyclerView.setAdapter(adapter);
                makeRequest();
            }
        });
    }


    public void makeRequest() {
        // json데이터를 가져오는 주소 입력 text
        //http://211.238.140.48:5080/springweb/emplist2.do
        String ename = enameET.getText().toString();
       // String job = jobET.getText().toString();
        //String url = "http://211.238.140.48:5080/springweb/emplist2.do?ename="+ename+"&"+"job="+job;
        String url = "http://192.168.4.235:5080/project06_git/task.do?method=applist"+"&"+"tname="+ename;
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
        Log.d("WorkActivity", data);
    }
    public void processResponse(String response) {
        Gson gson = new Gson();
        WorkList empList = gson.fromJson(response, WorkList.class);
        for(Task emp:empList.getEmplist()){
            adapter.addItem(emp);
        }
;
        adapter.notifyDataSetChanged();
    }

}
