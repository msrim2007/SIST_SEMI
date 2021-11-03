package movies;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MoviesDto {
	private String movie_num, kr_title, en_title, type, genre, director, company;
	private Date open_date;
}
