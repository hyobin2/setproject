package egovframework.kjobs.controller.front.front;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.kjobs.service.board.BoardService;
import egovframework.kjobs.service.popup.PopupService;

@Controller
public class FrontController {

	/** PopupService */
	@Resource(name = "popupService")
	private PopupService popupService;

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping("/front/index.do")
	public String proc(MyMap paramMap, HttpServletRequest request, HttpServletResponse response, Model model, SessionStatus status) throws Exception {
		paramMap.put("firstIndex", 0);
		paramMap.put("recordCountPerPage", 3);
		paramMap.put("pCode", "POP02");
		List<Map<String, Object>> popupList = popupService.list(paramMap.getMap());
		model.addAttribute("popupList", popupList);
		paramMap.put("menuId", "index");
		model.addAttribute("paramMap", paramMap.getMap());

		paramMap.put("firstIndex", 0);
		paramMap.put("lastIndex", 5);
		paramMap.put("recordCountPerPage", 5);
		paramMap.put("bCode", "B03");
		List<Map<String, Object>> list = boardService.list(paramMap.getMap());

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);


		return "/front/index";

	}
}
