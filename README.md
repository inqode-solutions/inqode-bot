# inqode-bot

inqode-bot is an AI-powered assistant that integrates into your development workflow on GitHub and GitLab. It helps with code review, code contribution, and automated fixes, acting as an active team member. @inqode-bot can review your merge requests and pull requests, contribute code to resolve issues, and fix problems like failing pipelines. It can be assigned to the relevant items to get started.

inqode-bot is designed to be incorporated into your projects like any other active contributor. Simply interact with it through standard GitHub or GitLab workflows, and it will respond accordingly.

> **Note:** @inqode-bot is limited to the capabilities of the underlying LLM and may need a little bit more context than an experienced human contributor, especially when dealing with complex or domain-specific codebases. Feel free to provide additional details in comments or issue descriptions to help produce better results.

We highly recommend to always have a human in control of the decision of what code should be part of the code base. @inqode-bot is meant to be used as an assistant, not as an autonomous decision maker.

## Setup

Invite @inqode-bot to your repository:

- [Invite @inqode-bot on GitHub](https://github.com/inqode-bot)
- [Invite @inqode-bot on GitLab](https://gitlab.com/inqode-bot)

Wait for confirmation that it has been successfully added.

On GitHub, it is recommended to give @inqode-bot write access if it should contribute code. On GitLab, it is recommended to give @inqode-bot a Developer role.

## Usage Instructions

### Code Review

Assign @inqode-bot as a Reviewer to any Merge Request (GitLab) or Pull Request (GitHub). @inqode-bot will analyze the changes and post feedback directly onto the request.

### Code Contribution

There are two ways to let @inqode-bot contribute code directly:

Resolving an issue: Assign an issue to @inqode-bot. It will then create a Merge Request (GitLab) or Pull Request (GitHub) to resolve the issue.

Taking over an existing pull request: Assign @inqode-bot as the Assignee to an existing Merge Request or Pull Request. It will then start fixing code issues, such as a failing pipeline, on its own.

You can comment on the changes to request modifications. After reviewing the updates, reassign @inqode-bot to the same MR or PR to give it another attempt with your feedback in context.

## Project Setup for Better Results

The quality of code changes the bot produces is significantly improved when your project has automated tests and linting in place. This gives the bot something concrete to validate its changes against.

### Essential Setup Steps

#### 1. Ensure Automated Tests Run in CI

Make sure your repository has a CI pipeline that runs tests:

- **Rust projects**: Run `cargo test` or `cargo test --all-targets`
- **JavaScript/TypeScript projects**: Run `npm test`, `yarn test`, or `pnpm test`
- **Python projects**: Run `pytest`, `unittest`, or your project's test runner
- **Go projects**: Run `go test ./...`
- **Java/Kotlin projects**: Run `mvn test` or `gradle test`
- **Any project**: Ensure there's a way to verify code correctness automatically

> **Why this matters**: When the bot proposes changes, it can run the test suite to verify the changes don't break existing functionality. If tests exist, the bot can even iterate on fixes until all tests pass.

#### 2. Add Linting and Code Formatting

Configure linting and formatting tools:

- **Rust**: `cargo clippy`, `cargo fmt`
- **JavaScript/TypeScript**: `eslint`, `prettier`
- **Python**: `flake8`, `pylint`, `black`
- **Go**: `golangci-lint`, `go fmt`

Ensure these are run in your CI pipeline. The bot can use linting output to fix style issues and improve code quality.

#### 3. Keep CI Green

Before assigning tasks to the bot, ensure your CI pipeline is currently passing. A green CI gives the bot a clean baseline to work from. If the CI is failing, consider fixing the root cause first, or provide the bot with context about which failures are expected.

#### 4. Provide Clear Issue Descriptions

When assigning issues to the bot:

- Include a clear description of what needs to be done
- Mention any relevant constraints (e.g., "must not change the public API")
- If there are specific edge cases, document them
- Link to relevant documentation or related issues

#### 5. Use `inqode-bot.yaml` for Configuration

You can customize the bot's behavior by adding an `inqode-bot.yaml` file to your repository root. This file allows you to:

- Define project-specific instructions
- Set coding conventions the bot should follow
- Exclude certain directories or patterns
- Configure which tools the bot is allowed to use

See the [inqode-bot configuration reference](https://docs.inqode.bot/configuration) for details.

### Recommended CI Configuration

Here are examples of minimal CI configurations that work well with the bot:

**GitHub Actions (GitHub)**
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: |
          # Replace with your project's test command
          npm test  # or cargo test, pytest, etc.
      - name: Run linter
        run: |
          # Replace with your project's lint command
          npm run lint  # or cargo clippy, flake8, etc.
```

**GitLab CI (.gitlab-ci.yml)**
```yaml
test:
  stage: test
  script:
    - |
      # Replace with your project's test command
      npm test  # or cargo test, pytest, etc.
  lint:
  stage: test
  script:
    - |
      # Replace with your project's lint command
      npm run lint  # or cargo clippy, flake8, etc.
```

### What Happens Without Tests?

The bot can still work on projects without automated tests, but:

- Changes are harder to verify as correct
- The bot may need more explicit guidance on what's expected
- It's harder for the bot to iterate and fix issues autonomously
- Human review becomes even more critical

While the bot can still help with code review, refactoring, and documentation, projects with automated tests get the most benefit from bot-assisted development.
