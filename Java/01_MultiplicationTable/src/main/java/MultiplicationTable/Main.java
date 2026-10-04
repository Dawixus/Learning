package MultiplicationTable;

public class Main {

    static int getNumberDigitSize(int number)
    {
        final int BASE = 10;
        int size = 0;
        while (number > 0)
        {
            number /= BASE;
            size++;
        }
        return size;
    }

    static void print_multiplication_table(int parameter)
    {
        final int MAX_MULTIPLIER = 10;

        int maxProductLength = getNumberDigitSize(parameter * MAX_MULTIPLIER);
        int maxFactorLength = getNumberDigitSize(MAX_MULTIPLIER);

        for (int i = 1; i <= MAX_MULTIPLIER; i++){
            int product = i * parameter;
            String spacesFromStart = " ".repeat(maxFactorLength - getNumberDigitSize(i));
            String spacesBeforeProduct = " ".repeat(maxProductLength - getNumberDigitSize(product));
            System.out.println(spacesFromStart + i + " * " + parameter + " = " + spacesBeforeProduct + product);
        }
    }

    static void main(String[] args) {
        print_multiplication_table(Integer.parseInt(args[0]));
    }
}
