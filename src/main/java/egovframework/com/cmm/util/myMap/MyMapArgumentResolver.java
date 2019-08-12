package egovframework.com.cmm.util.myMap;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class MyMapArgumentResolver implements HandlerMethodArgumentResolver {
	@Override
	public boolean supportsParameter(MethodParameter param) {
		return MyMap.class.isAssignableFrom(param.getParameterType());
	}

	@Override
	public Object resolveArgument(MethodParameter param, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		MyMap paramMap = new MyMap();
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		String key = null;
		String[] values = null;
		while (enumeration.hasMoreElements()) {
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			if (values != null) {
				paramMap.put(key, (values.length > 1) ? values : values[0]);
			}
		}
		return paramMap;
	}
}
