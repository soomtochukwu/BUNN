Hello and GM everyone

My name is Somtohukwu Kelechi Onwuajuese

This is in fulfillment of the first Web3 Bootcamp Assignment.

Overall, this contract implements basic functionalities of an ERC-20 token,
including transferring tokens, approving allowances, and maintaining balances.
It demonstrates concepts like mappings, state variables, modifiers, and event
emission commonly used in Ethereum smart contract development.


Here's a brief description of its main components and functionalities:

The contract has several state variables such as:

NAME: Represents the token name (e.g., "Onwuajuese").

SYMBOL: Represents the token symbol (e.g., "BUNN").

DECIMAL: Indicates the number of decimal places for the token (e.g., 18).

TOTALSUPPLY: Keeps track of the total supply of the token.

OWNER: Stores the address of the contract owner.

USERS: A mapping that associates addresses with token balances.

ALLOWANCE: A nested mapping that tracks the approved allowances for transferring
tokens between addresses.


Its functionalities include:

The CONSTRUCTOR function: it initializes the contract by setting the owner
address and minting 1000e18 tokens to it.
 

The ALLOW function: this function allows me to determine the amount of funds a
particular address can transfer on behalf of another. In other words, it assigns
value to the ALLOWANCE MAP at line 13. Its more like the approve function but more dynamic.
 

The BALANCEOF: it allows an instance of the contract to store and return the balance of
the provided address(user)


The _MINT function is used by the contract owner to create new tokens and increase the total supply.
 

The BURN function: it is supposed to allows the contract owner to decrease the 
total supply by burning a certain amount of tokens. I also added a Burn Event to be emmited
whenever the function called. 
 

The _TRANSFER function is a private function that reduces code duplication by
handling token transfers between addresses. In my own words, it acts as a
TEMPLATE for the transfer FUNCTIONALITIES of the contract
 

The TRANSFER function allows the caller to transfer tokens to another address.
 

The TRANSFERFROM function allows an address to transfer tokens on behalf of
another address, given that an allowance is set.
 

The APPROVE function allows an address to approve another address to spend a
certain number of tokens on its behalf.
 

The contract emits three events: TRANSFER and APPROVAL and the additional BURN event,
which provide information about token transfers and allowance approvals. It is meant to
change the state of the EVM