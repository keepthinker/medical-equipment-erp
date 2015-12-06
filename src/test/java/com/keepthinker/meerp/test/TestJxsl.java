package com.keepthinker.meerp.test;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.TestCase;
import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

public class TestJxsl  extends TestCase {
	public void testSimpleBean(){
		
		List<Employee> list = new ArrayList<Employee>();
		list.add(new Employee("John", 22, 10000, 0.2));
		list.add(new Employee("Sheree", 22, 10000, 0.2));
		list.add(new Employee("Shawn", 25, 15000, 0.2));
		
		Department department;
		department = new Department("外科");
		department.setChief(new Employee("Jack", 43, 20000, 0.5));
		department.setStaff(list);

		List<Department> list2 = new ArrayList<Department>();
		list2.add(department);
        Map beans = new HashMap();
        beans.put("departments", list2);
        URL url = this.getClass().getClassLoader().getResource("");
        this.getClass().getProtectionDomain().getCodeSource().getLocation();
        String srcFilePath = url.getPath() + "basictags.xls";
        System.err.println(srcFilePath);
        XLSTransformer transformer = new XLSTransformer();
        try {
			transformer.transformXLS(srcFilePath, beans, "D:/output.xls");
		} catch (ParsePropertyException | InvalidFormatException | IOException e) {
			e.printStackTrace();
		}
        
        URL location = getClass().getProtectionDomain().getCodeSource().getLocation();
        System.out.println(location.getPath());
	}
}

