// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string tokenName = "My minting smart contract."; // You set the name.
    string tokenSymbol = "MINT"; // You set the symbol.
    uint8 public tokenDecimals = 18; // Most tokens use 18 decimal places.
    uint256 public maxTokenSupply = 1000000 * (10**uint256(tokenDecimals)); // You set the max supply.

    constructor() ERC20(tokenName, tokenSymbol) {
        // Token created, but no tokens minted yet.
    }

    function mintFunction() public {
        // Only allow 1 token to be minted per call.
        uint256 amountInDecimals = 1 * 10**uint256(tokenDecimals);

        // Check that minting this won't exceed the max supply.
        uint256 currentSupply = totalSupply();
        require(currentSupply + amountInDecimals <= maxTokenSupply,
            "Minting would exceed the max token supply.");

        _mint(msg.sender, amountInDecimals);
    }
}

