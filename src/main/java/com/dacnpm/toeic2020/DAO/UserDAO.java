package com.dacnpm.toeic2020.DAO;

import java.util.List;
import java.util.Map;




public interface UserDAO<E> extends BaseDAO<E>  {
	public int Login(String username,String password);
	public boolean checkUserName(String username);
}
