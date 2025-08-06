# Go Tools and Dependencies

## 1. Logging
- Use Go's **native `slog` logger** (introduced in Go 1.21).
- Always structure logs with levels (`Info`, `Warn`, `Error`) and include context fields.

```go
logger := slog.New(
    slog.NewJSONHandler(os.Stdout, nil),
)
logger.Info(
    "User created",
    "userID",
    id,
)
```

## 2. Dependency Injection
- Always use `uber-go/fx` for dependency injection and application lifecycle management.
- Register constructors and let Fx manage instantiation and wiring.

```go
fx.New(
    fx.Provide(NewDatabase, NewService),
    fx.Invoke(StartHTTPServer),
)
```

## 3. Database Access
- Use [`gorm.io/gorm`](https://gorm.io/) as the standard ORM for all database operations.
- Structure models cleanly and use migrations of all models in a dedicated `database` package when applicable.

## 4. Testing with External Dependencies
- Use [testcontainers-go](https://github.com/testcontainers/testcontainers-go) to run integration tests with real services (e.g., PostgreSQL, Redis).
- Avoid mocks when testing infrastructure; prefer real containers for reliability.

```go
container, err := testcontainers.GenericContainer(
    ctx,
    testcontainers.GenericContainerRequest{
        ContainerRequest: testcontainers.ContainerRequest{
            Image: "postgres:15",
            ExposedPorts: []string{"5432/tcp"},
        },
        Started: true,
    },
)
```

## 5. Linting and Code Quality
- Use [golangci-lint](https://golangci-lint.run/) for linting the codebase.
- Code must pass 100% of the enabled linters.
- Integrate linting into CI pipelines.

```bash
golangci-lint run ./...
```

## 6. Configuration Management
- Use [viper](https://github.com/spf13/viper) for centralized and type-safe configuration loading.
- Support loading from .env, environment variables, or files.