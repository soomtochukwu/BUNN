// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Onwuajuese {
    // state variables

    string public name = "Onwuajuese";
    string public symbol = "BUNN";
    uint8 public  decimal = 18;
    uint256 public  totalSupply;

    constructor() {
        _mint(msg.sender, 1234e18);
    }

    mapping (address => uint256) private users; // alias: "BalanceOf" ... 
    mapping (address => mapping (address => uint256)) public allowance;

    /*
    function balanceOf()
    it allows an instance of the contract to store and return
    the balance of the provided address(user)
    */
    function balanceOf( address _user) public view returns (uint256) {
        // code(s)
        return users[_user];
    }

    function _mint(address address_to, uint256 amount ) internal  {
        // Snaity check
        require(address_to != address(0), "Must not be a zero address.");
        // code(s)
        totalSupply += amount;
        users[address_to] += amount;
    }
    /*
    function transfer()...
    this function allows a certian amount of token
    to be transferred from the total supply to an addres
    */
    function _transfer(address addressTo, uint256 amount) external returns (bool) {
        // Snaity check
        require(addressTo != address(0), "ERC20 transfer to addres 0.");
        require(amount <= totalSupply, "Insufficient balance.");
        // local variables 
        totalSupply -= amount;
        users[addressTo] += amount;
        // code(s)
        return true;
    }
    /*
    function transferFrom()...
    this function allows a certian amount of token 
    to be transferred from one address to another
    */
    function transferFrom(address addressFrom, address addressTo, uint256 amount) external  payable  {
        // local variables 
        uint256 currentBalance = users[addressFrom];
        uint256 receiver = users[addressTo];

        uint256 currentAllowance = allowance[addressFrom][msg.sender];
        // Snaity check
        require(currentAllowance >= amount, "ERC20 transfer amount excedd allowance."); 

        require(amount <= currentBalance, "Insufficient balance.");
        require(addressTo != address(0), "ERC20 transfer to addres 0.");
        // code(s)
        currentAllowance -= amount;

        receiver += amount;
        currentBalance -= amount;
    }

    function approve(address addressSpender, uint256 value) external returns (bool) {
        require(addressSpender == msg.sender, "not approved.");
        return true;
    }

    event Transfer(address indexedFrom, address indexedTo, uint256 value);

    event Approval(address indexedOwner, address indexedSpender, uint256 value);
}