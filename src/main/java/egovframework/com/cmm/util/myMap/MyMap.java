package egovframework.com.cmm.util.myMap;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.com.cmm.util.StringUtil;
import egovframework.com.cmm.util.UserDetailsHelper;

public class MyMap{
	Map<String,Object> map = new HashMap<String,Object>();
	public Object get(String key){
        return map.get(key);
    }

    public void put(String key, Object value){
        map.put(key, value);
    }

    public Object remove(String key){
        return map.remove(key);
    }

    public boolean containsKey(String key){
        return map.containsKey(key);
    }

    public boolean containsValue(Object value){
        return map.containsValue(value);
    }

    public void clear(){
        map.clear();
    }

    public Set<Entry<String, Object>> entrySet(){
        return map.entrySet();
    }

    public Set<String> keySet(){
        return map.keySet();
    }

    public boolean isEmpty(){
        return map.isEmpty();
    }

    public void putAll(Map<? extends String, ?extends Object> m){
        map.putAll(m);
    }

	public Map<String, Object> getMap() {
		ServletRequestAttributes sra = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		map.put("remoteAddr", sra.getRequest().getRemoteAddr());
		map.put("session", UserDetailsHelper.getAuthenticatedUser());
		return map;
	}

	public String getStr(Object key) {
		return StringUtil.nullConvert(map.get(key));
	}

	public int getInt(Object key) {
		return StringUtil.zeroConvert(map.get(key));
	}
	public int getInt(Object key, int def) {
		return StringUtil.zeroConvert(map.get(key), def);
	}

}
