pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract Amos { // 
    address public owner;
    uint256 public balance;
    
    constructor() {
        owner = msg.sender; // store information of who deployed contract
    }
    
    receive() payable external {
        balance += msg.value; // keeps track of balance (in WEI)
    }
    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount); // send funds to given the address
        balance -= amount;
    }
}