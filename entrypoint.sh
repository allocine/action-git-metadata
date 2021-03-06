#!/bin/bash -l

ref_slug() {
  echo "$1" |
    sed 's/\(.*\)/\L\1/g' | 
    sed 's/[^abcdefghijklmnopqrstuvwxyz0-9-]/-/g' |
    sed 's/\(^[[:digit:]]*[^[:alnum:]*\|^[^[:alnum:]]*\|[^[:alnum:]]*$$\)//g' |
    cut -c1-63
}

[[ $GITHUB_REF =~ "refs/heads/" ]] && _GITHUB_BRANCH=$(echo $GITHUB_REF | cut -d/ -f3) || :
[[ $GITHUB_REF =~ "refs/tags/" ]] && _GITHUB_TAG=$(echo $GITHUB_REF | cut -d/ -f3) || :
echo "CI_COMMIT_REF_NAME=${GITHUB_HEAD_REF:-${_GITHUB_BRANCH:-$_GITHUB_TAG}}" >> $GITHUB_ENV
echo "CI_COMMIT_REF_SLUG=$(ref_slug ${GITHUB_HEAD_REF:-${_GITHUB_BRANCH:-$_GITHUB_TAG}})" >> $GITHUB_ENV
echo "CI_COMMIT_BRANCH=${GITHUB_HEAD_REF:-$_GITHUB_BRANCH}" >> $GITHUB_ENV
echo "CI_COMMIT_TAG=${_GITHUB_TAG}" >> $GITHUB_ENV
echo "CI_COMMIT_SHA=${GITHUB_COMMIT_PR_SHA:-$GITHUB_SHA}" >> $GITHUB_ENV
