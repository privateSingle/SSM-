package com.zw.admin.server.service;

import java.io.FileInputStream;

public interface DataHandlerService {

    void dataHandler(String type, FileInputStream fin);
}
