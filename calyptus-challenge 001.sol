// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract A {
    uint immutable x;
     constructor(){
        x=42;
     }
     function f() public view returns(uint256){
        return x;
     }
}

     contract B is A{
        uint public y = f();
     } 
     // F() value =42



