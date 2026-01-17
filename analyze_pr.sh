#!/bin/bash
# Script: analyze_pr.sh
# Usage: ./analyze_pr.sh <base_branch>
# Requires: copilot-cli installed and GITHUB_COPILOT_TOKEN set

BASE_BRANCH=${1:-main}
git fetch origin $BASE_BRANCH
git diff origin/$BASE_BRANCH...HEAD > pr.diff
copilot suggest --diff pr.diff --output pr_review.md
cat pr_review.md
