public class Calculator {
    public static float calculate(float number1, float number2, char calculate) {
        float err = 0.0f ;
        switch (calculate) {
            case '+':
                return number1 + number2;
            case '-':
                return number1 - number2;
            case '*':
                return number1 * number2;
            case '/':
                if (number2 !=0 ) {
                    return number1 / number2;
                }
            default:
                String errors = "lỗi nhập";
                return err;
        }
    }
}
