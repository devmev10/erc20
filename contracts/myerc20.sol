// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract myerc20 {
    string name public;
    string symbol public;
    uint256 decimals public = 18;
    uint256 totalSupply public;

    mapping (address => uint) balanceOf;
    mapping (address => mapping(address=>uint256)) public allowance;

    constructor(){
        name = "poorcoin";
        symbol= "poor";
        totalSupply = 1000000;
        balanceOf[msg.sender] = totalSupply;
    }

    // events
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function approve(address _spender, uint256 _value) public returns(bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
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
        allowance[_from][msg.sender] -= _value; // adjust allowance after transfer

        emit Transfer(_from, _to, _value);
        return true;
        
    }
}
