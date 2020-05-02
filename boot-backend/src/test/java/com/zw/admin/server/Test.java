package com.zw.admin.server;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Test {
    public static void main(String[] args) {
//        List<String> list = new ArrayList<>();
//        list.add("1");
//        list.add("b");
//        list.add("c");
//        list.add("d");
//        System.out.println("before"+list.size());
//        for(int i =0;i<list.size();i++){
//            List<String> a = new ArrayList<>();
//            a.addAll(list);
//            a.remove(i);
//            System.out.println("a-LIst.zie"+a.size());
//
//        }
//        System.out.println("-----"+list.size());
        SimpleDateFormat sdf = new SimpleDateFormat("MM");
        System.out.println(sdf.format(new Date()));
    }
}
