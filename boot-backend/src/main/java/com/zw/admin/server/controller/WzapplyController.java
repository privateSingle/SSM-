package com.zw.admin.server.controller;

import com.zw.admin.server.dao.WzapplyDao;
import com.zw.admin.server.model.Wzapply;
import com.zw.admin.server.page.table.PageTableHandler;
import com.zw.admin.server.page.table.PageTableHandler.CountHandler;
import com.zw.admin.server.page.table.PageTableHandler.ListHandler;
import com.zw.admin.server.page.table.PageTableRequest;
import com.zw.admin.server.page.table.PageTableResponse;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/wzapplys")
public class WzapplyController {

    @Autowired
    private WzapplyDao wzapplyDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public Wzapply save(@RequestBody Wzapply wzapply) {
        wzapplyDao.save(wzapply);

        return wzapply;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public Wzapply get(@PathVariable Long id) {
        return wzapplyDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public Wzapply update(@RequestBody Wzapply wzapply) {
        wzapplyDao.update(wzapply);

        return wzapply;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return wzapplyDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<Wzapply> list(PageTableRequest request) {
                return wzapplyDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        wzapplyDao.delete(id);
    }
}
