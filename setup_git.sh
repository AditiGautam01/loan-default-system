#!/bin/bash
# Run once: bash setup_git.sh YOUR_GITHUB_USERNAME
set -euo pipefail

USERNAME=${1:-"YOUR_USERNAME"}
REPO="loan-default-system"

echo "Setting up: $USERNAME/$REPO"

git init
git branch -M main

git add README.md pyproject.toml Dockerfile docker-compose.yml \
        .gitignore .env.example .github/ src/ tests/

git commit -m "chore: initial project structure

- src/loan_default package scaffold (config, data, features, models, api)
- pyproject.toml with full dependency list
- Dockerfile + docker-compose for FastAPI container
- GitHub Actions CI: lint + test + docker build
- .gitignore covering secrets, data, model artefacts
- README with architecture diagram, results table, quick start"

git remote add origin "https://github.com/$USERNAME/$REPO.git"

echo ""
echo "Done! Next:"
echo "  1. Create repo at https://github.com/new (name: $REPO, Public, no README)"
echo "  2. git push -u origin main"
echo "  3. Add ANTHROPIC_API_KEY in: Repo → Settings → Secrets → Actions"
