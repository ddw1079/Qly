package com.qly.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;



public class GeoUtil {
	private static final String KAKAO_API_KEY = "237d944dcb6fcfb6d8491443279ef2d7";

	public static double[] getLatLngFromAddress(String address) throws Exception {
		String query = URLEncoder.encode(address, "UTF-8");
		String apiURL = "https://dapi.kakao.com/v2/local/search/address.json?query=" + query;

		HttpURLConnection conn = (HttpURLConnection) new URL(apiURL).openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null)
			sb.append(line);
		br.close();

		JSONObject json = new JSONObject(sb.toString());
		JSONArray documents = json.getJSONArray("documents");
		if (documents.length() == 0)
			return null;

		JSONObject location = documents.getJSONObject(0);
		double longitude = location.getDouble("x"); // 경도
		double latitude = location.getDouble("y"); // 위도

		return new double[] { latitude, longitude };
	}
}
