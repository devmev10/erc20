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
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public  returns (bool success) {
        require(_to != address(0), "Invalid recipient address");
        require(balanceOf[msg.sender] >= _value, "Not enough balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        
    }
}
