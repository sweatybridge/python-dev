#!/bin/bash
set -euo pipefail

shellcheck test.sh
isort --diff --check-only .
black --check .
flake8
mypy .

export PYTHONPATH=.
pytest -svl --log-level=DEBUG --color=yes --cov-fail-under=90 --cov-report=xml
# --cov={mod1,mod2} tests
