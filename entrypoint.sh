#!/bin/bash -l

[[ $GITHUB_REF =~ "refs/heads/" ]] && _GITHUB_BRANCH=$(echo $GITHUB_REF | cut -d/ -f3) || :
[[ $GITHUB_REF =~ "refs/tags/" ]] && _GITHUB_TAG=$(echo $GITHUB_REF | cut -d/ -f3) || :
echo ::set-env name=CI_COMMIT_REF_NAME::${GITHUB_HEAD_REF:-${_GITHUB_BRANCH:-$_GITHUB_TAG}}
echo ::set-env name=CI_COMMIT_BRANCH::${GITHUB_HEAD_REF:-$_GITHUB_BRANCH}
echo ::set-env name=CI_COMMIT_TAG::${_GITHUB_TAG}
echo ::set-env name=CI_COMMIT_SHA::${GITHUB_COMMIT_PR_SHA:-$GITHUB_SHA}
