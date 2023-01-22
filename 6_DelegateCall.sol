// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Contract Delegate acts like  an implementation contract here.
contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

//we are changing the variable owner here by using the function of contract A.
contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if(result) {
      this;
    }
  }



  /*If we had this function below, we wouldnt need fallback and we also wouldnt need to load Delegate 
  contract on Delegation contract address. To use below option:
  1) Load Delegation contract on Delegation contract address
  2) click on wrapperFunc()
  
  function wrapperFunc() external {
    (bool success, ) = address(delegate).delegatecall(abi.encodeWithSignature("pwn()"));
    require(success, "failure: check wrapperFunc");
  }

  */

}
