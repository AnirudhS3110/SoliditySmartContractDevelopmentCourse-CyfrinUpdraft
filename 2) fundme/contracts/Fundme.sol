//get funds from the USers into the Contract
// Withdraw Funds to teh owner
// Set the minimum Funding Value in USD

//STDX-License-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {Rate} from "../library/rate.sol";


contract FundMe {
    using Rate for uint256;
    uint256 public minUSD = 5e18;
    address[] public senderList;
    mapping (address senderAdd => uint256 amt) senderToAmt;
    // Function to get fund from the user
    // Just like Wallets can Hold Funds, Contracts can Hold Funds
    function fund() public payable {
        // Alow user to send Money
        // Set the minimum amt for the Transaction

        

        // If msg.value is less than the 1 ETH, that is 10^18 wei , all the changes made before the Require Line will be Roll backed
        require(msg.value.getEthConversion() >= minUSD, "Dint have enough Credit");
        senderToAmt[msg.sender] += msg.value;


    }

    // Function to withdraw back the user'a fund
    function withdraw() public {
        uint256 index ;
        for(index=0 ; index < senderList.length ; index++)
        {
            address funder = senderList[index];
            senderToAmt[funder] =0;
        }
        senderList = new address[](0);
    }
}
