//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;
contract calculator{

    uint result;

    function add(uint _a, uint _b) public {
        result = _a + _b;
    }

    function sub(uint _a, uint _b) public {
        result = _a - _b;
    }

    function mul(uint _a, uint _b) public {
        result = _a * _b;
    }

    function div(uint _a, uint _b) public {
        result = _a / _b;
    }

    function finalresult() view public returns(uint){
        return(result);
    }
}