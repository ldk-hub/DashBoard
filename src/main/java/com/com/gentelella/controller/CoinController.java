package com.com.gentelella.controller;

import java.sql.SQLException;
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
import com.com.gentelella.vo.CoinHogaData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

//거래소 페이지 주요로직
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
			    //List<HogaInfo> SellList =   SME.getMatcher(HiddenStockCode).getSellList();
			   // Collections.reverse(SellList);//리스트 역순으로 리버스 시킴 호가창 순서 출력때문에
			  //  data.put("stockSellHoga", SellList);
		    return data;
		}
	
	
	
	//매수 버튼 액션
	@RequestMapping(value = "/buyStock", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object buyStock(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
			Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
			String userInfo = loggedInUser.getName();
			String stockBuyName = paramMap.get("buyStockName");//종목명
			long stockBuyPrice = Integer.parseInt(paramMap.get("buyStock"));//매수가격
			long stockBuyVolume = Integer.parseInt(paramMap.get("buyStockCnt"));//수량
			
			//JPA를 빌더를 사용하여 insert 하는 로직
			CoinHogaData entity = CoinHogaData.builder()
											  .coin_code(userInfo)
											  .coin_name(stockBuyName)
											  .hoga_data(stockBuyPrice)
											  .total_price(stockBuyPrice)
											  .stock_count(stockBuyVolume)
											  .stock_price(stockBuyPrice)
											  .build();
			//jpa .save()<<--- insert 
			coinRepository.save(entity);
			//jpa .delete() <<-- delete
			//coinRepository.delete(stockBuyVolume);
			//매수액션
			//SME.getMatcher(stockBuyName).buy(stockBuyPrice, stockBuyVolume, userInfo);
			//SME.getMatcher(stockBuyName).getOrderList(userInfo).forEach(System.out::println);
			//SME.getMatcher(stockBuyName).getMatchList(userInfo).forEach(System.out::println);
			//인자없음 매수호가리스트
			//List<HogaInfo> hogaBuyReturn = SME.getMatcher(stockBuyName).getBuyList();
	    return null; //hogaBuyReturn;
	}
	
	//매도 버튼 액션
	@RequestMapping(value = "/sellStock", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object sellStock(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String userInfo = loggedInUser.getName();
		String stockSellName = paramMap.get("sellStockName");//종목명
		long stockSellPrice = Integer.parseInt(paramMap.get("sellStock"));//매수가격
		long stockSellVolume = Integer.parseInt(paramMap.get("sellStockCnt"));//수량
		
		
		//매도 테이블 로직도짜야함
//		CoinHogaData entity = CoinHogaData.builder()
//										  .coin_code(userInfo)
//										  .coin_name(stockBuyName)
//										  .hoga_data(stockBuyPrice)
//										  .total_price(stockBuyPrice)
//										  .stock_count(stockBuyVolume)
//										  .stock_price(stockBuyPrice)
//										  .build();
//
//		coinRepository.save(entity);
//			
			
		// 주문 제출
	    //SME.getMatcher(stockSellName).sell(stockSellPrice, stockSellVolume, userInfo);
	    //찍어보기
		//SME.getMatcher(stockSellName).getOrderList(userInfo).forEach(System.out::println);
		//SME.getMatcher(stockSellName).getMatchList(userInfo).forEach(System.out::println);
		//인자없음 매수호가리스트
		//SME.getMatcher(stockSellName).getBuyList().forEach(System.out::println);
		//List<HogaInfo> hogaSellReturn = SME.getMatcher(stockSellName).getSellList();
	    return null;//hogaSellReturn;
	}

//	//개별 종목 체결내역 
	@RequestMapping(value = "/StockInfo", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object StockInfo(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
		String stockBuyName = paramMap.get("param");
		//List<MatchInfo> MatchList = SME.getMatcher(stockBuyName).getMatchList(null);
		HashMap <String,Object> res = new HashMap <String,Object>();
		HashMap <String,Object> data = new HashMap <String,Object>();
	
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
		return null;
	}
	
	//jpa 호출 로직 시작
		/*EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");//퍼시스턴스유닛 네임 설정한 DB랑 맵핑해서 정보 호출
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();
		
		tx.begin();//트랜잭션시작
			try {
				//내부 로직 돌리기
				MainData md = new MainData();
				//테이블 여러번 호출테스트
				
				System.out.println("@$!#!@#!@#!@#"+md.toString());
				tx.commit();//작업내용 삽입
			}catch(Exception e) {
				tx.rollback();//트랜잭션 오류발생시 롤백
			}finally {
				em.close();//엔티티매니저 종료
			}
		emf.close();//모든 플로우 진행 후종료
	*/		//jpa 호출 로직 종료
		
		
	
	
}
