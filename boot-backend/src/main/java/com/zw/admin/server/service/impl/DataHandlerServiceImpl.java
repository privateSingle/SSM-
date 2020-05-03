package com.zw.admin.server.service.impl;

import com.zw.admin.server.dao.RmasDianDao;
import com.zw.admin.server.dao.RmasGobackDao;
import com.zw.admin.server.dao.RmasLightDao;
import com.zw.admin.server.dao.RmasRoomDao;
import com.zw.admin.server.model.RmasDian;
import com.zw.admin.server.model.RmasGoback;
import com.zw.admin.server.model.RmasLight;
import com.zw.admin.server.model.RmasRoom;
import com.zw.admin.server.service.DataHandlerService;
import com.zw.admin.server.utils.POIUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class DataHandlerServiceImpl  implements DataHandlerService {


    @Autowired
    private RmasRoomDao rmasRoomDao;

    @Autowired
    private RmasDianDao rmasDianDao;

    @Autowired
    private RmasGobackDao rmasGobackDao;

    @Autowired
    private RmasLightDao rmasLightDao;

    private POIUtil util = POIUtil.getInstance(null);

    @Override
    public void dataHandler(String type, FileInputStream fin) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if("批量添加宿舍".equals(type)) {
                List<List<String>> rsListListSkipFirst = util.readToListList(fin,false);
                for(int i=0;i<rsListListSkipFirst.size() ;i++) {
                    List<String> list = rsListListSkipFirst.get(i);
                    RmasRoom room = new RmasRoom();
                    room.setTitle(list.get(0));//名称
                    room.setFloor(list.get(1));//楼号
                    room.setDoor(list.get(2));//门牌号
                    room.setNum(Integer.valueOf(list.get(3)));//容纳人数
                    room.setContent(list.get(4));//备注
                    rmasRoomDao.save(room);
                }
            }else if("批量添加费用".equals(type)) {
                List<List<String>> rsListListSkipFirst = util.readToListList(fin,false);
                for(int i=0;i<rsListListSkipFirst.size() ;i++) {
                    List<String> list = rsListListSkipFirst.get(i);
                    RmasDian dian = new RmasDian();
                    dian.setTitle(list.get(0));//名称
                    dian.setDate(sdf.parse(list.get(1)));//时间
                    dian.setType(list.get(2));//费用类型
                    dian.setAmt(new BigDecimal(list.get(3)));//金额
                    dian.setContent(list.get(4));//备注
                    rmasDianDao.save(dian);
                }
            }else if("批量添加晚归".equals(type)) {
                List<List<String>> rsListListSkipFirst = util.readToListList(fin,false);
                for(int i=0;i<rsListListSkipFirst.size() ;i++) {
                    List<String> list = rsListListSkipFirst.get(i);
                    RmasGoback back = new RmasGoback();
                    back.setTitle(list.get(0));//名称
                    back.setDate(sdf.parse(list.get(1)));//时间
                    back.setType(list.get(2));//类型
                    back.setStudent(list.get(3));//学生
                    back.setContent(list.get(4));//备注
                    back.setStatus(1);//状态1 已完成
                    back.setIsCheck(0);//是否撤销 否
                    rmasGobackDao.save(back);
                }
            }else if("批量添加晚熄灯".equals(type)) {
                List<List<String>> rsListListSkipFirst = util.readToListList(fin,false);
                for(int i=0;i<rsListListSkipFirst.size() ;i++) {
                    List<String> list = rsListListSkipFirst.get(i);
                    RmasLight light = new RmasLight();
                    light.setTitle(list.get(0));//名称
                    light.setDate(sdf.parse(list.get(1)));//时间
                    light.setType(list.get(2));//类型
                    light.setRoom(list.get(3));//宿舍
                    light.setStudent(list.get(4));//学生
                    light.setContent(list.get(5));//备注
                    light.setStatus(1);//状态1 已完成
                    light.setIsCheck(0);//是否撤销 否
                    rmasLightDao.save(light);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
