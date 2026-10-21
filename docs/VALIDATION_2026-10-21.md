# Read-only readiness validation — 2026-10-21 JST

The readiness inspector now rejects bigint results outside uint256 for block numbers, gas balances, token balances and existing Classic Router allowances. The maximum uint256 allowance remains exact and is reported as an existing exposure; no approval is granted. Regression tests cover overflow in every field and maximum-value handling.

Validation: npm run check passed (compile, simulated-EVM tests, typecheck and 65 read-only tests). npm ci --ignore-scripts reported zero known vulnerabilities. The public Base Mainnet identity check passed:

```json
{
  "network": "Base Mainnet",
  "chainId": 8453,
  "blockNumber": "52862225",
  "contractAddress": "0xB4654b5a4617Fe2c27a0DD6EAEe98F8AA941b895",
  "tokenName": "CAWELON CORE",
  "tokenSymbol": "CAWELON",
  "decimals": 18,
  "totalSupplyBaseUnits": "420000000000000000000000000000000",
  "originalIssuanceTokenUnits": "420000000000000",
  "estimatedBurnedBaseUnits": "0",
  "deployedCodePresent": true,
  "readOnly": true,
  "contractDeployedByCheck": false,
  "transactionSent": false,
  "securityAudit": false
}
```

No real-wallet signatures, trades, transfers, approval changes, LP deposits or deployments were performed. Contract operations and permit signing in the existing test suite use only simulated-EVM accounts. No game development. This is not an independent security audit or proof of third-party dApp compatibility.

[Shared Wallet verification and external Aerodrome simulation](https://github.com/FordPrefect2026/ThreeCore-Wallet/blob/main/docs/VALIDATION_2026-10-21.md).
