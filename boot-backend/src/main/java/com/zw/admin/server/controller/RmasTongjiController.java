package com.zw.admin.server.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.zw.admin.server.dao.RmasGobackDao;
import com.zw.admin.server.dao.RmasLightDao;
import com.zw.admin.server.model.RmasGoback;
import com.zw.admin.server.model.RmasLight;
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
import com.zw.admin.server.dao.RmasTongjiDao;
import com.zw.admin.server.model.RmasTongji;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rmasTongjis")
public class RmasTongjiController {

    @Autowired
    private RmasTongjiDao rmasTongjiDao;

    @Autowired
    private RmasLightDao rmasLightDao;

    @Autowired
    private RmasGobackDao rmasGobackDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public RmasTongji save(@RequestBody RmasTongji rmasTongji) {
        rmasTongjiDao.save(rmasTongji);

        return rmasTongji;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public RmasTongji get(@PathVariable String id) {
        return rmasTongjiDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public RmasTongji update(@RequestBody RmasTongji rmasTongji) {
        rmasTongjiDao.update(rmasTongji);

        return rmasTongji;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        //清表
        rmasTongjiDao.delete();
        //查询晚熄灯
        handlerLight();
        //查询晚归
        List<RmasGoback> gobackList =  rmasGobackDao.listAll();
        handlerGoBack();


        return new PageTableHandler(new CountHandler() {
            @Override
            public int count(PageTableRequest request) {
                return rmasTongjiDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<RmasTongji> list(PageTableRequest request) {
                return rmasTongjiDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete() {
        rmasTongjiDao.delete();
    }

    private void handlerGoBack(){
        List<RmasGoback> goBackList =  rmasGobackDao.listAll();
        int one = 0;int two = 0;int three = 0;int four = 0;int five =0; int six = 0;
        int seven = 0;int eight = 0;int nine = 0;int ten = 0; int ele = 0; int tw = 0;
        for(int i = 0;i<goBackList.size();i++) {
            Date date =  goBackList.get(i).getDate();
            SimpleDateFormat sdf = new SimpleDateFormat("MM");
            switch (sdf.format(date)) {
                case "01":
                    one++;
                    break;
                case "02":
                    two++;
                    break;
                case "03":
                    three++;
                    break;
                case "04":
                    four++;
                    break;
                case "05":
                    five++;
                    break;
                case "06":
                    six++;
                    break;
                case "07":
                    seven++;
                    break;
                case "08":
                    eight++;
                    break;
                case "09":
                    nine++;
                    break;
                case "10":
                    ten++;
                    break;
                case "11":
                    ele++;
                    break;
                case "12":
                    tw++;
                    break;
                default:
                    break;
            }
        }

        RmasTongji rmasTongji = new RmasTongji();
        rmasTongji.setJanuary(one);
        rmasTongji.setFebruary(two);
        rmasTongji.setMarch(three);
        rmasTongji.setApril(four);
        rmasTongji.setMay(five);
        rmasTongji.setJune(six);
        rmasTongji.setJuly(seven);
        rmasTongji.setAugust(eight);
        rmasTongji.setSeptember(nine);
        rmasTongji.setOctober(ten);
        rmasTongji.setNovember(ele);
        rmasTongji.setDecember(tw);
        rmasTongji.setType("晚归");
        rmasTongjiDao.save(rmasTongji);
    }

    private void handlerLight(){
        List<RmasLight> lightList =  rmasLightDao.listAll();
        int one = 0;int two = 0;int three = 0;int four = 0;int five =0; int six = 0;
        int seven = 0;int eight = 0;int nine = 0;int ten = 0; int ele = 0; int tw = 0;
        for(int i = 0;i<lightList.size();i++) {
            Date date =  lightList.get(i).getDate();
            SimpleDateFormat sdf = new SimpleDateFormat("MM");
            switch (sdf.format(date)) {
                case "01":
                    one++;
                    break;
                case "02":
                    two++;
                    break;
                case "03":
                    three++;
                    break;
                case "04":
                    four++;
                    break;
                case "05":
                    five++;
                    break;
                case "06":
                    six++;
                    break;
                case "07":
                    seven++;
                    break;
                case "08":
                    eight++;
                    break;
                case "09":
                    nine++;
                    break;
                case "10":
                    ten++;
                    break;
                case "11":
                    ele++;
                    break;
                case "12":
                    tw++;
                    break;
                default:
                    break;
            }

        }

        RmasTongji rmasTongji = new RmasTongji();
        rmasTongji.setJanuary(one);
        rmasTongji.setFebruary(two);
        rmasTongji.setMarch(three);
        rmasTongji.setApril(four);
        rmasTongji.setMay(five);
        rmasTongji.setJune(six);
        rmasTongji.setJuly(seven);
        rmasTongji.setAugust(eight);
        rmasTongji.setSeptember(nine);
        rmasTongji.setOctober(ten);
        rmasTongji.setNovember(ele);
        rmasTongji.setDecember(tw);
        rmasTongji.setType("晚熄灯");
        rmasTongjiDao.save(rmasTongji);
    }
}
