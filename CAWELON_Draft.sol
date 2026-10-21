// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @title CAWELON (Provisional Draft)
 * @notice Ethereum ERC-20 draft for the CAWELON relaunch.
 *
 * Confirmed provisional policy:
 * - Fixed initial supply: 420,000,000,000,000 tokens
 * - Decimals: 18 (OpenZeppelin ERC20 default)
 * - Transfer / buy / sell tax: 0%
 * - No rewards or reflection
 * - No later minting
 * - Holders may burn only their own tokens
 * - EIP-2612 Permit support
 * - No owner, administrator, pause, upgrade or proxy authority
 * - dApp-compatible standard ERC-20 behavior; application logic stays in
 *   separate protocol contracts instead of being embedded in this token
 *
 * Token name, symbol and initial recipient are constructor parameters because
 * they must not be copied from CAW and have not yet been finalized.
 */
contract CAWELON_Draft is ERC20, ERC20Permit {
    uint256 public constant INITIAL_SUPPLY_UNITS = 420_000_000_000_000;
    uint256 public constant INITIAL_SUPPLY = INITIAL_SUPPLY_UNITS * 10 ** 18;

    error ZeroInitialRecipient();

    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        address initialRecipient
    ) ERC20(tokenName, tokenSymbol) ERC20Permit(tokenName) {
        if (initialRecipient == address(0)) revert ZeroInitialRecipient();

        // The entire fixed supply is created once. There is no external or
        // internal minting route exposed after construction.
        _mint(initialRecipient, INITIAL_SUPPLY);
    }

    /**
     * @notice Permanently destroys tokens owned by the caller.
     * @dev No burnFrom function is provided, so no account can burn another
     * holder's tokens, even through an allowance.
     */
    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
}
