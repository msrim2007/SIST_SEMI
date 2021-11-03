package movies;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MoviesDto {
	private String movie_num, kr_title, en_title, genre, director;
	private Date openDate;
}
