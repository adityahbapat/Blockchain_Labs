// SPDX-License-Identifier: MIT
// Aditya Bapat BE IT 2019140007

pragma solidity >=0.5.0 <0.9.0;

contract CreditLimit{
    uint limit;


function set(uint _limit) public {
        limit = _limit;
    }

function travelling(uint travellExpense) public{
    require(limit >= travellExpense,"You have exhausted your balance");
    limit -= travellExpense;
}

function food(uint foodExpense) public{
    require(limit >= foodExpense,"You have exhausted your balance");
    limit -= foodExpense;
}
    
function retrieveCredLimit () public view returns(uint){
        return (limit);
    }

}