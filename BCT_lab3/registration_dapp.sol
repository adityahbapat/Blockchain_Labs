// Aditya Bapat
// BE IT 2019140007

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract dapp {
    string name;
    string email;
    uint contact;
    string college;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner can retrieve data");
        _;
    }

    function set(string memory _name, string memory _email, uint256 _contact, string memory _college) public {
        name = _name;
        email = _email;
        contact = _contact;
        college = _college;
    }

    function retrieve () public view onlyOwner returns(string memory, string memory, uint256, string memory){
        return (name, email, contact, college);
    }
}