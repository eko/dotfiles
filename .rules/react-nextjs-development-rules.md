# React & Next.js Development Rules

## 1. Code Structure & File Organization
- Group components by **feature**, not by type (`components/Button.tsx` → `features/user/components/Button.tsx`).
- Use folders like: `features/`, `shared/`, `pages/`, `hooks/`, `lib/`, `components/`, `styles/`.

## 2. Component Design
- Use **function components** with **hooks**.
- Keep components small, focused, and reusable.
- Avoid deeply nested JSX; break into subcomponents.
- Use `React.memo()` for performance when applicable.

```tsx
const UserCard = React.memo(({ user }: { user: User }) => (
  <div>{user.name}</div>
))
```

## 3. Hooks Usage
- Prefer custom hooks for logic reuse.
- Always prefix hooks with `use` (e.g., `useUser`, `useAuth`).
- Avoid using hooks conditionally or inside loops.

```tsx
// GOOD:
const useUser = () => {
  const { data } = useSWR('/api/user')
  return data
}
```

## 4. State Management
- Prefer local state (`useState`, `useReducer`) for isolated UI logic.
- Use `context`  for shared/global state.
- Avoid prop drilling for more than 2 levels — lift state or use context.

## 5. Next.js Routing & Pages
- Use the App Router (`app/` directory) when using Next.js 13+.
- Always use Server Components by default and switch to Client Components only when necessary (`"use client"`).
- Use file-based routing and dynamic segments (`[id].tsx`, `[[...slug]].tsx`) idiomatically.

## 6. Data Fetching
- Prefer React Server Components + `fetch()` or `next/data`.
- Use [SWR](https://swr.vercel.app/) or [React Query](https://tanstack.com/query/latest) for client-side fetching.

```tsx
const { data, error } = useSWR('/api/user')
```

## 7. API Routes
- For simple backend logic, use `app/api` or `pages/api`.
- Always validate input with tools like `zod`, `yup`, or `Joi`.

```tsx
import { z } from 'zod'

const schema = z.object({
  email: z.string().email(),
})

const data = schema.parse(req.body)
```

## 8. Styling
- Use Tailwind CSS or CSS Modules.
- Avoid global styles except for base layout/reset.
- Prefer utility-first CSS over complex class chains.

## 9. Error Handling
- Use `ErrorBoundary` or `error.tsx` in Next.js.
- Provide fallback UIs and proper error logging.

## 10. Testing
- Use Jest + React Testing Library.
- Focus on behavior, not implementation.
- Aim for high coverage on logic and UI components.

```tsx
test('renders user name', () => {
  render(<UserCard user={{ name: 'Vincent' }} />)
  expect(screen.getByText('Vincent')).toBeInTheDocument()
})
```

## 11. Performance
- Use dynamic imports with `next/dynamic` to lazy-load heavy components.
- Use `<Image />` from `next/image` for optimized images.
- Enable caching headers and ISR when needed.

## 12. Type Safety
- Use TypeScript strictly.
- Define types/interfaces per feature (`types.ts` or colocated).
- Never use `any`.

## 13. Environment & Configuration
- Use `.env.local` for environment-specific values.
- Use `process.env.MY_VAR` with type guards.
- Never expose secrets to the frontend.