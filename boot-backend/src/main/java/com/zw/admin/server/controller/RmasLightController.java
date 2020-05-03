package com.zw.admin.server.controller;

import java.util.List;
import java.util.Map;

import com.zw.admin.server.model.RmasGoback;
import com.zw.admin.server.model.User;
import com.zw.admin.server.utils.UserUtil;
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
        rmasLight.setStatus(1);//状态1 已完成
        rmasLight.setIsCheck(0);//是否撤销 否
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

    @GetMapping("/queren/{id}")
    @ApiOperation(value = "确认信息")
    public void queren(@PathVariable Long id) {
        RmasLight light =  rmasLightDao.getById(id);
        if(light != null) {
            light.setStatus(2);//已处理
            light.setIsCheck(1);//已撤销
            rmasLightDao.update(light);
        }
    }

    @GetMapping("/quxiao/{id}")
    @ApiOperation(value = "确认信息")
    public void quxiao(@PathVariable Long id) {
        RmasLight light =  rmasLightDao.getById(id);
        if(light != null) {
            light.setStatus(2);//已处理
            rmasLightDao.update(light);
        }
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequestMapping("/stu")
    @RequiresPermissions("light:updateToStu")
    public RmasLight updateToStu(@RequestBody RmasLight rmasLight) {
        rmasLight.setStatus(0);//待处理
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

    @GetMapping
    @ApiOperation(value = "列表")
    @RequestMapping("/listToStu")
    public PageTableResponse listToStu(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                User user = UserUtil.getCurrentUser();
                String finalLoginId = "";
                if(user != null) {
                    finalLoginId = user.getUsername();
                }
                Map<String,Object> map =  request.getParams();
                map.put("student", finalLoginId);
                map.put("isCheck", "0");
                return rmasLightDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasLight> list(PageTableRequest request) {
                User user = UserUtil.getCurrentUser();
                String finalLoginId = "";
                if(user != null) {
                    finalLoginId = user.getUsername();
                }
                Map<String,Object> map =  request.getParams();
                map.put("student", finalLoginId);
                map.put("isCheck", "0");
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
