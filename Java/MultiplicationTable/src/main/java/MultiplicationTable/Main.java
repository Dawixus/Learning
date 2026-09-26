package MultiplicationTable;

public class Main {
    private static final int MAX_MULTIPLIER = 10;
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

    static void main(String[] args) {
        int parameter = Integer.parseInt(args[0]);
        int maxProductLength = getNumberDigitSize(parameter * MAX_MULTIPLIER);
        int maxFactorLength = getNumberDigitSize(MAX_MULTIPLIER);

        for (int i = 1; i <= MAX_MULTIPLIER; i++){
            int product = i * parameter;
            String spacesFromStart = " ".repeat(maxFactorLength - getNumberDigitSize(i));
            String spacesBeforeProduct = " ".repeat(maxProductLength - getNumberDigitSize(product));
            System.out.println(spacesFromStart + i + " * " + parameter + " = " + spacesBeforeProduct + product);
        }
    }
}
