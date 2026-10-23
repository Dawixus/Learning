package cz.cuni.mff.kvetond.toolkit;

import java.util.Objects;

public class DynamicArray<T> implements SimpleCollection<T> {
    private Object[] array;
    private int length;
    private int maxLength;

    public DynamicArray() {
        length = 0;
        maxLength = 1;
        array = new Object[maxLength];
    }

    private void realocate(int size){
        maxLength = size;
        Object[] newArray = new Object[maxLength];
        System.arraycopy(array, 0, newArray, 0, length);
        array = newArray;
    }

    private void shiftElementsInArray(int index)
    {
        for (int j = index; j < length -1; j++) {
            array[j] = array[j + 1];
        }
        array[length - 1] = null;
    }

    private int indexOf(T o){
        for (int i = 0; i < length; i++) {
            if (Objects.equals(array[i], o)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public void add(T item)
    {
        if (length >= maxLength)
        {
            realocate(2 * maxLength);
        }
        array[length] = item;
        length++;
    }

    @Override
    @SuppressWarnings("unchecked")
    public T get(int index)
    {
        if (index < 0 || index >= length) {
            throw new IndexOutOfBoundsException("Index: " + index);
        }

        return (T) array[index];
    }

    @Override
    public void remove(T o) {
        int i = indexOf(o);
        if (i != -1) {
            remove(i);
        }
    }

    @Override
    public void remove(int i) {
        if (i < 0 || i >= length) {
            throw new IndexOutOfBoundsException("Index: " + i);
        }

        shiftElementsInArray(i);
        length--;
        if (length * 2 < maxLength && 1 < maxLength)
            realocate(maxLength / 2);
    }

    @Override
    public int getLength() {
        return length;
    }
}
