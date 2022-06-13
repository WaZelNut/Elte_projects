public class StackMain {
    
    public static void main(String[] args) {
        final Hallgato alice = new Hallgato("Alice", 2000);
        final Hallgato bob = new Hallgato("Bob", 2001);
        
        final Stack<Hallgato> stack = new Stack<>();
        if(stack.size()!=0) {
            throw new RuntimeException("size != 0");
        }
        System.out.println("Test #1 OK");
        
        stack.push(alice);
        if(stack.size()!=1) {
            throw new RuntimeException("size != 1");
        }
        System.out.println("Test #2 OK");
        
        final Hallgato hTop = stack.top();
        if(!hTop.equals(alice)) {
            throw new RuntimeException("top != last");
        }
        System.out.println("Test #3 OK");
        
        stack.push(bob);
        if(stack.size()!=2) {
            throw new RuntimeException("size != 2");
        }
        System.out.println("Test #4 OK");
        
        final Hallgato hPop = stack.pop();
        if(!hPop.equals(bob)) {
            throw new RuntimeException("pop != last");
        }
        System.out.println("Test #5 OK");
        
        stack.pop(); // Now empty.
        
        try {
            stack.top();
            throw new RuntimeException("Should not see this, expected an exception in previous statement");
        } catch (StackException e) {
            if(!e.getMessage().equals("empty stack")) {
                throw new RuntimeException("expected \"empty stack\"");
            }
            System.out.println("Test #6 OK");
        }
        
        try {
            stack.pop();
            throw new RuntimeException("Should not see this, expected an exception in previous statement");
        } catch (StackException e) {
            if(!e.getMessage().equals("empty stack")) {
                throw new RuntimeException("expected \"empty stack\"");
            }
            System.out.println("Test #7 OK");
        }
    }
}