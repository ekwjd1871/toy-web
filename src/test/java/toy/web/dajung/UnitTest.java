package toy.web.dajung;

import toy.web.dajung.service.SampleService;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class UnitTest {

    private SampleService sampleService;

    @Before // @Test 실행 되기 전에 실행
    public void setup() {
        this.sampleService = new SampleService();
    }

    @Test  // 하나의 테스트 케이스, 규칙 : public, return형 void, 매개변수 X()
    public void test() {
        assertTrue(this.sampleService.returnFalse());
    }

    @Test
    public void assertTest() {
        int a = 0;

        assertEquals(a, 0);

        ++a;
        assertEquals(a, 1);

        assertTrue(a == 1);

        assertNotNull(a);

        Object obj = null;
        assertNull(obj);
    }
}
