package pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderService(Connection con) {
		this.con=con;
	}
	
	public boolean insertorder(Order order) {
		boolean result=false;
		try {
			query="insert into order1(Foodid,userid,quantity,date)values(?,?,?,?)";
			pst=this.con.prepareStatement(query);
			pst.setInt(1,order.getFoodid());
			pst.setInt(2,order.getUid());
			pst.setInt(3,order.getQuantity());
			pst.setString(4,order.getDate());
			pst.executeUpdate();
			result=true;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Order> userorder(int id){
		List<Order> list=new ArrayList<Order>();
		try{
			query="select * from order1 where userid=? order by orderid desc";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			
			while(rs.next()) {
				Order order=new Order();
				FoodService foodService=new FoodService();
				int fId= rs.getInt("Foodid");
				
				Fooditems food=foodService.getSingleFood(fId);
				order.setOrderid(rs.getInt("orderid"));
				order.setFoodid(fId);
				order.setFoodname(food.getFoodname());
				order.setFoodprice(food.getFoodprice()*rs.getInt("quantity"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("date"));
				list.add(order);
				
			}
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void cancelorder(int id) {
		try {
		    query="delete from order1 where orderid=?";
		    pst=this.con.prepareStatement(query);
		    pst.setInt(1, id);
		    pst.execute();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	
}
