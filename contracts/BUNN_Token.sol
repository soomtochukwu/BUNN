// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Onwuajuese {
    // state variables

    string public name = "Onwuajuese";
    string public symbol = "BUNN";
    uint8 public  decimal = 18;
    uint256 public  totalSupply;

    mapping (address => uint256) private users; // alias: "BalanceOf" ... 
    mapping (address => mapping (address => uint256)) public allowance;

    constructor() {
        _mint(msg.sender, 1234e18);
    }
    /*
    function allow()...
    this function allows me to determine the amount of funds a
    particula addres can transfer unbehalf of another.
    In other words, it assigns value to the ALLOWANCE MAP at line 13
    */ 
    function allow(address addressFrom, address addressTO, uint256 allowed ) public  {
        allowance[addressFrom][addressTO] = allowed;
    }
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
    function _transfer()...
    this is a boiler plate to reduce CODE DUPLICATION
    */
    function _transfer(address addressFrom, address addressTo, uint256 amount) private returns (bool) {
        // local variables 
        uint256 currentBalance = users[addressFrom];
        // Snaity check
        require(addressTo != address(0), "ERC20 transfer to addres 0.");
        require(amount <= currentBalance, "Insufficient balance.");
        // code(s)
        users[addressFrom] -= amount; // currentAllowance -= amount; ... doeas not work
        users[addressTo] += amount;
        return true;
    }
    /*
    function transfer()...
    this function allows a certian amount of token
    to be transferred from the total supply to an addres
    */
    function transfer(address recipient, uint256  amount) external returns (bool){
        return _transfer(msg.sender, recipient, amount);
    }
    /*
    function transferFrom()...
    this function allows a certian amount of token 
    to be transferred from one address to another
    */
    function transferFrom(address addressFrom, address addressTo, uint256 amount) external returns (bool){
        // local variables 
        uint256 currentAllowance = allowance[addressFrom][msg.sender];
        // Snaity check
        require(currentAllowance >= amount, "ERC20 transfer amount not exceed allowance."); 
        require(addressTo != address(0), "ERC20 transfer to addres 0.");
        // code(s)
        currentAllowance = currentAllowance - amount;
        return _transfer(addressFrom, addressTo, amount);
    }

    function approve(address addressSpender, uint256 value) external returns (bool) {
        require(addressSpender == msg.sender, "not approved.");
        return true;
    }

    event Transfer(address indexedFrom, address indexedTo, uint256 value);

    event Approval(address indexedOwner, address indexedSpender, uint256 value);
}