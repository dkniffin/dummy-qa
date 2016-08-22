# Cucumber - QA Automation Template

This repo provides an example setup for Cucumber and QA Automation. You can also go view all of this content here {insert URL to SB wiki article}. Please clone this repo to begin your automation setup process.

1. Clone the repo
1. Open the project in editor of choice
1. `bundle install`
1. Search for “TODO” - in console type - `grep -r TODO .`
1. Fill in content for TODO sections
1. Change repos origin - `git remote set-url origin <github url>`
1. `Git push`

## Editor Setup

Below are a few add-ons for Atom that will be beneficial when writing your tests:

- <a href="https://atom.io/packages/atom-beautify">Atom-Beautify</a>
- <a href="https://atom.io/packages/auto-detect-indentation">Auto-Detect-Indentation</a>
- <a href="https://atom.io/packages/cucumber">Cucumber</a>
- <a href="https://atom.io/packages/language-gherkin">Language-Gherkin</a>
- <a href="https://atom.io/packages/linter-rubocop">Linter-Rubocop</a>

## Folder Structure

When writing your first test, please adhere to the folder structure below for consistency (this structure is already set in the sample repo):

  - features
    - scenarios
      - admin
      - user
    - steps
      - admin
      - page_interactions
      - user
    - support
      - helpers
      - test_files

NOTE: The `page_interactions` folder has both `clicking.rb` and `viewing.rb` files for general steps that will be reused throughout your tests.

## Running Tests

Running tests is as simple as `bundle exec cucumber` or `bundle exec cucumber features/<feature_name>.feature`. Tests will either be ran against your local environment or against a QA environment as setup in the `endpoint_helper.rb` file.

## Tape Deployment

TBD

## Travis Integration

TBD

## Sauce Labs Integration

TBD
