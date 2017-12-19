package com.gzyz.test;


import java.util.ArrayList;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.service.introduction.service.IntroductionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class IntroductionTest {

	@Autowired
	private IntroductionService introductionService;
	
	@Test
	public void getSpecInfoId(){
		List<GetSpecInfoId> getSpecInfoIds = introductionService.getSpecInfoId(1);
		List<Integer> getSpecIds = new ArrayList<Integer>();
		List<String> getSpecNames = new ArrayList<String>();
		List<String> getSpceInfoValues = new ArrayList<String>();
		List<String> result = new ArrayList<String>();

		for (int i = 0; i < getSpecInfoIds.size(); i++) {
			int spec_info_id = getSpecInfoIds.get(i).getSpec_info_id();
			
			int spec_id = introductionService.getSpecId(spec_info_id);
			getSpecIds.add(spec_id);
			
			String spec_name = introductionService.getSpecName(spec_id);
			getSpecNames.add(spec_name);
			
			String spec_info_value = introductionService.getSpecInfoValue(spec_info_id);
			getSpceInfoValues.add(spec_info_value);			
		
			String key = spec_name+":"+"&nbsp;"+spec_info_value;
			result.add(key);
		}
		System.out.println(result);
		/*System.out.println(getSpecIds);
		System.out.println(getSpecNames);
		System.out.println(getSpceInfoValues);*/
		/*for (int j = 0; j < getSpecIds.size(); j++) {
			int spec_id = getSpecIds.get(j);
			String spec_name = introductionService.getSpecName(spec_id);
			getSpecNames.add(spec_name);
			System.out.println(getSpecNames);
		}*/
	}
}
