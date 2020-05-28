package com.example.hfinal;

import java.util.ArrayList;

public class notice_List {
    /*
    {"noticelist":[{"title":"프로젝트 주제 선정에 대한 회의 일정 공지"},
                   {"title":"프로젝트 역할 분담에 대한 회의 일정 공지"},
                   {"title":"프로젝트에 활용할 bootstrap template 투표"},
                   {"title":"회의공지"},
                   {"title":"5월5일 휴일 과제 공지"},
                   {"title":"기한 내 작업 완수 목표를 꼭 달성합시다"},
                   {"title":"1주차 발표에 대한 피드백 회의 공지"},
                   {"title":"업무 분담 숙지 바랍니다"},
                   {"title":"주말 과제 공지"},
                   {"title":"이슈 발생시 바로 이슈리스트 등록 바랍니다"},
                   {"title":"회의 공지"}]}
    */
    private ArrayList<notice_vo> andlist;

    public ArrayList<notice_vo> getAndlist() {
        return andlist;
    }

    public void setAndlist(ArrayList<notice_vo> andlist) {
        this.andlist = andlist;
    }
}
