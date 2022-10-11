// SPDX-License-Identifier: MIT
// Aditya Bapat BE IT 2019140007
// Using Open Zeppelin

pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";

contract Thunderwhite is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("Thunderwhite", "TW") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

// Deployed on Mumbai Test Network
// Contract Address - 0xd54995E4aC07bbf8276f02c1536bF0578215A77e
// Thunderwhite Token Symbol - TW