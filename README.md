# @inqode-bot

@inqode-bot is an AI-powered assistant that integrates into your development workflow on GitHub and GitLab. It helps with code review, code contribution, and automated fixes, acting as an active team member. @inqode-bot can review merge requests and pull requests, contribute code to resolve issues, and fix problems like failing pipelines. It can be assigned to the relevant items to get started.

@inqode-bot is designed to be incorporated into your projects like any other active contributor. Simply interact with it through standard GitHub or GitLab workflows, and it will respond accordingly.

Note: @inqode-bot is limited to the capabilities of the underlying LLM and may need a little bit more context than an experienced human contributor, especially when dealing with complex or domain-specific codebases. Feel free to provide additional details in comments or issue descriptions to help produce better results.

We recommend always having a human in control of the decision about what code should be part of the codebase. @inqode-bot is meant to be used as an assistant, not as an autonomous decision maker.

## Setup

Invite @inqode-bot to your repository:

- [Invite @inqode-bot on GitHub](https://github.com/inqode-bot)
- [Invite @inqode-bot on GitLab](https://gitlab.com/inqode-bot)

Wait for confirmation that it has been successfully added.

On GitHub, it is recommended to give @inqode-bot write access if it should contribute code. On GitLab, it is recommended to give @inqode-bot a Developer role.

## Working Environment

@inqode-bot operates within a containerized environment based on the [default Docker image](https://gitlab.com/inqode/docker-images/-/blob/main/default.dockerfile?ref_type=heads). This environment includes support for the following tools and languages:

| Category | Tools |
|---|---|
| Programming languages | Node.js, Python, Ruby, Go, Rust, Java (OpenJDK 17) |
| Package managers | npm, yarn, pnpm (Node.js), bundler (Ruby), pip (Python), maven, gradle (Java), mise |
| Container & Kubernetes tools | helm, kubectl, kustomize, umoci, skopeo |
| Utilities | git, jq, bash |

This list is not exhaustive.

@inqode-bot can handle a wide variety of codebases and development tasks.

Note: The Docker image is open for contributions. We welcome pull requests to the [docker-images project](https://gitlab.com/inqode/docker-images) to suggest improvements or additional tools.

## Usage Instructions

### Code Review

Assign @inqode-bot as a Reviewer to any Merge Request (GitLab) or Pull Request (GitHub). @inqode-bot will analyze the changes and post feedback directly onto the request.

### Code Contribution

There are two ways to let @inqode-bot contribute code directly:

Resolving an issue: Assign an issue to @inqode-bot. It will then create a Merge Request (GitLab) or Pull Request (GitHub) to resolve the issue.

Taking over an existing pull request: Assign @inqode-bot as the Assignee to an existing Merge Request or Pull Request. It will then start fixing code issues, such as a failing pipeline, on its own.

You can comment on the changes to request modifications. After reviewing the updates, reassign @inqode-bot to the same MR or PR to give it another attempt with your feedback in context.

### How @inqode-bot Handles Comments

When you leave comments on code in a Pull Request or Merge Request, @inqode-bot sees these comments when it reviews the changes. Even if you resolve (dismiss) comments after discussing them, @inqode-bot still retains the information about those comments in subsequent runs.

@inqode-bot can reference resolved comments when making updates or explaining its reasoning. You do not need to re-explain issues that have already been resolved. @inqode-bot remembers them. If you want to remove a comment from the context, you must delete it entirely.

This behavior allows @inqode-bot to maintain context throughout a discussion, making it easier to track the evolution of feedback and changes over multiple review cycles.

## Advanced Topics

### Improving Output with Testing and Linting

The quality of code produced by @inqode-bot is significantly higher when your project has testing and linting configured. @inqode-bot uses these tools to verify its changes before committing, which helps catch issues that the LLM might miss.

To get the best results, set up the following in your project:

Testing Framework: Configure a test runner that works with your language and framework. @inqode-bot will run tests to verify that changes do not break existing functionality.

Linting Tool: Configure a linter for your codebase. @inqode-bot will run linting checks to identify style issues, potential bugs, and code quality problems.

CI Pipeline: Ensure your tests and linting are part of your CI pipeline. This provides @inqode-bot with the same validation that runs on merge.

If your project already has tests and linting, @inqode-bot can use these tools to self-validate its changes. This results in higher quality code submissions that are more likely to pass review on the first attempt.

### Fine-Tuning with `inqode-bot.yaml`

You can customize the behavior of @inqode-bot by creating a configuration file called `inqode-bot.yaml` in the root of your project. This file allows you to fine-tune how @inqode-bot responds to different tasks by providing custom prompts and instructions.

#### Configuration File

Drop a file called `inqode-bot.yaml` into the root directory of your project with the following structure:

```yaml
ignore: []
prompts:
  code_review: |-
    - Do not consider code formatting as part of the review process.
  work_on_merge_request: |-
    - run `cargo test` and fix failures
    - run `cargo fmt` to format the code
    - run `cargo clippy` to check for linting issues
tools:
  cargo_build: false
```

#### Configuration Options

**ignore**

A list of files and directories to ignore during operations. @inqode-bot will skip these paths when scanning the repository. Use relative paths from the project root.

```yaml
ignore:
  - node_modules
  - vendor
  - dist
  - .git
  - build
```

**ssh_user**

The SSH user used for repository access. Set this if @inqode-bot needs to access private repositories over SSH.

```yaml
ssh_user: my-ssh-user
```

**prompts**

Custom prompt configurations to modify how @inqode-bot behaves during different operations.

`code_review`

Custom instructions appended to the code review prompt. Use this to define review guidelines specific to your project.

```yaml
prompts:
  code_review: |-
    - Ensure all functions have proper error handling.
    - Check for potential security vulnerabilities.
    - Verify that all public APIs have documentation.
```

`work_on_merge_request`

Custom instructions appended to the work-on-merge-request prompt. Use this to specify tasks or constraints when @inqode-bot works on code changes.

```yaml
prompts:
  work_on_merge_request: |-
    - Run `cargo test` and fix failures.
    - Run `cargo fmt` to format the code.
    - Run `cargo clippy` to check for linting issues.
```

**tools**

Tool configurations that control which build tools @inqode-bot uses during operations.

`cargo_build`

A boolean value that determines whether @inqode-bot runs `cargo build` during operations. When enabled, @inqode-bot will compile the project to verify that changes are valid. The default value is `false`.

```yaml
tools:
  cargo_build: true
```

## Privacy

@inqode-bot pulls your code from a Kubernetes cluster hosted on dedicated servers in Germany. The code is processed by a self-hosted LLM running on an on-premises server, also located in Germany.

Your code is only stored while @inqode-bot is actively working on it. We do not use your code for training or any other purposes. We do not share your code with any third party.
