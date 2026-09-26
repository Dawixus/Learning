package DynamicArray;
public class Main {
    static void main(String[] args) {
        var dynArr = new DynamicArray<String>();
        for (var arg : args)
        {
            dynArr.add(arg);
        }

        for (var element : dynArr) {
            System.out.println(element);
        }
    }
}
