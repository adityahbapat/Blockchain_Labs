// SPDX-License-Identifier:MIT
// Aditya Bapat
// BE IT 2019140007

pragma solidity ^0.8.0;

contract gradingSystem {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function gradeCalculator(int sub1,int sub2,int sub3,int sub4,int sub5) public view returns(string memory) {
        require(owner == msg.sender, "Sorry, the function can be only accessed by the owner!");
        int total = (sub1 + sub2 + sub3 + sub4 + sub5)/5;
        if(total >= 90) {
            return "Grade A";
        }
        else if(total >= 70 && total < 90) {
            return "Grade B";
        }
        else if(total >= 40 && total <70) {
            return "Grade C";
        }
        else {
            return "Fail";
        }
    }
}