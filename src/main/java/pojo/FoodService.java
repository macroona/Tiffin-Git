package pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import myconnection.MyconnectionCheck;

public class FoodService {
	
	public List<Fooditems> getAllFood()
	{
		Connection con=MyconnectionCheck.getConnection();
		Statement st;
		List<Fooditems> food=new ArrayList<Fooditems>();
		try
		{
			st= con.createStatement();
			ResultSet rs= st.executeQuery(" select * from fooditem");
			while(rs.next())
			{
				Fooditems foods = new Fooditems();
				foods.setFoodid(rs.getInt("foodid"));
				foods.setFoodname(rs.getString("foodname"));
				foods.setFoodprice(rs.getInt("foodprice"));
				foods.setFoodtype(rs.getString("foodtype"));
				foods.setVendorid(rs.getInt("vendorid"));
				food.add(foods);
			}
			
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return food;
	}
	public List<Cart> getCartProducts(ArrayList<Cart> cartlist){
		Connection con=MyconnectionCheck.getConnection();
		List<Cart> product=new ArrayList<Cart>();
		
		try {
			if(cartlist.size()>0) {
				for(Cart item:cartlist) {
					String query="Select * from fooditem where Foodid=?";
					PreparedStatement pst=con.prepareStatement(query);
					pst.setInt(1,item.getFoodid());
					ResultSet rs=pst.executeQuery();
					while(rs.next()) {
						Cart row= new Cart();
						row.setFoodid(rs.getInt("Foodid"));
						row.setFoodname(rs.getString("foodname"));
						row.setFoodprice(rs.getInt("foodprice")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						product.add(row);
					}
				}
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public int gettotalcartprice(ArrayList<Cart> cartlist) {
		Connection con=MyconnectionCheck.getConnection();
		int sum=0;
		try {
			if(cartlist.size()>0) {
				for(Cart item: cartlist) {
					String query="select * from fooditem where Foodid=?";
					PreparedStatement pst=con.prepareStatement(query);
					pst.setInt(1,item.getFoodid());
					ResultSet rs=pst.executeQuery();
					while(rs.next()) {
						sum+=rs.getInt("foodprice")*item.getQuantity();
					}
					
			
			}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
	return sum;
	}
	public Fooditems getSingleFood(int fId) {
		Connection con=MyconnectionCheck.getConnection();
		Fooditems fooditems=null;
		try {
			String query="select * from fooditem where Foodid=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, fId);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				fooditems=new Fooditems();
				fooditems.setFoodid(rs.getInt("Foodid"));
				fooditems.setFoodname(rs.getString("foodname"));
				fooditems.setFoodtype(rs.getString("foodtype"));
				fooditems.setFoodprice(rs.getInt("foodprice"));
				
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return fooditems;
	}

}