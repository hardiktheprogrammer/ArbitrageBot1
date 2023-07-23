// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract ArbitrageBot {
  AggregatorV3Interface internal uniswapPriceFeed;
  AggregatorV3Interface internal sushiSwapPriceFeed;

  constructor(address _uniswapPriceFeed, address _sushiSwapPriceFeed) {
    uniswapPriceFeed = AggregatorV3Interface(_uniswapPriceFeed);
    sushiSwapPriceFeed = AggregatorV3Interface(_sushiSwapPriceFeed);
  }

  function getUniswapPrice() public view returns (uint256) {
    (int256 price ) = uniswapPriceFeed.latestRoundData();
    require(price > 0, 'Invalid Uniswap price');
    // Convert Chainlink price to 18 decimals (same as ETH and most tokens)
    uint256 decimals = 18;
    return uint256(price) * (10 ** decimals);
  }

  function getSushiSwapPrice() public view returns (uint256) {
    ( int256 price  ) = sushiSwapPriceFeed.latestRoundData();
    require(price > 0, 'Invalid SushiSwap price');
    // Convert Chainlink price to 18 decimals (same as ETH and most tokens)
    uint256 decimals = 18;
    return uint256(price) * (10 ** decimals);
  }

  function comparePrices() public view returns (string memory) {
    uint256 uniswapPrice = getUniswapPrice();
    uint256 sushiSwapPrice = getSushiSwapPrice();

  }
