package com.zw.admin.server.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.zw.admin.server.dao.UserDao;
import com.zw.admin.server.model.User;
import com.zw.admin.server.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zw.admin.server.page.table.PageTableRequest;
import com.zw.admin.server.page.table.PageTableHandler;
import com.zw.admin.server.page.table.PageTableResponse;
import com.zw.admin.server.page.table.PageTableHandler.CountHandler;
import com.zw.admin.server.page.table.PageTableHandler.ListHandler;
import com.zw.admin.server.dao.RmasSutExamDao;
import com.zw.admin.server.model.RmasSutExam;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasSutExams")
public class RmasSutExamController {

    @Autowired
    private RmasSutExamDao rmasSutExamDao;

    @Autowired
    private UserDao userDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public RmasSutExam save(@RequestBody RmasSutExam rmasSutExam) {
        rmasSutExamDao.save(rmasSutExam);

        return rmasSutExam;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasSutExam get(@PathVariable Long id) {
        return rmasSutExamDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public RmasSutExam update(@RequestBody RmasSutExam rmasSutExam) {
        rmasSutExamDao.update(rmasSutExam);

        return rmasSutExam;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasSutExamDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasSutExam> list(PageTableRequest request) {
                return rmasSutExamDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }


    @GetMapping("/mySturmasSutExams")
    @ApiOperation(value = "我的孩子成绩列表")
    public PageTableResponse myStuCjList(PageTableRequest request) {

        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                //获取当前登录人的Id
                User user =  UserUtil.getCurrentUser();
                List<String> sutdIdList = new ArrayList<>();
                if(user != null) {
                    String jzId = user.getUsername();
                    List<User> userList = userDao.getUserListToJzId(jzId);
                    for(int i = 0;i<userList.size();i++) {
                        String stuId = userList.get(i).getUsername();
                        sutdIdList.add(stuId);
                    }
                }
                Map<String, Object>  map = request.getParams();
                if(sutdIdList.size() != 0 ) {
                    map.put("stuIdList",sutdIdList);
                }else {
                    map.put("stuIdList",null);
                }

                return rmasSutExamDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasSutExam> list(PageTableRequest request) {
                User u2 = UserUtil.getCurrentUser();
                List<String> sutdIdLIst2 = new ArrayList<>();
                if(u2 != null) {
                    String jzId = u2.getUsername();
                    List<User> userList2 = userDao.getUserListToJzId(jzId);
                    for(int j = 0;j<userList2.size(); j ++) {
                        sutdIdLIst2.add(userList2.get(j).getUsername());
                    }
                    Map<String, Object>  map = request.getParams();
                    if(sutdIdLIst2.size() !=0) {
                        map.put("stuIdList",sutdIdLIst2);
                    }else {
                        map.put("stuIdList",null);
                    }

                }
                return rmasSutExamDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        rmasSutExamDao.delete(id);
    }
}
