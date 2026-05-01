# Crypto News Sources

## Free RSS Feeds (All Working)

### Tier 1: Major Publications (High Trust, Daily Use)

#### CoinDesk
- **RSS:** `https://www.coindesk.com/arc/outboundfeeds/rss/`
- **Quality:** Industry standard, institutional focus
- **Update frequency:** Real-time
- **Best for:** Market-moving news, regulatory updates, institutional adoption

#### CoinTelegraph
- **RSS:** `https://cointelegraph.com/rss`
- **Quality:** High volume, broad coverage
- **Update frequency:** Multiple times/hour
- **Best for:** Breaking news, altcoin coverage, global perspective

#### The Block
- **RSS:** `https://www.theblock.co/rss.xml`
- **Quality:** Data-driven, analytical
- **Update frequency:** Multiple times/day
- **Best for:** DeFi protocols, on-chain analysis, funding rounds

#### Decrypt
- **RSS:** `https://decrypt.co/feed`
- **Quality:** Accessible, narrative-driven
- **Update frequency:** Multiple times/day
- **Best for:** Explaining trends, user-focused stories, NFT/gaming

---

### Tier 2: Specialist Publications (For Deep Dives)

#### CryptoSlate
- **RSS:** `https://cryptoslate.com/feed/`
- **Quality:** Technical depth, protocol focus
- **Best for:** Protocol updates, security news, on-chain events

#### Bitcoin Magazine
- **RSS:** `https://bitcoinmagazine.com/.rss/full/`
- **Quality:** Bitcoin-focused, maximalist perspective
- **Best for:** Bitcoin-specific developments, Lightning Network, mining

#### BeInCrypto
- **RSS:** `https://beincrypto.com/feed/`
- **Quality:** Price analysis, technical analysis
- **Best for:** Chart patterns, TA insights, price predictions

---

### Tier 3: Aggregators & Real-Time (For Trending Topics)

#### CryptoPanic (Aggregator)
- **API:** `https://cryptopanic.com/api/v1/posts/?auth_token=free&public=true`
- **Quality:** Aggregates from 100+ sources, sentiment analysis
- **Best for:** Trending topics, community sentiment, filtering noise

#### Messari News API
- **API:** `https://data.messari.io/api/v1/news`
- **Quality:** Curated feed from trusted sources
- **Best for:** Research-grade news, avoiding spam/scams

---

## News Fetching Strategy

### Daily Brief (7:00 AM)
1. **Fetch last 24h headlines** from Tier 1 sources (CoinDesk, CoinTelegraph, The Block, Decrypt)
2. **Parse for key events:**
   - Major price movements (>5% in BTC/ETH)
   - Regulatory news (SEC, Fed, international policy)
   - Protocol launches/updates (mainnet releases, upgrades)
   - Institutional adoption (companies buying BTC, ETF flows)
   - Security incidents (hacks, exploits, shutdowns)
3. **Filter for relevance:**
   - Skip: Meme coin pumps, celebrity tweets, minor airdrops
   - Include: Macro events, DeFi protocol news, major project updates
4. **Summarize top 3-5 stories** with market impact assessment

### Real-Time Monitoring (Optional)
- Use CryptoPanic API for trending stories
- Alert on breaking news with >1000 votes or "important" tag
- Cross-reference with price action (did BTC spike/dump?)

---

## RSS Parsing Commands

### CoinDesk (Latest 5 Headlines)
```bash
curl -sL "https://www.coindesk.com/arc/outboundfeeds/rss/" | \
xmllint --xpath '//item/title/text()' - 2>/dev/null | head -5
```

### CoinTelegraph (Latest 5 Headlines)
```bash
curl -sL "https://cointelegraph.com/rss" | \
xmllint --xpath '//item/title/text()' - 2>/dev/null | head -5
```

### The Block (Latest 5 Headlines)
```bash
curl -sL "https://www.theblock.co/rss.xml" | \
xmllint --xpath '//item/title/text()' - 2>/dev/null | head -5
```

### Decrypt (Latest 5 Headlines)
```bash
curl -sL "https://decrypt.co/feed" | \
xmllint --xpath '//item/title/text()' - 2>/dev/null | head -5
```

### Get Title + Link + PubDate
```bash
curl -sL "https://www.coindesk.com/arc/outboundfeeds/rss/" | \
xmllint --xpath '//item[position()<=5]' - 2>/dev/null | \
xmllint --format - | grep -E '<title>|<link>|<pubDate>'
```

---

## Market-Moving News Categories

### High Impact (Always Include)
1. **Federal Reserve / Central Bank Policy**
   - Rate decisions, inflation data, FOMC minutes
   - Affects all risk assets including crypto

2. **SEC / Regulatory Actions**
   - ETF approvals/rejections
   - Enforcement actions against exchanges
   - Classification rulings (security vs commodity)

3. **Major Exchange Issues**
   - Binance, Coinbase, Kraken outages or legal problems
   - Customer fund freezes
   - Insolvency rumors

4. **Protocol Exploits / Hacks**
   - >$10M stolen
   - Major DeFi protocol compromised
   - Bridge hacks (cross-chain)

5. **Institutional Adoption**
   - Public companies buying BTC (MicroStrategy-style)
   - Major banks launching crypto services
   - ETF inflows/outflows

### Medium Impact (Include if Relevant)
6. **Major Protocol Updates**
   - Ethereum upgrades
   - Layer 2 launches
   - Major DeFi protocol v2/v3 releases

7. **Macro Economic Data**
   - CPI, unemployment, GDP
   - Treasury yields (10-year)
   - DXY (dollar strength)

8. **Geopolitical Events**
   - Crypto bans/regulations in major countries
   - Sanctions affecting crypto
   - Banking crises (SVB-style)

### Low Impact (Skip Unless Massive)
9. **Altcoin Launches** — Unless top 20 project
10. **Celebrity Endorsements** — Noise
11. **Minor Airdrops** — Not actionable

---

## News Sentiment Scoring

For each top story, assign:
- **Bullish:** + (positive catalyst)
- **Bearish:** - (negative catalyst)
- **Neutral:** ~ (informational, no clear direction)

**Example:**
- "SEC approves spot Bitcoin ETF" → **++** (very bullish)
- "Binance faces DOJ investigation" → **--** (very bearish)
- "Ethereum completes Dencun upgrade" → **+** (mildly bullish)
- "CoinDesk launches new newsletter" → **~** (neutral)

---

## Integration with Daily Brief

### Brief Structure:
```markdown
## 📰 Market News (Last 24h)

### [Sentiment] Headline
**Source:** CoinDesk
**Impact:** High | Medium | Low
**What it means:** [1-2 sentence summary + market implication]

### [Sentiment] Headline
...
```

### Example:
```markdown
## 📰 Market News (Last 24h)

### [+] Ark Invest: Bitcoin to Hit $16T Market Cap by 2030
**Source:** CoinDesk
**Impact:** Medium
**What it means:** Major institutional player (Cathie Wood's Ark) published bullish thesis based on institutional demand. While speculative, signals continued mainstream interest. Could support current accumulation thesis.

### [-] Dormant Ethereum Wallets Drained in Mysterious Event
**Source:** CryptoSlate
**Impact:** Low
**What it means:** Security concern but no major protocol affected. Reminder to secure private keys properly. Not market-moving.
```

---

## Fallback Strategy

If RSS feeds fail (rare):
1. Use web_search for "crypto news today" from major sources
2. Check CryptoPanic API as backup aggregator
3. Flag in brief: "⚠️ RSS feeds unavailable, using backup sources"

---

## Rate Limits & Best Practices

- **RSS feeds:** No rate limits (public feeds)
- **CryptoPanic API:** Free tier = 1000 calls/day (plenty)
- **Cache headlines:** Store for 1 hour, only fetch new ones daily
- **Respect robots.txt:** Don't hammer feeds
- **Parse responsibly:** Extract title + link only, don't scrape full articles
