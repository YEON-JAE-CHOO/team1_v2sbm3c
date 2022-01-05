package dev.mvc.cate;

import java.io.File;

public class Cate {

	// Windows, VMWare, AWS cloud 절대 경로 설정
	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {
			path = "C:/kd1/deploy/team1_v2sbm3c/cate/storage/";

			System.out.println("Windows 10: " + path);

		} else {
			// System.out.println("Linux");
			path = "/home/ubuntu/deploy/team1_v2sbm3c/menu/storage/";
		}

		return path;
	}

}
