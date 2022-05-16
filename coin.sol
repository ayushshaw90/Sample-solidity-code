// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
contract coin{
    event Sent(address sender, address receiver, uint amount);
    address public admin;
    constructor(){
        admin=msg.sender;
    }
    mapping (address=> uint) private AccountBalances;
    function mint( uint amount) public{
        require(msg.sender == admin);
        AccountBalances[msg.sender]+=amount;
    }
    error InsufficientBalance(uint requested, uint available);
    function send(address to, uint amt) public{
        if(AccountBalances[msg.sender]<amt){
            revert InsufficientBalance(
                amt,
                AccountBalances[msg.sender]
                );
        }
        AccountBalances[msg.sender]-=amt;
        AccountBalances[to]+=amt;
        emit Sent(msg.sender, to, amt);
    }
    function getBalance() public view returns(uint){
        return(AccountBalances[msg.sender]);
    }
}