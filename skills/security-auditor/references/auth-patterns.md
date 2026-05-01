# Authentication & Authorization Patterns

## JWT Best Practices

```typescript
import { SignJWT, jwtVerify } from 'jose'

const secret = new TextEncoder().encode(process.env.JWT_SECRET) // min 256-bit

export async function createToken(payload: { userId: string; role: string }) {
  return new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setIssuedAt()
    .setExpirationTime('15m')  // Short-lived access tokens
    .setAudience('your-app')
    .setIssuer('your-app')
    .sign(secret)
}

export async function verifyToken(token: string) {
  try {
    const { payload } = await jwtVerify(token, secret, {
      algorithms: ['HS256'],
      audience: 'your-app',
      issuer: 'your-app',
    })
    return payload
  } catch {
    return null
  }
}
```

## Cookie Security

```typescript
cookies().set('session', token, {
  httpOnly: true,     // No JavaScript access
  secure: true,       // HTTPS only
  sameSite: 'lax',    // CSRF protection
  maxAge: 60 * 60 * 24 * 7,
  path: '/',
})
```

## Rate Limiting

```typescript
import { Ratelimit } from '@upstash/ratelimit'
import { Redis } from '@upstash/redis'

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, '10 s'),
})

// In middleware or route handler
const ip = request.headers.get('x-forwarded-for') ?? '127.0.0.1'
const { success, remaining } = await ratelimit.limit(ip)
if (!success) {
  return NextResponse.json({ error: 'Too many requests' }, { status: 429 })
}
```
