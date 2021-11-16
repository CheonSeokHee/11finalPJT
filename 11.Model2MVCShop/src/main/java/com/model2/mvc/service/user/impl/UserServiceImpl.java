package com.model2.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import com.model2.mvc.service.user.UserDao;;


//==> ȸ������ ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	public boolean checkDuplication(String userId) throws Exception {
		
		boolean result = true;
		
		User user=userDao.getUser(userId);
		
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public void deleteUser(User user) throws Exception {		
		
		userDao.deleteUser(user);		
	}

	public User userIdCount(String userId) throws Exception {
		
		return userDao.userIdCount(userId);
		
	}
	
	public void certifiedPhoneNumber(String phone, String numStr) {

		
		System.out.println("certifiedPhoneNumber�� ����!!!!" );
		
		
        String api_key = "NCSWFEMUR2ZRWEA7";
        String api_secret = "FEKNKTGJGT66XNNXREH5RQ3WKP6OSCU4";
        
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        
        params.put("to", phone);    // ������ȭ��ȣ
        params.put("from", "01098958180");    // �߽���ȭ��ȣ. �׽�Ʈ�ÿ��� �߽�,���� �Ѵ� ���� ��ȣ�� �ϸ� ��
        params.put("type", "SMS");
        params.put("text", "������ �޴������� �޽��� : ������ȣ��" + "["+numStr+"]" + "�Դϴ�.");
        params.put("app_version", "test app 1.2"); // application name and version

        
        System.out.println("���� �� ����"+params);
        
        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
            
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
	

}