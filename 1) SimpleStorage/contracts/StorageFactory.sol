// SDX-Licence-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageList;

    function initSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageList.push(simpleStorage);
    }

    function sfSimpleStorage(uint256 _contractIndex,uint256 _number ) public {
        simpleStorageList[_contractIndex].store(_number);
    }

    function getSfSimpleStorage(uint256 _contractIndex) public view returns (uint256) {
        return  simpleStorageList[_contractIndex].retrieve();
    }

}