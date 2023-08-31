// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract myerc20 {
    string name public;
    string symbol public;
    uint256 decimals public = 18;
    uint256 totalSupply public;

    mapping (address => uint) balanceOf;

    constructor(){
        name = "poorcoin";
        symbol= "poor";
        totalSupply = 1000000;
    }

    
}
