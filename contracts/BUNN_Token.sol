// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ERC20 {
    uint256 public totalSupply;
    string public name = "Onwuajuese";
    string public symbol = "BUNN";

    mapping (address => uint256) users;

    function balanceOf( address _user) external view returns (uint256) {
        return users[_user];
    }
}