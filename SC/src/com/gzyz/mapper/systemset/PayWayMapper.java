package com.gzyz.mapper.systemset;

import java.util.List;

import com.gzyz.bean.systemset.PayWay;

public interface PayWayMapper {
	public List<PayWay> findPayWayList(PayWay payWay);
	public PayWay findPayWay(PayWay payWay);
	public void deletePayWay(PayWay payWay);
	public void updataPayWay(PayWay payWay);
	public void addPayWay(PayWay payWay);
}
