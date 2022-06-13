package studies.datastructures;

import java.util.NoSuchElementException;

public class StackInt {
    private int size;
    private int topIndex;
    private int[] stack;
    public StackInt(int size) {
        this.size = size;
        topIndex = -1;
        stack = new int[size];
        for (int i = 0; i < size; i++) {
            stack[i] = -1; //-1 means empty space in the beggining
        }
    }

    public void push(int element) {
        if (topIndex + 1 >= size) {
            throw new IllegalArgumentException("stack full, capaticy is " + size);
        }
        topIndex++;
        stack[topIndex] = element;
    }

    public int pop() throws NoSuchElementException {
        if (topIndex <= -1) {
            throw new NoSuchElementException();
        }
        int returnElement = stack[topIndex];
        topIndex--;
        return returnElement;

    }

    public boolean isEmpty() {
        return topIndex == -1;
    }

    public int getCapaticy() {
        return size;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            if (i <= topIndex) {
                sb.append(stack[i]);
                sb.append(", ");
            }
            else {
                sb.append("_");
                sb.append(", ");
            }
        }
        if (size > 0) {
        sb.delete(sb.length()-2,sb.length());
        }
        sb.append(" ]");
        return sb.toString();
    }
}