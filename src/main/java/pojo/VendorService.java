package pojo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import myconnection.MyconnectionCheck;

public class VendorService {
	public List<Vendor> getallvendor(){
		Connection con=MyconnectionCheck.getConnection();
		Statement st;
		List<Vendor> vendors=new ArrayList<Vendor>();
		try {
			st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from vendor1");
			while(rs.next()) {
				Vendor ven=new Vendor();
				ven.setVendorname(rs.getString("vendorname"));
				ven.setVendoraddress(rs.getString("vendoraddress"));
				ven.setVendorid(rs.getInt("vendorid"));
				ven.setVendormail(rs.getString("vendoraddress"));
				ven.setVendornumber(rs.getString("vendornumber"));
				ven.setVendorpassword(rs.getString("vendorpassword"));
				ven.setVendorimage(rs.getString("vendorimage"));
				ven.setVendortype(rs.getString("vendortype"));
				vendors.add(ven);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return vendors;
	}

}
