package my_app.controllers;



import my_app.entities.CalcHistoryMessage;
import my_app.repositories.CalcHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/home")
public class CalculatorController {

    @Autowired
    private CalcHistoryRepository calcHistoryRepository;

    @GetMapping("/calc/history")
    public String Calculator(Map<String, Object> model) {

        Iterable<CalcHistoryMessage> historyMessages = calcHistoryRepository.findAll();
        model.put("messages", historyMessages);

        return "calcHistory";
    }

    @GetMapping("/calc")
    public String DoCalc(@RequestParam(value = "first_number", required = false) String string_num1,
                             @RequestParam(value = "second_number", required = false) String string_num2,
                             @RequestParam(value = "operation", required = false) String operation, Model model){


        double res = 0.0, num1, num2;

        String calculation_result;

        if(operation == null){
            calculation_result = "choose operation!";
            model.addAttribute("calc_res", calculation_result);
            System.out.println("[CALCULATOR] null operation request");
            return "calc";
        }
        try {
            num1 = Double.parseDouble(string_num1);
            num2 = Double.parseDouble(string_num2);
        } catch (Exception e){
            System.out.println("[CALCULATOR] " + e.getMessage());
            calculation_result = "Input Error !!! ";
            model.addAttribute("calc_res", calculation_result);
            return "calc";
        }

        CalcHistoryMessage calcHistoryMessage = new CalcHistoryMessage();
        String historyMessage;


        switch (operation){
            case "multiplication":
                res = num1 * num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + Double.toString(res);
                break;
            case "division":
                res = num1 / num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + Double.toString(res);
                break;
            case "addition":
                res = num1 + num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + Double.toString(res);
                break;
            case "subtraction":
                res = num1 - num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + Double.toString(res);
                break;
            default:
                historyMessage = "Unknown error calculation";
                break;
        }

        calculation_result = Double.toString(res);

        calcHistoryMessage.setText(historyMessage);
        calcHistoryRepository.save(calcHistoryMessage);

        model.addAttribute("calc_res", calculation_result);
        return "calc";
    }

}

