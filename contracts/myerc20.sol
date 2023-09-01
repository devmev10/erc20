// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract myerc20 {
    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;

    // mappings
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // constructor
    constructor() {
        name = "Poor Coin";
        symbol = "POOR";
        totalSupply = 1000000 * (10 ** decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    // events
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Function to approve the spender and spend limit
    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Function to transfer tokens to another address
    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0), "Invalid recipient address");
        require(balanceOf[msg.sender] >= _value, "Not enough balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Function to transfer tokens on behalf of owner by third party like DEX
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(balanceOf[_from] >= _value, "Not enough balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value; // reduce allowance after transfer

        emit Transfer(_from, _to, _value);
        return true;
    }
}
