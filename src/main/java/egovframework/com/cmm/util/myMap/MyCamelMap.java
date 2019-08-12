package egovframework.com.cmm.util.myMap;

import java.util.HashMap;

import egovframework.com.cmm.util.CamelUtil;
import egovframework.com.cmm.util.StringUtil;

public class MyCamelMap extends HashMap<Object, Object> {

	private static final long serialVersionUID = 6723434363565852261L;

	/**
	 * key 에 대하여 Camel Case 변환하여 super.put
	 * (ListOrderedMap) 을 호출한다.
	 * @param key
	 *        - '_' 가 포함된 변수명
	 * @param value
	 *        - 명시된 key 에 대한 값 (변경 없음)
	 * @return previous value associated with specified
	 *         key, or null if there was no mapping for
	 *         key
	 */
	@Override
	public Object put(Object key, Object value) {
		return super.put(CamelUtil.convert2CamelCase((String) key), value);
	}

	public String getStr(Object key) {
		return StringUtil.nullConvert(super.get(key));
	}

	public int getInt(Object key) {
		return StringUtil.zeroConvert(super.get(key));
	}
	public int getInt(Object key, int def) {
		return StringUtil.zeroConvert(super.get(key), def);
	}


}
