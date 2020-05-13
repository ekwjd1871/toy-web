package toy.web.dajung;

import toy.web.dajung.model.User;
import org.junit.Test;

public class UserTest {

    public static User b = new User("apple", "foods", "10000", "9000");
          //static - 다른 클래스와 함께 쓰기 위해서

    @Test
    public void f(){
        System.out.println(b);
    }

}
