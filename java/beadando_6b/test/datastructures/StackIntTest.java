package test.datastructures;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;
import org.junit.Test;
import studies.datastructures.StackInt;
import java.util.NoSuchElementException;


public class StackIntTest {
    @Test
    public void givesBackGoodNumber() {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        int read = stack.pop();
        assertEquals(3, read);
    }

    @Test
    public void emptyStackTest() {
        int size = 2;
        StackInt stack = new StackInt(size);
        assertTrue(stack.isEmpty());
    }

    @Test
    public void goodSize() {
        int size = 2;
        StackInt stack = new StackInt(size);
        assertEquals(2, stack.getCapaticy());
    }

    @Test
    public void notEmpty() {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        assertFalse(stack.isEmpty());
    }

    @Test
    public void unchangeableSize() {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        stack.pop();
        assertEquals(size, stack.getCapaticy());
    }

    @Test
    public void tooMuchElement() {
        try {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        stack.push(3);
        stack.push(3);
        } catch(IllegalArgumentException e) {
            System.out.println(e);
        }
    }

    @Test
    public void popEmptyStack() {
        try {
            int size = 2;
            StackInt stack = new StackInt(size);
            stack.pop();
        } catch(NoSuchElementException e) {
            System.out.println(e);
        }
    }

    @Test
    public void zeroCapacity() {
        int size = 0;
        StackInt stack = new StackInt(size);
        assertEquals(stack.getCapaticy(), 0);
    }

    @Test
    public void nowEmpty() {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        stack.push(3);
        stack.pop();
        stack.pop();
        assertEquals(stack.isEmpty(), true);

    }

    @Test
    public void writeOut1() {
        int size = 2;
        StackInt stack = new StackInt(size);
        stack.push(3);
        stack.push(4);
        assertEquals("3, 4 ]", stack.toString());
    }

    @Test
    public void writeOut2() {
        int size = 3;
        StackInt stack = new StackInt(size);
        stack.push(3);
        stack.push(4);
        assertEquals("3, 4, _ ]", stack.toString());
    }

    @Test
    public void writeOut3() {
        int size = 3;
        StackInt stack = new StackInt(size);
        assertEquals("_, _, _ ]", stack.toString());
    }

    @Test
    public void writeOut4() {
        int size = 0;
        StackInt stack = new StackInt(size);
        assertEquals(" ]", stack.toString());
    }
}