package test.safemath;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import tools.safemath.Incrementer;
public class IncrementerTest {
    @Test
    public void mukodoIncrementer() {
        assertEquals(3 , Incrementer.incremente(2));
    }

    @Test
    public void defaultSzam() {
        assertEquals(Integer.MAX_VALUE, Incrementer.incremente(Integer.MAX_VALUE));
    }
}