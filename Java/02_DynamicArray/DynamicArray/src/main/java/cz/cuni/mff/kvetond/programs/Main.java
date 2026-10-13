package cz.cuni.mff.kvetond.programs;

import cz.cuni.mff.kvetond.toolkit.DynamicArray;

public class Main {
    static void main(String[] args) {
        var dynArr = new DynamicArray<String>();
        for (var arg : args)
        {
            dynArr.add(arg);
        }

        for (int i = 0; i < dynArr.getLength(); i++){
            IO.println(dynArr.get(i));
        }
    }
}
