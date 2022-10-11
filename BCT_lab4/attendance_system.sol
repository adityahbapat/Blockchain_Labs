// SPDX-License-Identifier:MIT
//Aditya Bapat BE IT
//2019140007

pragma solidity ^0.8.0;

contract attendanceProcess {
    address owner;
    constructor(){
        owner = msg.sender;
    }

    function collegeAttendance(uint noOfLectures) public view returns (string memory) {

        require(owner == msg.sender,"Sorry, only owner can access the function");

        if(noOfLectures >= 8){
            return("Present");

        }
        else if ((noOfLectures >=4) && (noOfLectures < 8)){
            return ("Half Day");
        }
        else {
            return ("Absent");
        }
    }
}