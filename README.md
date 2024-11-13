# Smart-Contract-Project

## Description
This Solidity project is a modified simple token system that implements the `require()`, `assert()`, and `revert()` statements. The token contract includes basic functionality for minting, burning, and transferring tokens, while tracking token balances and total supply.

## Key Features
- **Token Information**: The contract publicly stores details about the token name, abbreviation, and total supply of tokens.
  
- **Minting Functionality**: New tokens can be created and assigned to a specific address. The total supply of tokens is increased by the number of tokens minted, and the recipient's balance is updated accordingly. Checks are included to ensure minting values are positive.

- **Burning Functionality**: Allows token holders to destroy tokens, reducing both the total supply and the balance of the specified address. The function ensures that the address has sufficient tokens before proceeding with the burn.

- **Transfer Functionality with Supply Reduction**: Users can transfer tokens to other addresses. During each transfer, the total supply of tokens is reduced by the transferred amount. This modification ensures that token supply decreases with every transfer. Checks are also included to confirm that the sender has a sufficient balance for the transfer.

## Resources Used
- **Remix IDE**: [Remix Ethereum](https://remix.ethereum.org/) for coding and testing the Solidity contract.

## Authors
- **Aciel07**
