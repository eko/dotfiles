# Go Code Style Guidelines

## 1. Write Clear and Concise Code
- Keep functions short and focused.
- Prefer simplicity and readability over cleverness.

## 2. Follow Go Community Conventions
- Respect the [Effective Go](https://golang.org/doc/effective_go) and [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments) guides.
- Use idiomatic naming, formatting, and patterns.

## 3. Organize Packages by Functionality
- Group related packages together (e.g., `user`, `payment`, `auth`).
- Use short, descriptive package names (e.g., `email`, not `emailservice`).
- Do **not** repeat package names in identifiers.

```go
// GOOD:
package user
func NewService()

// BAD:
package userservice
func NewUserService()
```

## 4. Use Meaningful Variable Names
- Prefer clarity over brevity, but keep it idiomatic (e.g., `cfg`, `err`, `ctx` are acceptable).
- Avoid generic names like `data`, `info`, or `temp`.

## 5. Consistent Indentation and Spacing
- Use tabs (not spaces) for indentation.
- Use `gofmt` or `goimports` to automatically format code.

## 6. Avoid Unnecessary Comments
- Let the code speak for itself.
- Only add comments to explain *why*, not *what*, unless the logic is non-obvious.
- Use Go doc comments for exported functions/types.

```go
// ComputeHash returns a SHA256 hash for a given input.
func ComputeHash(input string) string { ... }
```

## 7. Format Function Signatures for Readability
- Write function arguments and return types on separate lines when there are more than two parameters.

```go
// GOOD:
func NewHandler(
    logger *slog.Logger,
    service *UserService,
    cfg Config,
) *Handler

// BAD:
func NewHandler(logger *slog.Logger, service *UserService, cfg Config) *Handler
```