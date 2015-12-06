package com.keepthinker.meerp.service;

import java.util.List;

public interface Search<T>{
	List<T> search(String property, Object value);
}
