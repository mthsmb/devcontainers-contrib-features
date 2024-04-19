
# Bun Installation Feature for DevContainer

This feature provides a robust way to install and manage Bun, a fast all-in-one JavaScript runtime, using the `asdf` version manager. This allows you to specify and switch between different versions of Bun easily.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/bun-asdf:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
