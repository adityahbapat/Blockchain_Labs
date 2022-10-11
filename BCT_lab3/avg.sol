// Aditya Bapat
// BE IT 2019140007

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract avg {
    uint[] numbers = [565,19,27,28,400,5700,3900,854,4789,2,5,78,18,142];

    function getAverage() public view returns(uint){
        uint avrg = 0;
        uint len = numbers.length;
        for(uint i = 0; i < len; i++){
            avrg += numbers[i];
        }
        avrg = avrg/len;
        return avrg;
    }
}