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
import com.zw.admin.server.dao.RmasRoomDao;
import com.zw.admin.server.model.RmasRoom;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasRooms")
public class RmasRoomController {

    @Autowired
    private RmasRoomDao rmasRoomDao;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("room:add")
    public RmasRoom save(@RequestBody RmasRoom rmasRoom) {
        rmasRoomDao.save(rmasRoom);

        return rmasRoom;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasRoom get(@PathVariable Long id) {
        return rmasRoomDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("room:update")
    public RmasRoom update(@RequestBody RmasRoom rmasRoom) {
        rmasRoomDao.update(rmasRoom);

        return rmasRoom;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    @RequiresPermissions("room:query")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return rmasRoomDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasRoom> list(PageTableRequest request) {
                return rmasRoomDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    @RequiresPermissions("room:del")
    public void delete(@PathVariable Long id) {
        rmasRoomDao.delete(id);
    }
}
