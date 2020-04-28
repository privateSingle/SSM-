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
import com.zw.admin.server.dao.RmasAsignDao;
import com.zw.admin.server.model.RmasAsign;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasAsigns")
public class RmasAsignController {

    @Autowired
    private RmasAsignDao rmasAsignDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("asign:add")
    public RmasAsign save(@RequestBody RmasAsign rmasAsign) {
        rmasAsignDao.save(rmasAsign);

        return rmasAsign;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasAsign get(@PathVariable Long id) {
        return rmasAsignDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("asign:update")
    public RmasAsign update(@RequestBody RmasAsign rmasAsign) {
        rmasAsignDao.update(rmasAsign);

        return rmasAsign;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("asign:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasAsignDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasAsign> list(PageTableRequest request) {
                return rmasAsignDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("asign:del")
    public void delete(@PathVariable Long id) {
        rmasAsignDao.delete(id);
    }
}
