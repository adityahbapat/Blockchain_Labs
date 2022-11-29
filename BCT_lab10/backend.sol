// SPDX-License-Identifier:MIT
// Aditya Bapat
// Uid: 2019140007

// Contract Address - 0x507Eed16cC5560a977Bb78854e12C72baCE458A1
// On EtherScan - https://mumbai.polygonscan.com/tx/0x43c41b4c2e88f9ab6c498da178f26a9d47b65e6073a7696fb57d1af91f30a21e

pragma solidity ^ 0.8.0;

contract backend{

    string name;
    string email;
    uint256 contact;
    string college;
    address owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require (msg.sender == owner, "Only owner can retrieve data");
         _;

    }

    function set (string memory _name, string memory _email, uint256 _contact, string memory _college) public {
        name = _name;
        email = _email;
        contact = _contact;
        college = _college;

    }

    function retrieve () public view onlyOwner returns(string memory, string memory, uint256, string memory) {

        return (name, email, contact, college);

    }



}