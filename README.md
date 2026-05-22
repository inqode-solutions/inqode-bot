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

## Working Environment

The bot operates within a containerized environment based on the [default Docker image](https://gitlab.com/inqode/docker-images/-/blob/main/default.dockerfile?ref_type=heads). This environment includes support for the following tools and languages:

| Category | Tools |
|---|---|
| Programming languages | Node.js, Python, Ruby, Go, Rust, Java (OpenJDK 17) |
| Package managers | npm, yarn, pnpm (Node.js), bundler (Ruby), pip (Python), maven, gradle (Java) |
| Container & Kubernetes tools | helm, kubectl, kustomize, umoci, skopeo |
| Utilities | git, jq, bash |

*Note: This list is not exhaustive.*

This setup enables the bot to handle a wide variety of codebases and development tasks.

> **Note:** The Docker image is open for contributions. We welcome pull requests to the [docker-images project](https://gitlab.com/inqode/docker-images) to suggest improvements or additional tools.

## Usage Instructions

### Code Review

Assign @inqode-bot as a Reviewer to any Merge Request (GitLab) or Pull Request (GitHub). @inqode-bot will analyze the changes and post feedback directly onto the request.

### Code Contribution

There are two ways to let @inqode-bot contribute code directly:

Resolving an issue: Assign an issue to @inqode-bot. It will then create a Merge Request (GitLab) or Pull Request (GitHub) to resolve the issue.

Taking over an existing pull request: Assign @inqode-bot as the Assignee to an existing Merge Request or Pull Request. It will then start fixing code issues, such as a failing pipeline, on its own.

You can comment on the changes to request modifications. After reviewing the updates, reassign @inqode-bot to the same MR or PR to give it another attempt with your feedback in context.

### How @inqode-bot Handles Comments

When you leave comments on code in a Pull Request or Merge Request, @inqode-bot sees these comments when it reviews the changes. Even if you resolve (dismiss) comments after discussing them, the bot still retains the information about those comments in subsequent runs.

This means the bot can reference resolved comments when making updates or explaining its reasoning. You do not need to re-explain issues that have already been resolved as the bot remembers them. If you want to remove a comment from the bot's context, you will need to delete it entirely.

This behavior allows the bot to maintain context throughout a discussion, making it easier to track the evolution of feedback and changes over multiple review cycles.

## Project Setup for Better Results

The quality of code changes the bot produces is significantly improved when your project has a test suite configured correctly. This gives the bot something concrete to validate its changes against, and allows it to fix its own mistakes before committing code.

### Essential Setup

Make sure your project has a way to run tests automatically. This is the most important setup step.

For Rust projects, run `cargo test` or `cargo test --all-targets`. For JavaScript or TypeScript projects, run `npm test`, `yarn test`, or `pnpm test`. For Python projects, run `pytest`, `unittest`, or your project's test runner. For Go projects, run `go test ./...`. For Java or Kotlin projects, run `mvn test` or `gradle test`. Any project should have a way to verify code correctness automatically.

When the bot proposes changes, it can run the test suite to verify the changes do not break existing functionality. If tests exist, the bot can even iterate on fixes until all tests pass. The bot is able to repair broken pipelines on its own.

### Add Linting and Code Formatting

Configure linting and formatting tools to improve code quality. For Rust, use `cargo clippy` and `cargo fmt`. For JavaScript or TypeScript, use `eslint` and `prettier`. For Python, use `flake8`, `pylint`, and `black`. For Go, use `golangci-lint` and `go fmt`.

Having linting in your project helps the bot produce cleaner code. The bot can use linting output to fix style issues and improve code quality.

### Provide Clear Issue Descriptions and Configuration

When assigning issues to the bot, include a clear description of what needs to be done, mention any relevant constraints, document specific edge cases, and link to relevant documentation or related issues.

You can customize the bot's behavior by adding an `inqode-bot.yaml` file to your repository root. This file allows you to define project-specific instructions, set coding conventions the bot should follow, exclude certain directories or patterns, and configure which tools the bot is allowed to use.

While the bot can still help with code review, refactoring, and documentation, projects with a correctly configured test suite get the most benefit from bot-assisted development, as the bot can verify and fix its own work.

## Advanced Topics

- TODO: How can I utilize `inqode-bot.yaml` to configure @inqode-bot?
