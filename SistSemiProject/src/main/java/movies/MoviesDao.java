package movies;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class MoviesDao {
	DbConnect db = new DbConnect();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public void insertMovies(MoviesDto dto) {
		String sql = "INSERT INTO movies VALUES(" + dto.getMovie_num() + ", '";
		sql += dto.getKr_title() + "', '" + dto.getEn_title() + "', '" + sdf.format(dto.getOpenDate()) + "', '";
		sql += dto.getGenre() + "', '" + dto.getDirector() + "')";
		
		Connection conn = db.getConnection();
		Statement st = null;
		try {
			st = conn.createStatement();
			st.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(st, conn);
		}
	}
	
	public String getTitle(String movie_code) {
		String title = "";
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT kr_title FROM movies WHERE movie_num = '" + movie_code + "'");
			if(rs.next()) {
				title = rs.getString("kr_title");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return title;
	}
	
	public ArrayList<MoviesDto> getAllDatas() {
		ArrayList<MoviesDto> list = new ArrayList<MoviesDto>();
		MoviesDto dto;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM movies");
			while (rs.next()) {
				dto = new MoviesDto();
				dto.setDirector(rs.getString("director"));
				dto.setEn_title(rs.getString("en_title"));
				dto.setGenre(rs.getString("genre"));
				dto.setKr_title(rs.getString("kr_title"));
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setOpenDate(rs.getTimestamp("opendate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return list;
	}
}

