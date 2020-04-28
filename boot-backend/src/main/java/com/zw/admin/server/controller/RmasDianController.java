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
import com.zw.admin.server.dao.RmasDianDao;
import com.zw.admin.server.model.RmasDian;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasDians")
public class RmasDianController {

    @Autowired
    private RmasDianDao rmasDianDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("dian:add")
    public RmasDian save(@RequestBody RmasDian rmasDian) {
        rmasDianDao.save(rmasDian);

        return rmasDian;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasDian get(@PathVariable Long id) {
        return rmasDianDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("dian:update")
    public RmasDian update(@RequestBody RmasDian rmasDian) {
        rmasDianDao.update(rmasDian);

        return rmasDian;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("dian:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasDianDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasDian> list(PageTableRequest request) {
                return rmasDianDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("dian:del")
    public void delete(@PathVariable Long id) {
        rmasDianDao.delete(id);
    }
}
