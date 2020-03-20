package com.example.demo.controller;

import com.example.demo.domain.Coin;
import com.example.demo.dto.CoinCreateDTO;
import com.example.demo.dto.CoinUpdateDTO;
import com.example.demo.service.CoinService;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("coins")
public class CoinController {
    @Resource
    private CoinService coinService;

    @GetMapping
    public List<Coin> findAll(@RequestParam(required = false) Coin coin,
                              @RequestParam(required = false) int page,
                              @RequestParam(required = false) int size,
                              @RequestParam(required = false) Sort.Direction direction,
                              @RequestParam(required = false) String[] sortProperties) {
        return coinService.findAll(coin, page, size, direction, sortProperties);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public Coin findById(Long id) {
        return coinService.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Coin create(CoinCreateDTO coinCreateDTO) {
        return coinService.create(coinCreateDTO);
    }

    @PutMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Coin updateAll(CoinUpdateDTO coinCreateDTO) {
        return coinService.updateAll(coinCreateDTO);
    }

    @PatchMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Coin updatePartial(CoinUpdateDTO coinCreateDTO) {
        return coinService.updatePartial(coinCreateDTO);
    }

    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(Long id) {
        coinService.delete(id);
    }

}
