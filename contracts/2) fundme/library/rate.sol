// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library Rate {
    function getRateInfo() public  view  returns(uint256)   {
        // To interact with a contract we need ABI and Its Address.
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price*1e10);
    }

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getEthConversion(uint256 _ethAmount) public view returns(uint256) {
        return (_ethAmount*getRateInfo())/1e18;
    }
}