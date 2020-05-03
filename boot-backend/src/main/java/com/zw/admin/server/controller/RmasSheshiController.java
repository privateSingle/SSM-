package com.zw.admin.server.controller;

import java.util.List;

import com.zw.admin.server.model.RmasLight;
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
import com.zw.admin.server.dao.RmasSheshiDao;
import com.zw.admin.server.model.RmasSheshi;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasSheshis")
public class RmasSheshiController {

    @Autowired
    private RmasSheshiDao rmasSheshiDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("sheshi:add")
    public RmasSheshi save(@RequestBody RmasSheshi rmasSheshi) {
        rmasSheshi.setStatus(0);//待处理
        rmasSheshiDao.save(rmasSheshi);

        return rmasSheshi;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasSheshi get(@PathVariable Long id) {
        return rmasSheshiDao.getById(id);
    }

    @GetMapping("/sign/{id}")
    @ApiOperation(value = "确认信息")
    @RequiresPermissions("sheshi:queren")
    public void queren(@PathVariable Long id) {
        RmasSheshi sheshi =  rmasSheshiDao.getById(id);
        if(sheshi != null) {
            sheshi.setStatus(2);//已处理
            rmasSheshiDao.update(sheshi);
        }
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("sheshi:update")
    public RmasSheshi update(@RequestBody RmasSheshi rmasSheshi) {
        rmasSheshiDao.update(rmasSheshi);

        return rmasSheshi;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("sheshi:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasSheshiDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasSheshi> list(PageTableRequest request) {
                return rmasSheshiDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("sheshi:del")
    public void delete(@PathVariable Long id) {
        rmasSheshiDao.delete(id);
    }
}
