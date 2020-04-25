package com.zw.admin.server.controller;

import java.util.List;

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

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        rmasSutExamDao.delete(id);
    }
}
