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
import com.zw.admin.server.dao.RmasSturoomDao;
import com.zw.admin.server.model.RmasSturoom;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasSturooms")
public class RmasSturoomController {

    @Autowired
    private RmasSturoomDao rmasSturoomDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("sturoom:add")
    public RmasSturoom save(@RequestBody RmasSturoom rmasSturoom) {
        rmasSturoomDao.save(rmasSturoom);

        return rmasSturoom;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasSturoom get(@PathVariable Long id) {
        return rmasSturoomDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("sturoom:update")
    public RmasSturoom update(@RequestBody RmasSturoom rmasSturoom) {
        rmasSturoomDao.update(rmasSturoom);

        return rmasSturoom;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("sturoom:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasSturoomDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasSturoom> list(PageTableRequest request) {
                return rmasSturoomDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("sturoom:del")
    public void delete(@PathVariable Long id) {
        rmasSturoomDao.delete(id);
    }
}
