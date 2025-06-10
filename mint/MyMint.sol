// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string tokenName = "My minting smart contract."; // You set the name.
    string tokenSymbol = "MINT"; // You set the symbol.
    uint256 tokenDecimals = 18; // Most tokens use 18 decimal places.
    uint256 maxTokenSupply = 1000000 * (10 ** tokenDecimals); // You set the max supply.

    constructor() ERC20(tokenName, tokenSymbol) {
        // Constructor doesn't mint; minting is handled separately.
    }

    function mintFunction(uint256 amountToMint) public {
        // Only allow minting 1 token (1 * 10^18 for 18 decimals)
        require(amountToMint == 1e18, "You can only mint exactly 1 token at a time");

        // Ensure we don’t exceed max supply
        require(totalSupply() + amountToMint <= maxTokenSupply, "Exceeds max supply");

        _mint(msg.sender, amountToMint);
    }
}
