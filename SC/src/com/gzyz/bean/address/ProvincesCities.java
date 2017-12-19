package com.gzyz.bean.address;

import java.util.List;

public class ProvincesCities extends Provinces {
		private List<CitiesAreas> cities;

		public List<CitiesAreas> getCities() {
			return cities;
		}

		public void setCities(List<CitiesAreas> cities) {
			this.cities = cities;
		}
		
}
