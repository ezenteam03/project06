package com.example.pro06_btn;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class find_empno extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_empno);

        Button find02 = (Button)findViewById(R.id.find_empno_but01);
        find02.setOnClickListener(findEmpno02);


    }

    View.OnClickListener findEmpno02 = new View.OnClickListener(){
        Intent int01;
        @Override
        public void onClick(View v) {
            int01 = new Intent(getApplicationContext(), find_empno02.class);
            startActivity(int01);
        }
    };

}
