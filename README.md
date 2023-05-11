# calens

[![Current Tag](https://img.shields.io/github/v/tag/actionhippie/calens?sort=semver)](https://github.com/actionhippie/calens) [![Docker Build](https://github.com/actionhippie/calens/workflows/docker/badge.svg)](https://github.com/actionhippie/calens/actions/workflows/docker.yml)

[GitHub Action](https://github.com/features/actions) to generate changelogs based on [Calens](https://github.com/restic/calens).

## Usage

```yml
name: Example

on:
  - push
  - pull_request

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - uses: actionhippie/calens@v1
        with:
          target: CHANGELOG.md
```

## Inputs

### `source`

Path to changelog definitions, defaults to `changelog`

### `target`

Path to file where changelog gets written to

### `template`

Path to changelog template file, defaults to `changelog/CHANGELOG.tmpl`

### `version`

Generate changelog for defined version only

### `print`

Print generated changelog directly, defaults to `true`

## Outputs

### `generated`

Generated changelog content

## Security

If you find a security issue please contact thomas@webhippie.de first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

* [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2022 Thomas Boerger <thomas@webhippie.de>
```
