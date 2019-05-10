package com.sp.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

@Service("common.xmlSerializer")
public class XMLSerializer {
	
	public JSONObject xmlToJson(String url) {
		JSONObject resultJSON = null;
		HttpURLConnection conn = null;
		try {
			conn = (HttpURLConnection)new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			StringBuilder sb = new StringBuilder();
            String s; 
            while ((s=br.readLine()) != null) {
                sb.append(s);
            }
            resultJSON = XML.toJSONObject(sb.toString()); 
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null) {
				try {
					conn.disconnect();
				} catch (Exception e2) {
				}
			}
		}
		
		return resultJSON;
	}
	
	
	public String xmlToJsonString(String spec) {
		// XML 문서를 String 형태의 JSON으로 변환(공공 API 등에서 활용)
		
		String resultJSON = null;
		HttpURLConnection conn = null;
		try {
			conn = (HttpURLConnection)new URL(spec).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			StringBuilder sb = new StringBuilder();
            String s;  //API에서 xml을 싹 긁어서 string Buffer에 담고
            while ((s=br.readLine()) != null) {
                sb.append(s);
            }
            JSONObject job = XML.toJSONObject(sb.toString()); //String으로 보내준다. 
            resultJSON = job.toString();
            // resultJSON = job.toString(4); // 4 : 들여쓰기 값
            // System.out.println(resultJSON);
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null) {
				try {
					conn.disconnect();
				} catch (Exception e2) {
				}
			}
		}
		
		return resultJSON;
	}
	
	public String xmlToString(String spec) {
		// XML 문서를 String 형태의 JSON으로 변환(공공 API 등에서 활용)
		
		String resultXML = null;
		HttpURLConnection conn = null;
		try {
			conn = (HttpURLConnection)new URL(spec).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			StringBuilder sb = new StringBuilder();
            String s; //얘도 똑같이 stringbuffer에 xml 내용을 싹 담는다.
            while ((s=br.readLine()) != null) {
                sb.append(s);
            }
            resultXML= sb.toString(); //그대로 String 형태의 xml로만 변환한다. 
		} catch (Exception e) { 
			System.out.println(e.toString());
		} finally {
			if(conn!=null) {
				try {
					conn.disconnect();
				} catch (Exception e2) {
				}
			}
		}
		
		return resultXML;
	}
}
