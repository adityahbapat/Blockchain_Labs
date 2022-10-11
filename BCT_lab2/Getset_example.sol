//SPDX-License Identifier:MIT

pragma solidity ^0.8.13;

// A simple samrt contract
contract MessageContract{
    string message = "Hello World";
    
    function getMessage() public view returns (string){
        return message;
    }
    function setMessage(string newMessage) public
{
    message = newMessage;
}   
 }