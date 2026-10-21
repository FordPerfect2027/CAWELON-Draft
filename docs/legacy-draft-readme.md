# CAWELON — Provisional Draft

**Status:** Draft / Not Audited / Not Deployed  
**Intended Network:** Ethereum Mainnet  
**Maintainer:** 0628DAO

This repository contains the provisional public materials for the CAWELON relaunch, including an ERC-20 smart contract draft and a separated dApp architecture. CAWELON is being designed as the foundational token for the 0628DEX Liquidity Layer and asset-exchange infrastructure within the 0628DAO ecosystem.

The repository is public to make the pre-deployment design and validation process transparent. No official CAWELON contract has been deployed from this repository. All code currently published here is an unaudited draft.

## Current Provisional Specifications

| Item | Specification |
|---|---|
| Token Name | CAWELON (intended) |
| Symbol | Not finalized; constructor parameter |
| Network | Ethereum Mainnet |
| Standard | ERC-20 |
| Initial Supply | 420,000,000,000,000 tokens |
| Decimals | 18 |
| Transfer / Buy / Sell Tax | 0% |
| Rewards / Reflection | None |
| Additional Minting | None |
| Burn | Self-burn by the token holder only |
| Permit | EIP-2612 |
| Owner / Admin / Pause / Upgrade / Proxy | None |

The CAWELON name is intended to remain. The token symbol and initial recipient will be formally determined before deployment and will not be copied mechanically from CAW. The current contract therefore accepts the token name, symbol, and initial recipient as constructor parameters.

## Position within 0628DAO

0628DAO is not a token name. It is a governance concept that combines multiple specialized intelligences with final human responsibility. CAWELON is one of the systems governed under that concept; CAWELON is not 0628DAO itself.

This repository contains only the CAWELON base-token draft and its dApp integration principles. The 0628DEX application, liquidity management, frontend, and governance execution mechanisms will be designed, tested, and published as separate contracts and development stages.

## Design Principles

- Keep the base token implementation small and standards-based
- Place dApp-specific functions in separate protocol contracts
- Connect through `IERC20` and `IERC20Permit`
- Use OpenZeppelin `SafeERC20` for token transfers
- Do not embed taxes, reflection, automatic distribution, or DEX-pair detection in the base token
- Do not provide any post-deployment minting path

This separation allows future dApps to be added without reissuing the base token and allows security review, operational controls, and update policies to be designed independently for each protocol component.

## Repository Contents

- `CAWELON_Draft.sol` — Provisional ERC-20 smart contract
- `CAWELONDraft.txt` — dApp integration principles and pre-deployment considerations

## Items to Complete Before Deployment

- Confirm the final token name and symbol
- Confirm the wallet receiving the initial supply
- Decide whether any fixed restrictions belong in the base token or the dApp layer
- Determine whether `ERC20Votes` is required
- Implement automated tests and complete testnet validation
- Complete an independent security audit
- Publish the official deployment address

## Important Notices

- The code is unaudited and undeployed.
- No official CAWELON contract address currently exists.
- This repository is not an offer to sell tokens, an investment solicitation, or a promise of profit or price appreciation.
- Before connecting a wallet or transferring tokens, verify the network and contract address through future official announcements.
- Specifications may change following testing, auditing, or legal review.

© 0628DAO. Development record for technical review.

