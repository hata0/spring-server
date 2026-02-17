package com.hata0.springserver.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HealthDao {

    private final JdbcTemplate jdbcTemplate;

    public HealthDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public String check() {
        return jdbcTemplate.queryForObject("SELECT 'OK'", String.class);
    }
}