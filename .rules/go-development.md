# Go Development Rules

## 1. Follow SOLID Principles
- Design your Go code according to the SOLID principles.
- Prioritize readability, maintainability, and testability.
- Avoid writing god-structs or large, untestable functions.

## 2. Favor Interfaces over Concrete Types
- Always code against interfaces, not implementations.
- Keep interfaces small and focused (prefer `io.Writer` over a custom one).

```go
type EmailSender interface {
    Send(
        email Email,
    ) error
}
```

## 3. Keep Packages Small and Cohesive
- Each package should have a single responsibility.
- Group related logic, not just files with similar names.
- Avoid circular dependencies by clearly separating layers (e.g., `domain`, `service`, `adapter`, `infra`).

## 4. Use Dependency Injection
- Inject dependencies explicitly using constructors.

```go
func NewUserService(
    repo UserRepository,
    mailer EmailSender,
) *UserService {
    return &UserService{
        repo: repo,
        mailer: mailer,
    }
}
```

## 5. Prefer Composition over Inheritance
- Go doesn't have inheritance — use composition to build complex behaviors from simple ones.

## 6. Write Idiomatic Go
- Use naming conventions: short names for receivers (`u` for `User`, `s` for `Service`, etc.).
- Use `errors.Is/As` instead of comparing strings.
- Return early to reduce nesting.

```go
if err != nil {
    return fmt.Errorf(
        "operation failed: %w",
        err,
    )
}
```

## 7. Make Zero Values Useful
- Design types so that their zero values are valid and usable when possible.

```go
type Config struct {
    Timeout time.Duration // zero = no timeout
}
```

## 8. Write Unit Tests with Table-Driven Style
- Use testify library to make assertions/requirements.
- Structure tests using test cases in slices.

```go
func TestAdd(
	t *testing.T,
) {
	testCases := []struct {
		name       string
		a, b, want int
	}{
		{
			name: "positive",
			a:    2,
			b:    3,
			want: 5,
		},
		{
			name: "zero",
			a:    0,
			b:    0,
			want: 0,
		},
	}

	for _, testCase := range testCases {
		t.Run(testCase.name, func(t *testing.T) {
			result := Add(testCase.a, testCase.b)

			if result != testCase.want {
				assert.Equal(t, testCase.want, result)
			}
		})
	}
}
```

## 9. Isolate Business Logic from Infrastructure
- Keep core business rules in a clean domain layer.
- Implement adapters around it for databases, HTTP, etc.

## 10. Avoid Global State
- Use context to pass request-scoped values.
- Do not use `init()` unless absolutely necessary.

## 11. Use Go Modules and Semantic Versioning
- Keep your `go.mod` clean.
- Use tagged versions for internal and external modules.

## 12. Respect the Error Handling Culture
- Always handle errors explicitly.
- Use sentinel errors and wrap them with `%w` when needed.

## 13. Write Clear and Minimal Documentation
- Document exported symbols.

```go
// UserService handles user-related business logic.
type UserService struct { ... }
```

## 14. Run go fmt, go vet, staticcheck, and linters
- Format code automatically.
- Integrate linters like `golangci-lint` in your workflow.