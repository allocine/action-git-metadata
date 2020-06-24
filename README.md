# Git metadata docker action

Allows you to define env variables needed for build/deploy in order to harmonize with the following gitlab variables:

- CI_COMMIT_BRANCH
- CI_COMMIT_REF_NAME
- CI_COMMIT_REF_SLUG
- CI_COMMIT_SHA
- CI_COMMIT_TAG

See : https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

## Example usage

```yaml
    - uses: actions/checkout@v2
      with:
        repository: allocine/action-git-metadata
        path: ./.github/action-git-metadata
    - name: Hello world action step
      uses: ./.github/action-git-metadata
      env:
        GITHUB_COMMIT_PR_SHA: ${{ github.event.pull_request.head.sha }}

```
