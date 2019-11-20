package dbexample;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AddressDAO {
	private SqlSession sqlSession;
	
    public void setUp() throws IOException {
        // ָ�������ļ�
        String resource = "mybatis-config.xml";
        // ��ȡ�����ļ�
        InputStream inputStream = Resources.getResourceAsStream(resource);
        // ����sqlSessionFactory
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // ��ȡsqlSession
        sqlSession = sqlSessionFactory.openSession(true);
    }

	public Address loadAddress(int id) throws IOException{
		Address address = null;
		setUp();
		try {
			address = sqlSession.selectOne("MyMapper.loadAddress", id);
		} finally {
			sqlSession.close();
		}
		return address;
	}

	public List<Address> findAll() throws IOException {
		List<Address> addressList = new ArrayList<Address>();
		setUp();
		try {
			addressList = sqlSession.selectList("MyMapper.findAll");
		} finally {
			sqlSession.close();
		}
		return addressList;
	}

	public void addAddress(Address address) throws IOException {
		setUp();
		try {
			sqlSession.insert("MyMapper.addAddress", address);
		} finally {
			sqlSession.close();
		}
	}

	public void deleteAddress(int id) throws IOException {
		setUp();
		try {
			sqlSession.delete("MyMapper.deleteAddress", id);
		} finally {
			sqlSession.close();
		}
	}

	public void updateAddress(Address address) throws IOException {
		setUp();
		try {
			sqlSession.update("MyMapper.updateAddress", address);
		} finally {
			sqlSession.close();
		}
	}
}
