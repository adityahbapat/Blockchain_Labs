// SPDX-License-Identifier:MIT
//Aditya Bapat BE IT
//2019140007

pragma solidity ^0.8.0;

contract PLChecker {
    address owner;
    constructor(){
        owner = msg.sender;
    }

    function ProfitLossChecker(int sellingPrice,int costPrice) public view returns (string memory, int) {
        require(owner == msg.sender,"Sorry, only owner can access the function");

        if(sellingPrice - costPrice > 0){
            
            return("Profit ",sellingPrice - costPrice);
            
        }
        else if(sellingPrice - costPrice < 0){
           return("Loss ",costPrice - sellingPrice);
        }
        else{
            return ("No Profit No Loss",0);
        }
    }

}