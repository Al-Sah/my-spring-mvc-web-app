package my_app.controllers;



import my_app.services.MathService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/home/math")
public class MathController {

    private final MathService mathService;
    public MathController(MathService mathService) {
        this.mathService = mathService;
    }

    @GetMapping("/calc/calcHistory")
    public String CalculatorHistory(Map<String, Object> model) {
        model.put("messages", mathService.getCalculatorHistoryMessages());
        return "calcHistory";
    }

    @GetMapping("/calc")
    public String Calculate(@RequestParam(value = "first_number", required = false) String string_num1,
                            @RequestParam(value = "second_number", required = false) String string_num2,
                            @RequestParam(value = "operation", required = false) String operation, Model model){

        model.addAttribute("calc_res", mathService.calculate(string_num1, string_num2, operation));
        return "calc";
    }

}

