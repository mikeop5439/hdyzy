package com.gzyz.mapper.systemset;

import java.util.List;

import com.gzyz.bean.systemset.Links;

public interface LinksMapper {
	public List<Links> findLinksList(Links link);
	public Links findLinks(Links link);
	public void deleteLinks(Links links);
	public void updataLinks(Links links);
	public void addLinks(Links links);
}
