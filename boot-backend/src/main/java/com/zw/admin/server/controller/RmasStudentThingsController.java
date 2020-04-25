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
import com.zw.admin.server.dao.RmasStudentThingsDao;
import com.zw.admin.server.model.RmasStudentThings;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasStudentThingss")
public class RmasStudentThingsController {

    @Autowired
    private RmasStudentThingsDao rmasStudentThingsDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public RmasStudentThings save(@RequestBody RmasStudentThings rmasStudentThings) {
        rmasStudentThingsDao.save(rmasStudentThings);

        return rmasStudentThings;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasStudentThings get(@PathVariable Long id) {
        return rmasStudentThingsDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public RmasStudentThings update(@RequestBody RmasStudentThings rmasStudentThings) {
        rmasStudentThingsDao.update(rmasStudentThings);

        return rmasStudentThings;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasStudentThingsDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasStudentThings> list(PageTableRequest request) {
                return rmasStudentThingsDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        rmasStudentThingsDao.delete(id);
    }
}
