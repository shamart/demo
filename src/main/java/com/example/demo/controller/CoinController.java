package com.example.demo.controller;

import com.example.demo.domain.Coin;
import com.example.demo.dto.CoinCreateDTO;
import com.example.demo.dto.CoinFindDTO;
import com.example.demo.dto.CoinUpdateDTO;
import com.example.demo.service.CoinService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("coins")
public class CoinController {
    @Resource
    private CoinService coinService;

    @GetMapping
    public Page<Coin> findAll(CoinFindDTO coinFindDTO,
                              @RequestParam(required = false) int page,
                              @RequestParam(required = false) int size,
                              @RequestParam(required = false) Sort.Direction direction,
                              @RequestParam(required = false) String[] sortProperties) {
        return coinService.findAll(coinFindDTO, page, size, direction, sortProperties);
    }

    @GetMapping("{id}")
    @ResponseStatus(HttpStatus.OK)
    public Coin findById(@PathVariable Long id) {
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
