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
import com.zw.admin.server.dao.RmasGobackDao;
import com.zw.admin.server.model.RmasGoback;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasGobacks")
public class RmasGobackController {

    @Autowired
    private RmasGobackDao rmasGobackDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("goback:add")
    public RmasGoback save(@RequestBody RmasGoback rmasGoback) {
        rmasGobackDao.save(rmasGoback);

        return rmasGoback;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasGoback get(@PathVariable Long id) {
        return rmasGobackDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("goback:update")
    public RmasGoback update(@RequestBody RmasGoback rmasGoback) {
        rmasGobackDao.update(rmasGoback);

        return rmasGoback;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasGobackDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasGoback> list(PageTableRequest request) {
                return rmasGobackDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("goback:del")
    public void delete(@PathVariable Long id) {
        rmasGobackDao.delete(id);
    }
}
