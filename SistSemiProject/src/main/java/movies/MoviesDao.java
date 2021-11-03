package movies;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

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
}
