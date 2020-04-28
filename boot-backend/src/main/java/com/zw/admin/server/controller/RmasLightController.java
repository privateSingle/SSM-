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
import com.zw.admin.server.dao.RmasLightDao;
import com.zw.admin.server.model.RmasLight;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasLights")
public class RmasLightController {

    @Autowired
    private RmasLightDao rmasLightDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("light:add")
    public RmasLight save(@RequestBody RmasLight rmasLight) {
        rmasLightDao.save(rmasLight);

        return rmasLight;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasLight get(@PathVariable Long id) {
        return rmasLightDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("light:update")
    public RmasLight update(@RequestBody RmasLight rmasLight) {
        rmasLightDao.update(rmasLight);

        return rmasLight;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("light:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasLightDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasLight> list(PageTableRequest request) {
                return rmasLightDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("light:del")
    public void delete(@PathVariable Long id) {
        rmasLightDao.delete(id);
    }
}
