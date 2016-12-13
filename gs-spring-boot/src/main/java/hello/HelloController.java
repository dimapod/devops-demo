package hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HelloController {
    
    @RequestMapping("/")
    public String index() throws UnknownHostException {
        return "<h1>Greetings from Spring Boot!</h1>"
                + "<ul>"
                + " <li>" + InetAddress.getLocalHost().getHostName() + "</li>"
                + " <li>" + InetAddress.getLocalHost().getHostAddress() + "</li>"
                + "</ul>";
    }
    
}
