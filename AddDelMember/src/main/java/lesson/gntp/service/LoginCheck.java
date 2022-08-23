package lesson.gntp.service;

import java.sql.SQLException;

import lesson.gntp.dao.DataAccessObject;
import lesson.gntp.vo.ValueObject;

public class LoginCheck {
		// id pw 일치한다면
		public boolean isMember(String id, String pwd) {
			boolean flag = false;
			DataAccessObject dao = new DataAccessObject();
			try {
				flag = dao.selectMember(id,pwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			flag = true;
			
			return flag;
		}
		
		// vo 호출
		public ValueObject getMember(String id, String pwd) {
			ValueObject vo = null;
			DataAccessObject dao = new DataAccessObject();
			try {
				vo = dao.selectMemberInfo(id,pwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
		}
}
