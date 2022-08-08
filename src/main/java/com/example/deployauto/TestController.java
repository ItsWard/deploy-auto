package com.example.deployauto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @GetMapping("/")
    public String index() {

        return "첫번째 빌드 입니다";
    }


}
