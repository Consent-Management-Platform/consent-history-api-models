# Development

## Building the project

### First-time set-up
To build the project for the first time, run

```sh
./gradlew build
```

and validate that it completes successfully.

After a successful build
* Smithy API models should be generated at `./build/smithyprojections/consent-history-api-models/source/model/model.json`.
* OpenAPI API models should be generated at `./build/smithyprojections/consent-history-api-models/source/openapi/ConsentHistoryApi.openapi.json`.

### Subsequent builds
In order to clean up stale build artifacts and rebuild the API models based on your latest changes, run

```sh
./gradlew clean build
```

If you do not clean before building, your local environment may continue to use stale, cached versions of the API models in builds.

## Locally generating API documentation

### First-time set-up
Install jq by following instructions at https://jqlang.github.io/jq/download/.  This is used to parse JSON input.

Install yq by following instructions at https://github.com/mikefarah/yq.  This is a utility to convert JSON to YAML, which we'll use to convert Smithy's generated OpenAPI JSON spec to YAML, the format required by ReDoc.

Install the GitHub CLI, gh, by following instructions at https://github.com/cli/cli#installation.  Once installed, set up your credentials via `gh auth login`.

Install @redocly/cli by running `npm install -g @redocly/cli`.  This will be used to generate the ReDoc API documentation.

### Running script to generate API docs
Run `./scripts/generate-local-api-docs.sh` to locally generate ReDoc API documentation at `build/docs/docs.html`.

## Publishing release artifacts to GitHub Packages
Follow [GitHub's "Managing your personal access tokens" guide](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) to set up a personal access token that has write permissions to your GitHub Packages.

Set up a `GITHUB_USERNAME` environment variable matching your GitHub username.

Set up a `GITHUB_TOKEN` environment variable matching your GitHub personal access token.

Increment the package's Maven package version in `build.gradle.kts`, and update the service version date in `/models/main.smithy` to the current date.

Run `./gradlew clean build` to ensure build artifacts are based on the latest Smithy models.

Run `./gradlew publish` to publish the new GitHub Package version.

Ref: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-gradle-registry#authenticating-to-github-packages
