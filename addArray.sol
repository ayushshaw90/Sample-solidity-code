pragma solidity ^0.8.13;
contract addArray{
    uint[] arr;
    function addElement(uint a) public{
        arr.push(a);
    }
    function getSum() public view returns(uint){
        uint sum=0;
        for(uint i=0;i<arr.length;i++){
            sum=sum+arr[i];
        }
        return sum;
    }
}