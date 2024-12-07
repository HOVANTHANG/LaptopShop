package vn.ThangKa.LapTopShop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LapTopShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(LapTopShopApplication.class, args);
	}

}
