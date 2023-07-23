// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract ArbitrageBot {
  address public owner;

  constructor() {
    owner = msg.sender;
  }
}
