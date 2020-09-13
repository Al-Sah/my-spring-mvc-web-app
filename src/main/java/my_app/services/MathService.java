package my_app.services;

import my_app.entities.CalcHistoryMessage;
import my_app.repositories.CalcHistoryRepository;
import org.springframework.stereotype.Service;

@Service
public class MathService {

    private final CalcHistoryRepository calcHistoryRepository;
    public MathService(CalcHistoryRepository calcHistoryRepository) {
        this.calcHistoryRepository = calcHistoryRepository;
    }

    public Iterable<CalcHistoryMessage> getCalculatorHistoryMessages(){
        return calcHistoryRepository.findAll();
    }

    public String calculate(String string_num1, String string_num2, String operation){

        double res = 0.0, num1, num2;
        String calculation_result;

        if(operation == null){
            calculation_result = "choose operation!";
            System.out.println("[CALCULATOR] null operation request");
            return calculation_result;
        }
        try {
            num1 = Double.parseDouble(string_num1);
            num2 = Double.parseDouble(string_num2);
        } catch (Exception e){
            System.out.println("[CALCULATOR] " + e.getMessage());
            calculation_result = "Input Error !!! ";
            return calculation_result;
        }

        CalcHistoryMessage calcHistoryMessage = new CalcHistoryMessage();
        String historyMessage;


        switch (operation){
            case "multiplication":
                res = num1 * num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + res;
                break;
            case "division":
                res = num1 / num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + res;
                break;
            case "addition":
                res = num1 + num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + res;
                break;
            case "subtraction":
                res = num1 - num2;
                historyMessage = string_num1 + " * " + string_num2 + " = " + res;
                break;
            default:
                historyMessage = "Unknown error calculation";
                break;
        }

        calculation_result = Double.toString(res);

        calcHistoryMessage.setText(historyMessage);
        calcHistoryRepository.save(calcHistoryMessage);

        return calculation_result;
    }


}
