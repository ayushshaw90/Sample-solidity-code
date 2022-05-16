pragma solidity ^0.8.13;
contract binarySearch{
    uint[] arr;
    function selectionSort() public{
        for(uint i=0;i<arr.length;i++){
            uint z=i;
            for(uint j=i+1;j<arr.length;j++){
                if(arr[j]<arr[z]){
                    z=j;
                }
            }
            uint temp=arr[z];
            arr[z]=arr[i];
            arr[i]=temp;
        }
    }
    function addElement(uint _x) public{
        arr.push(_x);
    }
    //return 0 if search unsuccessful else returns search successful
    function search(uint target) public view returns(uint){
        uint lb=0;
        uint ub=arr.length-1;
        uint mid;
        while(lb<=ub){
            mid=(lb+ub)/2;
            if(arr[mid]==target)
            return(1);
            if(arr[mid]>target){
                ub=mid-1;
            }else{
                lb=mid+1;
            }
        }
        return(0);
    }
}