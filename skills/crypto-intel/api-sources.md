# Crypto Intel API Sources

## Price Data

### CoinGecko API (Free, No Key Required)
```bash
# Get multiple coin prices at once
curl "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana,ripple,cardano&vs_currencies=usd&include_24hr_change=true&include_market_cap=true"

# Returns:
{
  "bitcoin": {"usd": 76550, "usd_24h_change": 0.6, "usd_market_cap": 1500000000000},
  "ethereum": {"usd": 2285, "usd_24h_change": 1.2, "usd_market_cap": 275000000000},
  "solana": {"usd": 83.60, "usd_24h_change": -0.17, "usd_market_cap": 38000000000},
  "ripple": {"usd": 0.52, "usd_24h_change": 0.8, "usd_market_cap": 29000000000},
  "cardano": {"usd": 0.45, "usd_24h_change": -0.3, "usd_market_cap": 16000000000}
}
```

### BTC Dominance
```bash
# Global market data
curl "https://api.coingecko.com/api/v3/global"

# Returns btc_market_cap_percentage
```

---

## DeFi Protocol APYs

### DeFiLlama API (Free, No Key)
```bash
# Get all lending pools
curl "https://yields.llama.fi/pools"

# Aave v3 USDC (Ethereum)
curl "https://yields.llama.fi/pools" | jq '.data[] | select(.project == "aave-v3" and .symbol == "USDC" and .chain == "Ethereum")'

# Curve 3pool
curl "https://yields.llama.fi/pools" | jq '.data[] | select(.project == "curve-dex" and .symbol == "DAI-USDC-USDT")'
```

### Morpho GraphQL API (Free, No Key)
```bash
# Morpho USDC markets (Ethereum)
curl -X POST https://api.morpho.org/graphql \
  -H "Content-Type: application/json" \
  -d '{
    "query": "query { markets(first: 20, orderBy: SupplyAssetsUsd, orderDirection: Desc, where: { chainId_in: [1], loanAssetSymbol_in: [\"USDC\"] }) { items { marketId loanAsset { symbol } collateralAsset { symbol } state { supplyApy avgSupplyApy supplyAssetsUsd borrowAssetsUsd utilization } } } }"
  }'

# Filter for markets with >$50M TVL and <50% APY (excludes anomalies)
# Use avgSupplyApy for more stable rates (30d average)
```

**Key notes:**
- Morpho has many markets per asset (different collateral types)
- Filter for: `supplyAssetsUsd > 50000000` (>$50M) and `supplyApy < 50` (reasonable APY)
- Use `avgSupplyApy` for 30-day average (more stable than real-time `supplyApy`)
- Ignore markets with crazy APYs (2000%+) — they're low liquidity or edge cases

---

## Fear & Greed Index

### Alternative.me API (Free)
```bash
curl "https://api.alternative.me/fng/?limit=1"

# Returns:
{
  "data": [{
    "value": "29",
    "value_classification": "Fear",
    "timestamp": "1777646400"
  }]
}
```

---

## Fallback Strategy

If APIs fail (rate limits, downtime):
1. Use cached data from last successful call (note staleness in brief)
2. Fall back to web scraping as secondary source
3. Flag missing data clearly: "⚠️ Unable to fetch current APY, using estimate"
4. Never make predictions on missing data — wait for next run

---

## Rate Limits

- **CoinGecko Free:** 10-30 calls/min (plenty for daily use)
- **DeFiLlama:** No published limits, generally permissive
- **Morpho GraphQL:** No published limits (complexity-based throttling)
- **Alternative.me:** No published limits

**Best practice:** Cache responses in `~/crypto-intel/cache/` for 1 hour to avoid hitting limits.
