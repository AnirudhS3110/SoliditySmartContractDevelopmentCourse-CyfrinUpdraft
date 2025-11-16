//get funds from the USers into the Contract
// Withdraw Funds to teh owner
// Set the minimum Funding Value in USD

//STDX-License-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {Rate} from "../library/rate.sol";

error notOwner();
contract FundMe {
    using Rate for uint256;
    uint256 public minUSD = 5e18;
    address public immutable i_owner;
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

    constructor() {
        i_owner = msg.sender;
    }

    // Function to withdraw back the user'a fund
    function withdraw() public onlyOwner {
        uint256 index ;
        for(index=0 ; index < senderList.length ; index++)
        {
            address funder = senderList[index];
            senderToAmt[funder] =0;
        }
        senderList = new address[](0);
        
        // Sending back the Funds to the Funders.

        //1. First method involves .transfer function, this function accepts the transaction value and the Max Gas price as input, if the price goes above teh gas limit then the transaction is Reverted
       // payable(msg.sender).transfer(address(this).balance);

        //2. Seciond methid is to Use .send
        // bool isSent = payable(msg.sender).send(address(this).balance);
        // require(isSent, "Send Unsuccessful");

        //3. Thrd MEthod is .call
        (bool isSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(isSuccess, "Call Unsuccessful");
    }

    modifier onlyOwner {
        //require(msg.sender == i_owner, "Only owner is allowed!!");
        if(msg.sender!= i_owner){
            revert notOwner();
        }
        _;
    }
}
