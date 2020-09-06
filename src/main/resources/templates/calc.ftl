<#import "parts/common.ftl" as common>
<@common.page "Calculator">

    <div class="calculator">


    <h2> Mega Calculator</h2>

    <form action= "#" method="get">

        <div class="form-group">
            <input type="text" name = "first_number"  placeholder=" Enter 1st number " >
            <input type="text" name = "second_number" placeholder=" Enter 2nd number " >
        </div>

        <div class="form-group">
            <p> Choose operation</p>

            <input type="radio" id="operation1" name="operation" value = "multiplication" >
            <label for = "operation1"> multiplication</label>

            <input type="radio" id="operation2" name="operation" value = "division" >
            <label for = "operation2"> division</label>

            <input type="radio" id="operation3" name="operation" value = "addition" >
            <label for = "operation3"> addition</label>

            <input type="radio" id="operation4" name="operation" value = "subtraction" >
            <label for = "operation4"> subtraction</label>
        </div>

        <@common.form_btn></@common.form_btn>

    </form>
        <div class="calculator_result">
            <p> Your result: ${calc_res}</p>
        </div>

    </div>

    <form action="/hi/calc/history" method="get">
        <div class=" calc_history mt-3">
            <button type="submit" class="btn btn-primary" > Show History </button>
        </div>
    </form>





</@common.page>


