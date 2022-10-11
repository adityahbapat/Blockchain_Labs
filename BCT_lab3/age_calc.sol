// Aditya Bapat
// BE IT 2019140007

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FindAge {
    uint age;
    
    function find_age (uint birth_year) public {
        age = 2022 - birth_year;
    }

    function get_age () view public returns (uint) {
        return age;
    }
}