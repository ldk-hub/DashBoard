package com.com.gentelella.controller;

import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com.gentelella.repository.CoinRepository;
import com.com.gentelella.vo.CoinData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class CoinController {

	@Autowired
	private CoinRepository coinRepository;
	
	@RequestMapping(value = "/tradeService", method = RequestMethod.GET)
	public String tradeService(Map<String, String> paramMap, ModelMap map) throws Exception {
		return  "dashboard/tradeService";
	}
	
	
	//종목명 호출 로직
	@RequestMapping(value = "/coinList", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object coinList(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
		//조회기능구현 완료 Mybatis -> JPA
		return resultGridData(coinRepository.findAll(),paramMap);
	}
	//JPA전용 배열 분할처리
	public Object resultGridData(List<CoinData> list, Map<String, String> paramMap) throws JsonProcessingException, SQLException{
		HashMap <String,Object> res = new HashMap <String,Object>();
		HashMap <String,Object> data = new HashMap <String,Object>();
		data.put("contents", list);
		res.put("result",true);
		res.put("data",data);
		if(list.size()>0) {
			ObjectMapper jackson = new ObjectMapper();
			String jsonString = jackson.writeValueAsString(res);
			return jsonString;
		}
		return null;
	}
	
	
	
	
	
	//매수 버튼 액션
//	@RequestMapping(value = "/buyStock", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
//	@ResponseBody
//	public Object buyStock(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
//			Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
//			String userInfo = loggedInUser.getName();
//			String stockBuyName = paramMap.get("buyStockName");//종목명
//			long stockBuyPrice = Integer.parseInt(paramMap.get("buyStock"));//매수가격
//			long stockBuyVolume = Integer.parseInt(paramMap.get("buyStockCnt"));//수량
//			//매수액션
//			SME.getMatcher(stockBuyName).buy(stockBuyPrice, stockBuyVolume, userInfo);
//			//SME.getMatcher(stockBuyName).getOrderList(userInfo).forEach(System.out::println);
//			//SME.getMatcher(stockBuyName).getMatchList(userInfo).forEach(System.out::println);
//			//인자없음 매수호가리스트
//			List<HogaInfo> hogaBuyReturn = SME.getMatcher(stockBuyName).getBuyList();
//	    return hogaBuyReturn;
//	}
//	
//	//매도 버튼 액션
//	@RequestMapping(value = "/sellStock", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
//	@ResponseBody
//	public Object sellStock(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
//		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
//		String userInfo = loggedInUser.getName();
//		String stockSellName = paramMap.get("sellStockName");//종목명
//		long stockSellPrice = Integer.parseInt(paramMap.get("sellStock"));//매수가격
//		long stockSellVolume = Integer.parseInt(paramMap.get("sellStockCnt"));//수량
//		// 주문 제출
//	    SME.getMatcher(stockSellName).sell(stockSellPrice, stockSellVolume, userInfo);
//	    //찍어보기
//		//SME.getMatcher(stockSellName).getOrderList(userInfo).forEach(System.out::println);
//		//SME.getMatcher(stockSellName).getMatchList(userInfo).forEach(System.out::println);
//		//인자없음 매수호가리스트
//		//SME.getMatcher(stockSellName).getBuyList().forEach(System.out::println);
//		List<HogaInfo> hogaSellReturn = SME.getMatcher(stockSellName).getSellList();
//	    return hogaSellReturn;
//	}
//	
//	//종목 생성 로직
//	@RequestMapping(value = "/stockCreate", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
//	@ResponseBody
//	public void stockCreate(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
//		//System.out.println( paramMap.get("stockCreateName"));
//		 AssetInfo ass = new AssetInfo(null, null, 0, 0, 0); 
//		 ass.name = paramMap.get("service_code");
//		 ass.price = Integer.parseInt(paramMap.get("first_price").toString());
//		 ass.krname = paramMap.get("stockCreateName");
//		//SME.createMatcher(paramMap.get("stockCreateName"));//종목명 생성 전달해서 넣기 
//		SME.createMatcher(paramMap.get("service_code"), ass);
//	}
//	
//	
//	//개별 종목 체결내역 
//	//차장님께 추가요청드려야할 파트임 내가넣으려했으나 잘안됨.
//	@RequestMapping(value = "/StockInfo", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
//	@ResponseBody
//	public Object StockInfo(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
//		
//		//일로젅달받음
//		String stockBuyName = paramMap.get("param");
//		List<MatchInfo> MatchList = SME.getMatcher(stockBuyName).getMatchList(null);
//		HashMap <String,Object> res = new HashMap <String,Object>();
//		HashMap <String,Object> data = new HashMap <String,Object>();
//		long test3 = 0;
//		
//		//널 체크
//		if(MatchList.equals(null)== false) {
//			for (int i =0; i<MatchList.size(); i++) {
//				long test = MatchList.get(i).price;
//				long test2 = MatchList.get(i).amount;
//				test3 =(test * test2);
//				MatchList.get(i).strTotal = String.valueOf(test3);
//				//System.out.println(">>>>>>>>>ㅈ발"+MatchList);
//			}
//		}
//		
//		
//		data.put("contents", MatchList);
//		res.put("result",true);
//		res.put("data",data);
//		
//		
//		if(MatchList.size()>0) {
//			ObjectMapper jackson = new ObjectMapper();
//			String jsonString = jackson.writeValueAsString(res);
//			return jsonString;
//		}
//		return null;
//	}
	
	//거래페이지 상단 데이터
	@RequestMapping(value = "/hogaStockInfo", method = RequestMethod.GET)
	@ResponseBody
	public Object hogaStockInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		HashMap <String,Object> data = new HashMap <String,Object>();	
			 String HiddenStockCode = paramMap.get("HiddenStockCode");
			 String HiddenCoinName = paramMap.get("HiddenCoinName");
			 String price = paramMap.get("HiddenstockCoinPrice");
			 data.put("HiddenstockCoinPrice", price);
			 data.put("HiddenCoinName", HiddenCoinName);
			//매수호가
			//List<HogaInfo> BuyList = SME.getMatcher(HiddenStockCode).getBuyList();
			//data.put("stockBuyHoga", BuyList);
			
			//매도호가
		   // List<HogaInfo> SellList =   SME.getMatcher(HiddenStockCode).getSellList();
		  //  Collections.reverse(SellList);//리스트 역순으로 리버스 시킴 호가창 순서 출력때문에
		  //  data.put("stockSellHoga", SellList);
	    return data;
	}
	
	
}
