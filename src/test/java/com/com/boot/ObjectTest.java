package com.com.boot;

import java.text.DecimalFormat;

import org.hyperic.sigar.Mem;
import org.hyperic.sigar.Sigar;
import org.json.JSONObject;

public class ObjectTest {
	
	public void memData() {
		JSONObject memObj = new JSONObject();
		Sigar sigar1 = new Sigar();//메모리
		Mem mem = null;//memory
		String pattern = "####.##";//memory
					//메모리측정 영역
		try {
			//메모리측정 영역
			mem = sigar1.getMem();
			Double totalCPU = (double) mem.getTotal() / 1000000000;
			Double usedCPU = (double) mem.getUsed() / 1000000000;
			Double freeCPU = (double) mem.getFree() / 1000000000;
			DecimalFormat df = new DecimalFormat(pattern);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
