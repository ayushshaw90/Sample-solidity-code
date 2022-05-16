// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
contract hotel_rooms{
    //hotel has 30 rooms
    address[30] roomOwners;
    error NonOwnership(address attempter, uint room_number);
    error NoSuchRoom(uint room_number);
    event Transferred(address newOwner, uint roomNumber);
    constructor(){
        for(uint i=0;i<roomOwners.length;i++){
            roomOwners[i]=msg.sender;
        }
    }

    function getOwner(uint roomNumber) public view returns(address){
        if(roomNumber>=30){
            revert NoSuchRoom(roomNumber);
        }
        return(roomOwners[roomNumber]);
    }
    function transferOwnership(address newOwner, uint number) public{
        if(getOwner(number) != msg.sender){
            revert NonOwnership(msg.sender, number);
        }
        roomOwners[number] = newOwner;
        emit Transferred(newOwner, number);
    }
}