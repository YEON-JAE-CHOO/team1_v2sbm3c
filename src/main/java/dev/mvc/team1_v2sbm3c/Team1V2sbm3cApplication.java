package dev.mvc.team1_v2sbm3c;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class Team1V2sbm3cApplication {

	public static void main(String[] args) {
		SpringApplication.run(Team1V2sbm3cApplication.class, args);
	}

}
