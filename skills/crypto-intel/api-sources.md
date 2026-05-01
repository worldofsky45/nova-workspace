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
# Get all Aave v3 pools across chains
curl "https://yields.llama.fi/pools"

# Filter for Aave v3 USDC (example response):
{
  "pool": "aave-v3-usdc-ethereum",
  "chain": "Ethereum",
  "project": "aave-v3",
  "symbol": "USDC",
  "tvlUsd": 1200000000,
  "apyBase": 2.7,
  "apyReward": 0,
  "apy": 2.7
}
```

### Morpho APY
```bash
# Morpho optimizer rates via DeFiLlama
curl "https://yields.llama.fi/pools" | jq '.data[] | select(.project == "morpho-aave-v3")'

# Or direct from Morpho API (if available):
curl "https://api.morpho.org/v1/markets/usdc-ethereum"
```

### Curve 3pool
```bash
# Curve APYs via DeFiLlama
curl "https://yields.llama.fi/pools" | jq '.data[] | select(.project == "curve" and .symbol contains "3pool")'

# Returns base APY + CRV rewards separately
```

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
- **Alternative.me:** No published limits

**Best practice:** Cache responses in `~/crypto-intel/cache/` for 1 hour to avoid hitting limits.
