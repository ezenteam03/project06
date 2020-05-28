package com.example.hfinal;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class meet_adapter extends RecyclerView.Adapter<meet_adapter.ViewHolder> {
    // 1. 전체 처리할 ArrayList객체 선언..
    ArrayList<meet_vo> items = new ArrayList<meet_vo>();

    @NonNull
    @Override
    public meet_adapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int viewType) {
        // 각각의 화면할 처리할 내용을 inflater(xml을 객체화) 처리 내용..
        LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
        View itemView = inflater.inflate(R.layout.meet_list, viewGroup, false);

        return new meet_adapter.ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull meet_adapter.ViewHolder viewHolder, int position) {
        // ArrayList에서 단위객체를 불러와서,
        // viewHolder(화면 view)에 할당처리..
        meet_vo item = items.get(position);
        viewHolder.setItem(item);
    }

    // ArrayList의 데이터 건수를 선언..(전체데이터 건수 선언)
    @Override
    public int getItemCount() {
        return items.size();
    }
    // 추가되는 단위(VO)를 ArrayList에 할당 처리 메서드..
    public void addItem(meet_vo item) {
        items.add(item);
    }
    // 전체 데이터 객체를 저장..
    public void setItems(ArrayList<meet_vo> items) {
        this.items = items;
    }
    // 각각의 단위객체 index로 return 처리..
    public meet_vo getItem(int position) {
        return items.get(position);
    }
    // 특정 단위를 객체를 지정한 위치에 저장 처리..
    public void setItem(int position, meet_vo item) {
        items.set(position, item);
    }
    // RecyclerView.ViewHolder를 상속받은 ViewHolder 내부 객체가
    // 단위 화면의 요소객체와 VO 데이터를 mapping처리한다.
    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textView;


        public ViewHolder(View itemView) {
            super(itemView);
            // inflate된 화면단위 View를 가져온다.
            textView = itemView.findViewById(R.id.tv_personal);

        }

        public void setItem(meet_vo item) {
            // 화면단위 View에 데이터를 mapping 처리..
            textView.setText(item.getTopic());

        }

    }
}
