package com.example.demo.service;

import com.example.demo.domain.Coin;
import com.example.demo.dto.CoinCreateDTO;
import com.example.demo.dto.CoinUpdateDTO;
import com.example.demo.handler.BusinessException;
import com.example.demo.handler.ErrorEnum;
import com.example.demo.repository.CoinRepository;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;

@Service
public class CoinService {

    @Resource
    private CoinRepository coinRepository;

    @Resource
    private ModelMapper modelMapper;

    public List<Coin> findAll(Coin coin, int page, int size,
                              Sort.Direction direction, String[] sortProperties) {
        PageRequest request = PageRequest.of(page, size, direction, sortProperties);
        return coinRepository.findAll((Specification<Coin>) (root, criteriaQuery, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            //todo
            if (coin.getId() != null) {
                predicates.add(criteriaBuilder.equal(root.get("id"), coin.getId()));
            }
            return criteriaQuery.where(predicates.toArray(new Predicate[0])).getRestriction();
        });
    }

    public Coin findById(Long id) {
        return coinRepository
                .findById(id)
                .orElseThrow(() -> new BusinessException(ErrorEnum.COIN_NOT_EXIST));
    }

    public Coin create(CoinCreateDTO coinCreateDTO) {
        Coin coin = modelMapper.map(coinCreateDTO, Coin.class);
        return coinRepository.save(coin);
    }

    public Coin updateAll(CoinUpdateDTO coinUpdateDTO) {
        return coinRepository
                .findById(coinUpdateDTO.getId())
                .map(x -> {
                    Coin newCoin = modelMapper.map(coinUpdateDTO, Coin.class);
                    coinRepository.save(newCoin);
                    return newCoin;
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.COIN_NOT_EXIST));
    }

    public Coin updatePartial(CoinUpdateDTO coinUpdateDTO) {
        return coinRepository
                .findById(coinUpdateDTO.getId())
                .map(x -> {
                    coinRepository.save(x);
                    return x;
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.COIN_NOT_EXIST));
    }

    public void delete(Long id) {
        coinRepository.deleteById(id);
    }

}
