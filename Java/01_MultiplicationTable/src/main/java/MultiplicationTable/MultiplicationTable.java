package school.homeworks.multiplicationtable;

public class MultiplicationTable {

    private static final int MAX_MULTIPLIER = 10;

    private static int getNumberDigitSize(int number) {
        int size = 0;

        while (number > 0) {
            number /= 10;
            size++;
        }

        return size;
    }

    public static void print(int parameter) {
        int maxProductLength = getNumberDigitSize(parameter * MAX_MULTIPLIER);
        int maxFactorLength = getNumberDigitSize(MAX_MULTIPLIER);
        for (int i = 1; i <= MAX_MULTIPLIER; i++) {
            int product = i * parameter;
            String spacesFromStart = " ".repeat(maxFactorLength - getNumberDigitSize(i));
            String spacesBeforeProduct = " ".repeat(maxProductLength - getNumberDigitSize(product));
            System.out.println(spacesFromStart + i + " * " + parameter + " = " + spacesBeforeProduct + product
            );
        }
    }
}
