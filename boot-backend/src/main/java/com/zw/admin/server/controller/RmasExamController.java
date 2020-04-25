package com.zw.admin.server.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.zw.admin.server.dao.RmasExamDao;
import com.zw.admin.server.model.RmasExam;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasExams")
public class RmasExamController {

    @Autowired
    private RmasExamDao rmasExamDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions(value = { "exam:add" })
    public RmasExam save(@RequestBody RmasExam rmasExam) {
        rmasExamDao.save(rmasExam);

        return rmasExam;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasExam get(@PathVariable Long id) {
        return rmasExamDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions(value = { "exam:update" })
    public RmasExam update(@RequestBody RmasExam rmasExam) {
        rmasExamDao.update(rmasExam);

        return rmasExam;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions(value = { "exam:query" })
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasExamDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasExam> list(PageTableRequest request) {
                return rmasExamDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions(value = { "exam:del" })
    public void delete(@PathVariable Long id) {
        rmasExamDao.delete(id);
    }
}
