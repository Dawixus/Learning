package DynamicArray;

import java.util.Iterator;

public class DynamicArray<T> implements Iterable<T> {
    private T[] array;
    private int length;
    private int maxLength;

    @SuppressWarnings("unchecked")
    public DynamicArray() {
        length = 0;
        maxLength = 1;
        array = (T[]) new Object[maxLength];
    }

    @SuppressWarnings("unchecked")
    private void realocate(){
        maxLength *= 2;
        T[] newArray = (T[]) new Object[maxLength];
        System.arraycopy(array, 0, newArray, 0, length);
        array = newArray;
    }

    public void add(T item)
    {
        if (length >= maxLength)
        {
            realocate();
        }
        array[length] = item;
        length++;
    }

    public T get(int index)
    {
        return array[index];
    }

    public void set(int index, T item)
    {
        array[index] = item;
    }

    public T removeLast() {
        if (length == 0) {
            throw new IllegalStateException("Array is empty");
        }
        T value = array[length - 1];
        array[length - 1] = null;
        length--;
        return value;
    }

    public int getLength() {
        return length;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private int index = 0;

            @Override
            public boolean hasNext() {
                return index < length;
            }

            @Override
            public T next() {
                return array[index++];
            }
        };
    }
}
