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

## Advanced Topics

### Fine-Tuning @inqode-bot with `inqode-bot.yaml`

You can customize the behavior of @inqode-bot by creating a configuration file called `inqode-bot.yaml` in the root of your project. This file allows you to fine-tune how the bot responds to different tasks by providing custom prompts and instructions.

#### Configuration File

Drop a file called `inqode-bot.yaml` into the root directory of your project with the following structure:

```yaml
prompts:
  code_review: |-
    Do not consider code formatting as part of the review process.
  work_on_merge_request: |-
    Run cargo test and fix any failures. Run cargo fmt to format the code. Run cargo clippy to check for linting issues. Do not use dashes for structuring sentences. Use two sentences or the appropriate conjunction instead. Do not use bold or italic text. Do not use emojis.
```

#### Available Configuration Options

The YAML file supports the following prompt categories:

- code_review: Customize how @inqode-bot performs code reviews. Add instructions or preferences for the review process.

- work_on_merge_request: Customize how @inqode-bot works on merge requests. Add specific commands, testing requirements, or coding standards the bot should follow.

#### Example Configuration

The example above shows:
For code reviews, instructing the bot to ignore formatting concerns. For work on merge requests, specifying that the bot should run tests, format code, check for linting issues, follow specific formatting guidelines for instructions, and avoid using bold or italic text or emojis.

#### Notes

- You can add or modify the prompt instructions as needed for your project
- The YAML format must be preserved (do not change the key structure)
- Changes to `inqode-bot.yaml` take effect on the next interaction with the bot
- Each prompt accepts a list of instructions that will be included in the bot's context

