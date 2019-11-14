package dbexample;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MybatisTest {
	public static void main(String[] args) throws Exception {
		// ָ��ȫ�������ļ�
		String resource = "mybatis-config.xml";
		// ��ȡ�����ļ�
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// ����sqlSessionFactory
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// ��ȡsqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			// ����CRUD����һ��������ָ��statement�����������ռ�+��.��+statementId
			// �ڶ���������ָ������sql�Ĳ������������û�id
			Address address = sqlSession.selectOne("MyMapper.loadAddress", 1);
			System.out.println(address.getAddressLine1());
		} finally {
			sqlSession.close();
		}
	}
}