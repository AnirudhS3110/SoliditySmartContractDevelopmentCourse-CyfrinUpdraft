// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract UncheckedContractExample {
    uint8 sample = 255;
    
    function add() public {
        unchecked {sample+=1;} 
        // this Unchecked handles the Overflow erroe in versions above 0.8 
        // using unchecked Reduces Gas Cost  
    }
}