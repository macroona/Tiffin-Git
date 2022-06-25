package pojo;

public class Vendor {
	int vendorid;
	String vendorname;
	String vendorpassword;
	String vendormail;
	String vendornumber;
	String vendoraddress;
	String vendorimage;
	String vendortype;
	public Vendor(int vendorid, String vendorname, String vendorpassword, String vendormail, String vendornumber,
			String vendoraddress, String vendorimage,String vendortype) {
		super();
		this.vendorid = vendorid;
		this.vendorname = vendorname;
		this.vendorpassword = vendorpassword;
		this.vendormail = vendormail;
		this.vendornumber = vendornumber;
		this.vendoraddress = vendoraddress;
		this.vendorimage=vendorimage;
		this.vendortype=vendortype;
	}
	public String getVendorimage() {
		return vendorimage;
	}
	public void setVendorimage(String vendorimage) {
		this.vendorimage = vendorimage;
	}
	public String getVendortype() {
		return vendortype;
	}
	public void setVendortype(String vendortype) {
		this.vendortype = vendortype;
	}
	public Vendor() {
		
	}
	public int getVendorid() {
		return vendorid;
	}
	public void setVendorid(int vendorid) {
		this.vendorid = vendorid;
	}
	public String getVendorname() {
		return vendorname;
	}
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	public String getVendorpassword() {
		return vendorpassword;
	}
	public void setVendorpassword(String vendorpassword) {
		this.vendorpassword = vendorpassword;
	}
	public String getVendormail() {
		return vendormail;
	}
	public void setVendormail(String vendormail) {
		this.vendormail = vendormail;
	}
	public String getVendornumber() {
		return vendornumber;
	}
	public void setVendornumber(String vendornumber) {
		this.vendornumber = vendornumber;
	}
	public String getVendoraddress() {
		return vendoraddress;
	}
	public void setVendoraddress(String vendoraddress) {
		this.vendoraddress = vendoraddress;
	}
	

}
