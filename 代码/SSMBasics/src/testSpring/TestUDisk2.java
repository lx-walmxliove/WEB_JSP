package testSpring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestUDisk2 {
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("UDiskBeans.xml");
		// �������л��idΪUDiskBean��bean
		//IUDisk uDisk = (IUDisk)ctx.getBean("UDiskBean");
		IUDisk uDisk = ctx.getBean("UDiskBean", IUDisk.class);

		// IUDisk uDisk = new UDisk();

		System.out.println(uDisk);
		uDisk.setName("UD2");
		System.out.println(uDisk);
	}
}
