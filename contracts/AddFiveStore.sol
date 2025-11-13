// Identified-License: MIT

pragma solidity ^0.8.18;
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveMore is SimpleStorage {

    function store(uint256 _number) public override  {
     favouriteNumber = _number + 5;   
    }

}