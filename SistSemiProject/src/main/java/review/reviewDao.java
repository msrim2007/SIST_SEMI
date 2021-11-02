package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class reviewDao {

	DbConnect db=new DbConnect();
	
	
	//insert
	public void insertReview(reviewDto dto) {
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into review (num, movie_num,user_num,subject,content,likes,writeday) values(?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMovie_num());
			pstmt.setString(3, dto.getUser_num());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getLikes());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//totalcount(페이징처리..1)
		public int getTotalCount() {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null; 
			
			int n=0;
			
			String sql="select count(*) from review";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) 
					n=rs.getInt(1);
							
			} catch (SQLException e) {
			} finally {
				db.dbClose(rs, pstmt, conn);
			}				
			return n;
		}
		
		
		//2.페이징 처리에 필요한 리스트만 보내기
		public List<reviewDto>getList(int start,int perPage){
			List<reviewDto>list=new Vector<reviewDto>();
					
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
					
			String sql="select * from review order by num desc limit ?,?";
					
			try {
				pstmt=conn.prepareStatement(sql);
						
				//?바인딩..파라메타값으로 넘긴 거
				pstmt.setInt(1, start);
				pstmt.setInt(2, perPage);
						
				//실행
				rs=pstmt.executeQuery();
						
				while(rs.next()) {
					reviewDto dto=new reviewDto();
							
					dto.setNum(rs.getString("num"));
					dto.setMovie_num(rs.getString("movie_num"));
					dto.setUser_num(rs.getString("user_num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));						
					dto.setLikes(rs.getInt("likes"));
					dto.setWriteday(rs.getTimestamp("writeday"));
							
					list.add(dto);	
				}		
			} catch (SQLException e) {								
			} finally {
				db.dbClose(rs, pstmt, conn);
			}		
			return list;
		}
		
		
		//수정에 필요한 num에 해당한 dto 반환
				public reviewDto getData(String num) {
					
					reviewDto dto=new reviewDto();
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select * from review where num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						
						//?바인딩
						pstmt.setString(1, num);
						//실행
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							dto.setNum(rs.getString("num"));
							dto.setMovie_num(rs.getString("movie_num"));
							dto.setUser_num(rs.getString("user_num"));
							dto.setSubject(rs.getString("subject"));
							dto.setContent(rs.getString("content"));						
							dto.setLikes(rs.getInt("likes"));
							dto.setWriteday(rs.getTimestamp("writeday"));
						}				
					} catch (SQLException e) {
					} finally {
						db.dbClose(rs, pstmt, conn);
					}		
					return dto;
				}
				
				
				//수정
				public void updateReview(reviewDto dto) {
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="update review set subject=?,content=? where num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						
						//?바인딩
						pstmt.setString(1, dto.getSubject());
						pstmt.setString(2, dto.getContent());
						pstmt.setString(3, dto.getNum());
						
						//실행
						pstmt.execute();
						
					} catch (SQLException e) {
					} finally {
						db.dbClose(pstmt, conn);
					}
				}
				
				
				//삭제
				public void deleteReview(String num) {
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="delete from review where num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						
						pstmt.setString(1, num);
						
						pstmt.execute();
						
					} catch (SQLException e) {
					} finally {
						db.dbClose(pstmt, conn);
					}
				}
				
				
				//추천수
				public void updateLikes(String num) {
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="update review set likes=likes+1 where num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						
						pstmt.setString(1, num);
						
						pstmt.execute();
						
					} catch (SQLException e) {
					} finally {
						db.dbClose(pstmt, conn);
					}
				}				
}
