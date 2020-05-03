package com.zw.admin.server.utils;

import com.zw.admin.server.model.RmasRoom;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * POI读取Excel封装
 */
public class POIUtil {

    /**
     * 日期格式化
     */
    private String formatter = "yyyy-MM-dd HH:mm:ss";
    /**
     * 格式化对象
     */
    private SimpleDateFormat sdf = null;

    /**
     * 单例对象
     */
    private static POIUtil instance = new POIUtil();

    /**
     * 单例
     *
     * @param dateFormatter
     * @return
     */
    public static POIUtil getInstance(String dateFormatter) {
        if (dateFormatter != null && dateFormatter.length() != 0) {
            instance.formatter = dateFormatter;
            instance.sdf = null;
        }
        return instance;
    }
    /**
     * 判断cell格式并转换为String
     *
     * @param cell
     * @return
     */
    public String readCellValueToString(Cell cell) {
        if (cell == null) {
            return null;
        }

        CellType type = cell.getCellTypeEnum();
        switch (type) {
            case STRING:
                return cell.getStringCellValue();
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case NUMERIC:
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    if (sdf == null) {
                        try {
                            sdf = new SimpleDateFormat(formatter);
                        } catch (Exception e) {
                            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        }
                    }
                    return sdf.format(cell.getDateCellValue());
                }else {
                    return numberFormat(cell);//String.valueOf(cell.getNumericCellValue())
                }

            case FORMULA:
                return String.valueOf(cell.getCellFormula());
            default:
                return cell.toString();
        }
    }
    private String numberFormat(Cell cell){
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 不显示千位分割符，否则显示结果会变成类似1,234,567,890
        numberFormat.setGroupingUsed(false);
        if (cell == null) {
            return "null";
        }
        String value = cell.toString();
        int i = cell.getCellType();
        if (i == 1) {//字符串类型
            return value;
        } else {
            value =numberFormat.format(cell.getNumericCellValue());
            return value;
        }
    }
    /**
     * 判断Excel类型（2003,2007）并返回实例
     *
     * @param in
     * @return
     * @throws IOException
     */
    public Workbook readStreamToWorkBook(InputStream in) throws IOException, InvalidFormatException {
        checkNull(in);
        Workbook wb = null;
//        try {
//            wb = new HSSFWorkbook(in);
//        } catch (IOException e) {
//            wb = new XSSFWorkbook(in);
//        }
         wb = WorkbookFactory.create(in);
        return wb;
    }


    /**
     * 判断Excel类型（2003/2007）并返回
     * 读取结果第一行是每一个map中的key 每行对应的值为map的value
     * <i>如果第一行没有表头但是后面的行对应的列却有数据，则忽略</i>
     *
     * @param excelFile
     * @param sdf
     * @return
     * @throws IOException
     */
    public List<Map<String, String>> readToListMap(File excelFile, SimpleDateFormat sdf) throws IOException, InvalidFormatException {
        checkNull(excelFile);
        return readToListMap(new FileInputStream(excelFile));
    }

    /**
     * 读取第一个Sheet表并映射为List<HashMap<String, String> 数据类型
     * 读取结果第一行是每一个map中的key 每行对应的值为map的value
     * <i>如果第一行没有表头但是后面的行对应的列却有数据，则忽略</i>
     * 如：
     * a,b,c
     * 1,2,3,4
     * 读取时4则被忽略
     *
     * @param excelStream
     * @return
     * @throws IOException
     */
    public List<Map<String, String>> readToListMap(InputStream excelStream) throws IOException, InvalidFormatException {
        Workbook wb = readStreamToWorkBook(excelStream);
        Sheet sheet = wb.getSheetAt(0);
        return readSheetToListMap(sheet);
    }

    /**
     * 读取某个sheet，映射为List<HashMap<String, String> 数据类型
     * 读取结果第一行是每一个map中的key 每行对应的值为map的value
     * <i>如果第一行没有表头但是后面的行对应的列却有数据，则忽略</i>
     *
     * @param sheet
     * @return
     */
    public List<Map<String, String>> readSheetToListMap(Sheet sheet) {
        List<Map<String, String>> result = new ArrayList<>(sheet.getLastRowNum());
        if (sheet == null || sheet.getFirstRowNum() == sheet.getLastRowNum()) {
            return null;
        }
        Row firstRow = sheet.getRow(sheet.getFirstRowNum());
        // 遍历所有行
        for (int i = sheet.getFirstRowNum() + 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            Map<String, String> rowMap = new HashMap<>();
            for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
                String k = readCellValueToString(firstRow.getCell(j));
                if (k == null) {
                    continue;
                }
                rowMap.put(k, readCellValueToString(row.getCell(j)));
            }
            result.add(rowMap);
        }
        return result;
    }

    /**
     * 读取Excel中第一个Sheet并映射为 List<List<String>> 数据类型
     * 默认跳过第一行
     * 外层List里面每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param file
     * @return
     * @throws IOException
     */
    public List<List<String>> readToListList(File file) throws IOException, InvalidFormatException {
        checkNull(file);
        return readToListList(new FileInputStream(file), true);
    }

    /**
     * 读取Excel中第一个Sheet并映射为 List<List<String>> 数据类型
     * 外层List里面每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param file
     * @param skipFirst 是否跳过第一行
     * @return
     * @throws IOException
     */
    public List<List<String>> readToListList(File file, boolean skipFirst) throws IOException, InvalidFormatException {
        checkNull(file);
        return readToListList(new FileInputStream(file), skipFirst);
    }

    /**
     * 读取第一个Sheet表格，将结果映射为List<List<String>>数据类型
     * 默认跳过第一行
     * 外层List里面每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param excelStream
     * @return
     * @throws IOException
     */
    public List<List<String>> readToListList(InputStream excelStream) throws IOException, InvalidFormatException {
        Workbook wb = readStreamToWorkBook(excelStream);
        Sheet sheet = wb.getSheetAt(0);
        return readSheetToListList(sheet, true);
    }

    /**
     * 读取第一个Sheet表格，将结果映射为List<List<String>>数据类型
     * 外层List里面每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param excelStream
     * @param skipFirst   是否跳过第一行
     * @return
     * @throws IOException
     */
    public List<List<String>> readToListList(InputStream excelStream, boolean skipFirst) throws IOException, InvalidFormatException {
        Workbook wb = readStreamToWorkBook(excelStream);
        Sheet sheet = wb.getSheetAt(0);
        return readSheetToListList(sheet, skipFirst);
    }

    /**
     * 读取第给定的Sheet表格，将结果映射为List<List<String>>数据类型
     * 外层List里面每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param sheet
     * @param skipFirst
     * @return
     * @throws IOException
     */
    public List<List<String>> readSheetToListList(Sheet sheet, boolean skipFirst) {
        if (sheet == null) {
            return null;
        }
        List<List<String>> result = new ArrayList<>();
        int start = skipFirst ? sheet.getFirstRowNum() : sheet.getFirstRowNum() + 1;
        for (int i = start; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            List<String> rowList = new ArrayList<>(row.getLastCellNum() - row.getFirstCellNum());
            for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
                rowList.add(readCellValueToString(row.getCell(j)));
            }
            result.add(rowList);
        }
        return result;
    }

    /**
     * 读取文件中所有Sheet表格
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * Map中每一个键值对是列信息，key是第一行某一列的的内容value是对应行对应列的内容
     *
     * @param file
     * @return
     * @throws IOException
     */
    public List<List<Map<String, String>>> readAllSheetToListMap(File file) throws IOException, InvalidFormatException {
        checkNull(file);
        return readAllSheetToListMap(new FileInputStream(file));
    }

    /**
     * 读取文件中所有的Excel表格信息映射为 List<List<Map<String, String>>>
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * 内层List按顺序0对应第一列1对应第二列
     *
     * @param excelStream
     * @return
     * @throws IOException
     */
    public List<List<Map<String, String>>> readAllSheetToListMap(FileInputStream excelStream) throws IOException, InvalidFormatException {
        Workbook sheets = readStreamToWorkBook(excelStream);
        List<List<Map<String, String>>> result = new ArrayList<>();
        int numberOfSheets = sheets.getNumberOfSheets();
        for (int i = 0; i < numberOfSheets; i++) {
            Sheet sheet = sheets.getSheetAt(i);
            result.add(readSheetToListMap(sheet));
        }
        return result;
    }

    /**
     * 读取文件中所有的Excel表格信息映射为
     * 跳过第一行
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * 内中每一个键值对是列信息，key是第一行某一列的的内容value是对应行对应列的内容
     *
     * @param excelFile
     * @return
     */
    public List<List<List<String>>> readAllSheetToListList(File excelFile) throws IOException, InvalidFormatException {
        return readAllSheetToListList(excelFile, true);
    }

    /**
     * 读取文件中所有的Excel表格信息映射为
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * 内中每一个键值对是列信息，key是第一行某一列的的内容value是对应行对应列的内容
     *
     * @param excelFile
     * @param skipFirst 是否跳过第一行
     * @return
     */
    public List<List<List<String>>> readAllSheetToListList(File excelFile, boolean skipFirst) throws IOException, InvalidFormatException {
        checkNull(excelFile);
        return readAllSheetToListList(new FileInputStream(excelFile), skipFirst);
    }

    /**
     * 读取文件中所有的Excel表格信息映射为
     * 跳过第一行
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * 内中每一个键值对是列信息，key是第一行某一列的的内容value是对应行对应列的内容
     *
     * @param excelStream
     * @return
     */
    public List<List<List<String>>> readAllSheetToListList(FileInputStream excelStream) throws IOException, InvalidFormatException {
        return readAllSheetToListList(excelStream, true);
    }

    /**
     * 读取文件中所有的Excel表格信息映射为
     * 最外层List中每一个对象就是一个Sheet的信息
     * 中间的List每一个对象是一行信息
     * 内中每一个键值对是列信息，key是第一行某一列的的内容value是对应行对应列的内容
     *
     * @param excelStream
     * @param skipFirst   是否跳过第一行
     * @return
     */
    public List<List<List<String>>> readAllSheetToListList(FileInputStream excelStream, boolean skipFirst) throws IOException, InvalidFormatException {
        checkNull(excelStream);
        Workbook sheets = readStreamToWorkBook(excelStream);
        List<List<List<String>>> result = new ArrayList<>();
        int numberOfSheets = sheets.getNumberOfSheets();
        for (int i = 0; i < numberOfSheets; i++) {
            result.add(readSheetToListList(sheets.getSheetAt(i), skipFirst));
        }
        return result;
    }

    private void checkNull(Object o) {
        if (o == null) {
            throw new IllegalArgumentException("read file can not empty");
        }
    }


    public static void main(String[] args) throws IOException, InvalidFormatException {
//        // 传入null则使用默认的日期格式化：yyyy-MM-dd HH:mm:ss
          POIUtil util = POIUtil.getInstance(null);
          File file = new File("/Users/scott/Desktop/study.xlsx");
//        // 将第一行以下每一行和第一行对应的列进行key - value映射
//        List<Map<String, String>> rsMapList = util.readSheetToListMap(file);
//        // 将每一行映射成一个List
//        // 跳过第一行
//        // List<List<String>> rsListListSkipFirst = util.readToListList(file);
//        //不跳过第一行
//        List<List<String>> rsListListNoSkip = util.readToListList(file, false);
//        // 读取文件中所有的表格
//        // 跳过第一行
//        // List<List<List<String>>> rsAllListList = readAllSheetToListList(file);
//        // 不跳过第一行
//        List<List<List<String>>> rsAllListList = readAllSheetToListList(file, false);
//        // 读取文件中所有的表格映射为ListMap类型
//        List<List<Map<String, String>>> rsAllListMap = readAllSheetToListMap(file);
        FileInputStream fileInputStream = new FileInputStream(file);
          List<List<String>> rsListListSkipFirst = util.readToListList(fileInputStream,false);
        for(int i=0;i<rsListListSkipFirst.size() ;i++) {
            List<String> list = rsListListSkipFirst.get(i);
            System.out.println(list.get(0));
            System.out.println(list.get(1));
            System.out.println(list.get(2));
            System.out.println(list.get(3));
            System.out.println(list.get(4));
        }

    }

}


