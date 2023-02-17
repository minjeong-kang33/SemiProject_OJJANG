package com.itwillbs.deal.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.like.db.LikeDTO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.sell.db.SellDTO;

public class DealDAO {
	
		public Connection getConnection() throws Exception{
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
		}		
		
	public ArrayList<DealDTO> dealList(String M_id){
		ArrayList<DealDTO> dealList=new ArrayList<DealDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from deal where M_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				DealDTO dto=new DealDTO();
				dto.setD_num(rs.getInt("D_num"));
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setD_buy(rs.getString("D_buy"));
				dto.setD_date(rs.getTimestamp("D_date"));
				
				dealList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dealList;
	}//판매내역
	

	public ArrayList<DealDTO> dealListB(String M_id){
		ArrayList<DealDTO> dealList=new ArrayList<DealDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from deal where D_buy=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				DealDTO dto=new DealDTO();
				dto.setD_num(rs.getInt("D_num"));
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setD_buy(rs.getString("D_buy"));
				dto.setD_date(rs.getTimestamp("D_date"));
				
				dealList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dealList;
	} //구매내역 
	
	
	
	
	
	
	
	
	
	
	//deal 테이블!
	
	public void insertDeal(int S_num,String M_id, String M_ids) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			int D_num=1;
			String sql="select max(D_num) from deal";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				D_num=rs.getInt("max(D_num)")+1;
				
			}						
			sql="insert into deal(D_num,S_num,M_id,D_buy,D_play) values(?,?,?,?,'거래중')";
			pstmt=con.prepareStatement(sql);
//			SellDTO dto=new SellDTO();
			pstmt.setInt(1,D_num);
			pstmt.setInt(2,S_num);
			pstmt.setString(3,M_ids); //판매자
			pstmt.setString(4, M_id);		//구매자	
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
			}		
	}
	
	public DealDTO CheckDeal(String M_id, int S_num) {
		DealDTO dto=null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
		     String sql="select * from deal where D_buy=? and S_num=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,M_id);
			 pstmt.setInt(2,S_num);
			 rs=pstmt.executeQuery(); 
			 
			 if(rs.next()){
				dto=new DealDTO(); 
				dto.setD_buy(rs.getString("M_id"));
				dto.setS_num(rs.getInt("S_num"));
			 }else{
				 
			 }
		}catch (Exception e) {	
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}

		}
		return dto;
	}
	
	public ArrayList<DealDTO> DealWantList(String S_num){
		ArrayList<DealDTO> DealWantList=new ArrayList<DealDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from deal where S_num=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, S_num);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				DealDTO dto=new DealDTO();
				dto.setD_buy(rs.getString("D_buy"));
				dto.setD_date(rs.getTimestamp("D_date"));
				dto.setD_num(rs.getInt("D_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_num(rs.getInt("S_num"));
				
				DealWantList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return DealWantList;
	}
	
	
	
	//거래완료 누르면 실행되는 거 <수정해야함>
//	public DealDTO dealWant(String M_id, int S_num){
//		Connection con =null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			con=getConnection();
//			String sql="update deal set D_play='거래중' where M_id=?, S_num=?";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, M_id);
//			pstmt.setInt(2, S_num);
//			
//			rs=pstmt.executeQuery();	
//
//			while(rs.next()) {
//				
//				DealDTO dto=new DealDTO();
//				dto.setD_num(rs.getInt("D_num"));
//				dto.setS_num(rs.getInt("S_num"));
//				dto.setM_id(rs.getString("M_id"));
//				dto.setD_buy(rs.getString("D_buy"));
//				dto.setD_date(rs.getTimestamp("D_date"));
//				
//				dealWant.add(dto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			
//			if(rs!=null) try { rs.close();} catch (Exception e2) {}
//			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
//			if(con!=null) try { con.close();} catch (Exception e2) {}
//		}
//		return dealWant;
//	} 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
}
