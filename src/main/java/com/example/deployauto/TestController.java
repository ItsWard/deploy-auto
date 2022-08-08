package com.example.deployauto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public String index() {

        return "원용";
    }

    @GetMapping("/ward")
    public String index2() {

        return "주현";
    }


}
