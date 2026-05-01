# Crypto Intel Model Selection

## Decision: Use Claude Sonnet 4.5 (Current Default)

### Cost Analysis

**Claude Sonnet 4.5:**
- Input: $3/M tokens
- Output: $15/M tokens
- Daily usage: ~10k input + 3k output
- **Daily cost: $0.075 (~$2.25/month)**

**Cheaper alternatives:**
- Claude Haiku 3.5: $0.18/month (12x cheaper)
- GPT-4o-mini: $0.09/month (25x cheaper)

### Why Sonnet 4.5 is Worth It

**1. Quality matters for investment advice**
- You're making financial decisions based on this analysis
- One missed signal or bad trade costs more than $2/month
- Example: Missing a $1,000 opportunity = 444 months of Sonnet paid for

**2. Reasoning is critical**
The model needs to:
- ✅ Assess news impact vs. noise
- ✅ Generate thesis-backed signals
- ✅ Explain "why" not just "what"
- ✅ Maintain consistency in scorecard tracking
- ✅ Cross-reference multiple data sources
- ✅ Provide nuanced risk assessment

**3. Cost is negligible**
- $2.25/month vs. potential investment gains/losses
- If you're investing $1,000+, a 0.2% edge = $2+/month value
- Break-even: Just need to catch ONE better signal per year

**4. Accountability proves value**
- Scorecard tracks every prediction
- If Sonnet underperforms, we have data to justify downgrade
- If Sonnet performs well, it's obviously worth it

### Cost-Benefit Examples

| Scenario | Sonnet Cost | Outcome | Payback |
|----------|-------------|---------|---------|
| Avoid bad $500 trade | $2.25/mo | Save $500 | 220 months paid |
| Catch $1k alpha | $2.25/mo | Gain $1,000 | 444 months paid |
| Better entry/exit (2% improvement on $5k) | $2.25/mo | Gain $100 | 44 months paid |
| Miss major news (Haiku) | -$2.07/mo saved | Lose $2,000 | -967 months lost |

### Optional Future Optimization

**Hybrid approach:**
- Use Sonnet 4.5 for analysis (high stakes)
- Use Haiku 3.5 for data fetching (low stakes)
- Best of both worlds: quality + savings

**When to reassess:**
- If monthly cost exceeds $5 (unlikely at current volume)
- After 3 months, review scorecard accuracy
- If Sonnet consistently scores <70% correct, consider downgrade

### Implementation

✅ **Current cron job already uses Sonnet 4.5 (default model)**
- No changes needed
- Monitor OpenRouter billing monthly
- Track scorecard accuracy to validate ROI

### Bottom Line

**$2.25/month for high-quality investment analysis is a no-brainer.**

If you're investing any meaningful capital, the edge from better reasoning pays for itself many times over. The accountability system will prove whether it's worth it—but history strongly suggests premium models outperform on analysis tasks.
