package com.example.demo.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Data
@Accessors(chain = true)
@Entity
public class Coin {
    @Id
    @GeneratedValue
    private Long id;
}
