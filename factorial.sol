pragma solidity ^0.8.13;
contract factorial{
    function getFactorial(uint256 n) public pure returns(uint256){
        uint256 f=1;
        for(uint i=1;i<=n;i++){
            f=f*i;
        }
        return(f);
    }
}