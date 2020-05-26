package com.example.empsearch;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class WorkAdapter extends RecyclerView.Adapter<WorkAdapter.ViewHolder> {
    ArrayList<Task> items = new ArrayList<Task>();

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
        View itemView = inflater.inflate(R.layout.emp_item, viewGroup, false);

        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder viewHolder, int position) {
        Task item = items.get(position);
        viewHolder.setItem(item);
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    public void addItem(Task item) {
        items.add(item);
    }

    public void setItems(ArrayList<Task> items) {
        this.items = items;
    }

    public Task getItem(int position) {
        return items.get(position);
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView tname;
        TextView tdiv;
        TextView tno;

        public ViewHolder(View itemView) {
            super(itemView);

            tname = itemView.findViewById(R.id.tname);
            tno = itemView.findViewById(R.id.tno);
            tdiv = itemView.findViewById(R.id.tdiv);
        }

        public void setItem(Task item) {
            tname.setText(item.getTname());
            tno.setText(item.getTno()+"");
            tdiv.setText(item.getTdiv()+"");

//            salTV.setText(item.getTno());
        }

    }

}
