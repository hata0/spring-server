package com.hata0.springserver.controller;

import com.hata0.springserver.dao.HealthDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    private final HealthDao dao;

    public HealthController(HealthDao dao) {
        this.dao = dao;
    }

    @GetMapping("/health")
    public String health() {
        return dao.check();
    }
}
