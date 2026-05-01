# Input Validation Patterns

## Zod Validation for API/Actions

```typescript
import { z } from 'zod'

const userSchema = z.object({
  email: z.string().email().max(255),
  password: z.string().min(8).max(128),
  name: z.string().min(1).max(100).regex(/^[a-zA-Z\s'-]+$/),
  age: z.number().int().min(13).max(150).optional(),
})

// Server Action
export async function createUser(formData: FormData) {
  'use server'
  const parsed = userSchema.safeParse({
    email: formData.get('email'),
    password: formData.get('password'),
    name: formData.get('name'),
  })

  if (!parsed.success) {
    return { error: parsed.error.flatten() }
  }

  // Safe to use parsed.data
}
```

## File Upload Validation

```typescript
const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/webp']
const MAX_SIZE = 5 * 1024 * 1024 // 5MB

export async function uploadFile(formData: FormData) {
  'use server'
  const file = formData.get('file') as File

  if (!file || file.size === 0) return { error: 'No file' }
  if (!ALLOWED_TYPES.includes(file.type)) return { error: 'Invalid file type' }
  if (file.size > MAX_SIZE) return { error: 'File too large' }

  // Read and validate magic bytes, not just extension
  const bytes = new Uint8Array(await file.arrayBuffer())
  if (!validateMagicBytes(bytes, file.type)) return { error: 'File content mismatch' }
}
```
