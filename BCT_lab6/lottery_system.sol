// SPDX-License-Identifier: MIT
// Aditya Bapat BE IT 2019140007

pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public participants;
    constructor(){
        manager = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == manager, "Only Manager can access this function !");
        _;
    }

    receive() external payable{
        require(msg.value == 2 ether);
        participants.push(payable(msg.sender));
    }

    function getBalance() public view onlyOwner returns (uint){
        return address (this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    function selectWinner() public onlyOwner returns (address){
        require(participants.length >= 3);
        address payable winner;
        uint r = random();
        uint index = r % participants.length;
        winner = participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0);
        return winner;
    }



}