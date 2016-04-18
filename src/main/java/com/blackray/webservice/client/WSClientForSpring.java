package com.blackray.webservice.client;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.blackray.webservice.model.Person;
import com.blackray.webservice.service.HelloWorldService;

public class WSClientForSpring {
    public static void main(String[] args) {
              JaxWsProxyFactoryBean svr = new JaxWsProxyFactoryBean();
              svr.setServiceClass(HelloWorldService.class);			//���÷�����class
              svr.setAddress("http://localhost:8080/loving/remote/HelloWorld");	//���ʼ�����spring�е�wsdl��ַ
              
              HelloWorldService hw = (HelloWorldService) svr.create();	//��÷�����ʵ��
              
              System.out.println(hw.sayHi("Hejinsheng"));	//���÷���
              
              Person person = new Person();
              person.setName("Tony");
              person.setDescription("test");
              System.out.println(hw.sayHiToUser(person));	//���÷���
    }
}
