# inqode-bot

inqode-bot is an AI-powered assistant that integrates into your development workflow on GitHub and GitLab. It helps with code review, code contribution, and automated fixes, acting as an active team member. The bot can review your merge requests and pull requests, contribute code to resolve issues, and fix problems like failing pipelines — all by being assigned to the relevant items.

inqode-bot is designed to be incorporated into your projects like any other active contributor. Simply interact with it through standard GitHub/GitLab workflows, and it will respond accordingly.

The bot is limited to the capabilities of the underlying LLM and may need a little bit more context than an experienced human contributor, especially when dealing with complex or domain-specific codebases. Feel free to provide additional details in comments or issue descriptions to help it produce better results.

We highly recommend to always have a human in control of the decision of what code should be part of the code base. The bot is meant to be used as an assistant, not as an autonomous decision maker.

## Setup

Invite the user [@inqode-bot on GitHub](https://github.com/inqode-bot) or [@inqode-bot on GitLab](https://gitlab.com/inqode-bot) to your repository and wait for confirmation that it has been successfully added.

On GitHub, it is recommended to give the bot write access if it should contribute code. On GitLab, it is recommended to give the bot a Developer role.

## Usage Instructions

### Code Review

Assign @inqode-bot as a Reviewer to any Merge Request (GitLab) or Pull Request (GitHub). After some time, the bot will post feedback directly onto the request.

### Code Contribution

There are two ways to let the inqode-bot contribute code directly.

To resolve an issue, assign an issue to the user @inqode-bot. The bot will then create a Merge Request (GitLab) or Pull Request (GitHub) itself to resolve the issue.

To take over a pull request, assign @inqode-bot as the Assignee to an existing Merge Request or Pull Request. The bot will then start fixing code issues (e.g. a failing pipeline) by itself.

You can comment on the changes to request modifications and reassign the @inqode-bot to the same MR/PR to give it another go with your feedback in context.

## Advanced Topics

- What do the emojis mean, that the bot leaves on Merge Requests / Pull Requests?
- How can I utilize `inqode-bot.yaml` to configure the inqode-bot?
