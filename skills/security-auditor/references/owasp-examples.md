# OWASP Top 10 Code Examples

## 1. Broken Access Control (A01:2021)

```typescript
// ❌ BAD: No authorization check
app.delete('/api/posts/:id', async (req, res) => {
  await db.post.delete({ where: { id: req.params.id } })
  res.json({ success: true })
})

// ✅ GOOD: Verify ownership
app.delete('/api/posts/:id', authenticate, async (req, res) => {
  const post = await db.post.findUnique({ where: { id: req.params.id } })
  if (!post) return res.status(404).json({ error: 'Not found' })
  if (post.authorId !== req.user.id && req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Forbidden' })
  }
  await db.post.delete({ where: { id: req.params.id } })
  res.json({ success: true })
})
```

## 2. Cryptographic Failures (A02:2021)

```typescript
// ❌ BAD: Storing plaintext passwords
await db.user.create({ data: { password: req.body.password } })

// ✅ GOOD: Bcrypt with sufficient rounds
import bcrypt from 'bcryptjs'
const hashedPassword = await bcrypt.hash(req.body.password, 12)
await db.user.create({ data: { password: hashedPassword } })
```

## 3. Injection (A03:2021)

```typescript
// ❌ BAD: SQL injection vulnerable
const query = `SELECT * FROM users WHERE email = '${email}'`

// ✅ GOOD: Parameterized queries
const user = await db.query('SELECT * FROM users WHERE email = $1', [email])

// ✅ GOOD: ORM with parameterized input
const user = await prisma.user.findUnique({ where: { email } })
```

```typescript
// ❌ BAD: Command injection
const result = exec(`ls ${userInput}`)

// ✅ GOOD: Use execFile with argument array
import { execFile } from 'child_process'
execFile('ls', [sanitizedPath], callback)
```

## 4. Cross-Site Scripting (XSS) (A07:2021)

```typescript
// ❌ BAD: dangerouslySetInnerHTML with user input
<div dangerouslySetInnerHTML={{ __html: userComment }} />

// ✅ GOOD: Sanitize HTML
import DOMPurify from 'isomorphic-dompurify'
<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userComment) }} />

// ✅ BEST: Render as text (React auto-escapes)
<div>{userComment}</div>
```
