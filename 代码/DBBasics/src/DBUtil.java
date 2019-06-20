import java.sql.*;
//import java.sql.DriverManager;

public class DBUtil {

	//�������ݿ�����ӳر���
	//��Ҫ��΢��˾����sqljdbc42.jar��������WEB-INF/lib�У���ΪJDBC����
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=AdventureWorks2008R2";
    private static final String USER="sa";
    private static final String PASSWORD="123456";

  
    //�����ṩһ����������ȡ���ݿ�����
    public Connection getConnection() {
    	
    	try {
    		Class.forName( DRIVER ) ;
    		System.out.println( "���ݿ�����[ " + DRIVER + "] ���سɹ�." );
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();
    		System.out.println( "���ݿ�����[ " + DRIVER + "] ����ʧ��" );
    	}
    	
    	Connection conn = null ;
    	
    	try {
    		conn = DriverManager.getConnection(URL, USER, PASSWORD);
    		return conn ; 
    	} catch (SQLException e) {
    		throw new RuntimeException( "�������ݿ�ʧ��" , e );
    	}
    	
    }
    
    //�ر�����
    public void closeConnection(Connection con,PreparedStatement ps,ResultSet rs) throws SQLException{
    	if(rs!=null){
    		rs.close();
    	}
    	if(ps!=null){
    		ps.close();
    	}
    	if(con!=null){
    		con.close();
    	}
    }

}
