import java.util.LinkedList;

public class Stack<T> {
    private final LinkedList<T> list = new LinkedList<>();

    public void push(T element) {
        list.add(element);
    }

    public T pop() throws StackException {
        if(list.size() == 0) {
            throw new StackException("empty stack");
        }
        return list.removeLast();
    }

    public T top() throws StackException {
        if(list.size() == 0) {
            throw new StackException("empty stack");
        }
        return list.getLast();
    }

    public int size() {
        return list.size();
    }
}