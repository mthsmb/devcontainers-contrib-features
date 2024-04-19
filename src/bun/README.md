# Bun Installation Feature for DevContainer

This feature installs Bun, a fast all-in-one JavaScript runtime, using the official GitHub releases. It ensures the latest or a specific version of Bun is installed according to the platform requirements of the user's system.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/bun:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
