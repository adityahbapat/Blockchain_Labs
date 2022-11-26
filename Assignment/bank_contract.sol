// SPDX-License-Identifier: MIT
// Aditya Bapat: 2019140007

pragma solidity ^0.8.7;

contract BankAccount {
    mapping (address=>uint) private customer;
    address public manager;
    uint private noOfCustomers;
    uint private minimumAccountBalance;

    constructor() {
        minimumAccountBalance = 10 wei;
        manager = msg.sender;
    }

    modifier onlyManager(){
        require (msg.sender == manager, "Only manager can access this function !");
        _;
    }

    // deposit money in account
    // create account if it does not exist
    function depositMoney() public payable {
        require(msg.value >= minimumAccountBalance, "Minimum Balance condition is not met!");
        if (customer[msg.sender] == 0){
        noOfCustomers++;
        }
        customer[msg.sender] += msg.value;
    }


    // get bank contract account balance
    function getBankContractBalance() public view onlyManager
        returns(uint){
        return address(this).balance;
    }

    // check bank customers
    function getTotalCustomers() public view onlyManager returns(uint){
        return noOfCustomers;
    }

    // customer account balance
    function checkCustomerAccountBalance() public view returns(uint){
        return customer[msg.sender];
    }

    // transfer money
    function transfer(address _recipient, uint money) public{
        require(customer[msg.sender] - money >= minimumAccountBalance,
        "Sorry, please maintain the minimum balance in your account!");
        address payable recipient = payable(_recipient);
        recipient.transfer(money);
        customer[msg.sender] -= money;
    }

    // delete bank account
    function deleteBankAccount() public {
        require(customer[msg.sender] > 0, "Account does not exist!");
        address payable recipient = payable(msg.sender);
        uint money = customer[msg.sender];
        recipient.transfer(money);
        customer[msg.sender] -= money;
        noOfCustomers--;
    }
}
