package com.zw.admin.server.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zw.admin.server.annotation.LogAnnotation;
import com.zw.admin.server.model.User;
import com.zw.admin.server.service.DataHandlerService;
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
import com.zw.admin.server.dao.RmasGobackDao;
import com.zw.admin.server.model.RmasGoback;

import io.swagger.annotations.ApiOperation;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/rmasGobacks")
public class RmasGobackController {

    @Autowired
    private RmasGobackDao rmasGobackDao;

    @Autowired
    private DataHandlerService dataService;

    @PostMapping
    @ApiOperation(value = "保存")
    @RequiresPermissions("goback:add")
    public RmasGoback save(@RequestBody RmasGoback rmasGoback) {
        rmasGoback.setStatus(1);//状态1 已完成
        rmasGoback.setIsCheck(0);//是否撤销 否
        rmasGobackDao.save(rmasGoback);

        return rmasGoback;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasGoback get(@PathVariable Long id) {
        return rmasGobackDao.getById(id);
    }

    @LogAnnotation
    @PostMapping("/batchRoom")
    @ApiOperation(value = "文件上传")
    public Map<String,String> uploadFile(MultipartFile file) throws IOException {
        Map<String,String> map = new HashMap<>();
        InputStream is =  file.getInputStream();
        FileInputStream stream = (FileInputStream) is;//强转
        dataService.dataHandler("批量添加晚归",stream);
        map.put("code","00");
        map.put("msg","上传成功");
        return map;
    }

    @GetMapping("/queren/{id}")
    @ApiOperation(value = "确认信息")
    public void queren(@PathVariable Long id) {
        RmasGoback goback =  rmasGobackDao.getById(id);
        if(goback != null) {
            goback.setStatus(2);//已处理
            goback.setIsCheck(1);//已撤销
            rmasGobackDao.update(goback);
        }
    }

    @GetMapping("/quxiao/{id}")
    @ApiOperation(value = "确认信息")
    public void quxiao(@PathVariable Long id) {
        RmasGoback goback =  rmasGobackDao.getById(id);
        if(goback != null) {
            goback.setStatus(2);//已处理
            rmasGobackDao.update(goback);
        }
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequiresPermissions("goback:update")
    public RmasGoback update(@RequestBody RmasGoback rmasGoback) {
        rmasGobackDao.update(rmasGoback);

        return rmasGoback;
    }

    @PutMapping
    @ApiOperation(value = "修改")
    @RequestMapping("/stu")
    @RequiresPermissions("goback:updateToStu")
    public RmasGoback updateToStu(@RequestBody RmasGoback rmasGoback) {
        rmasGoback.setStatus(0);//待处理
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
    @GetMapping
    @RequestMapping("/listToStu")
    @ApiOperation(value = "列表")
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
                return rmasGobackDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasGoback> list(PageTableRequest request) {
                User user = UserUtil.getCurrentUser();
                String finalLoginId = "";
                if(user != null) {
                    finalLoginId = user.getUsername();
                }
                Map<String,Object> map =  request.getParams();
                map.put("student", finalLoginId);
                map.put("isCheck", "0");
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
