# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**autotestack** is a proven working software stack for running automated browser tests using Behat. The test execution flow follows: Gherkin → Behat → Mink → Selenium → WebDriver → Facebook's PHP-binding → ChromeDriver → Google Chrome.

This is a PHP-based project configured to run browser automation tests, with a sample test suite that validates Wikipedia search functionality.

## Development Setup

### Prerequisites
- PHP (with Composer)
- Selenium Server running on `localhost:4444`
- ChromeDriver
- Google Chrome browser

### Installation
```bash
composer install
```

**Note**: Post-install scripts automatically patch `vendor/peridot-php/webdriver-manager/src/Versions.php` to update Selenium and ChromeDriver version numbers. This is required for compatibility.

## Running Tests

### Run all Behat tests
```bash
bin/behat
```

### Run specific feature file
```bash
bin/behat features/search.feature
```

### Run with specific tags (if defined)
```bash
bin/behat --tags=@tagname
```

## Project Structure

- **`features/`** - Gherkin feature files defining test scenarios
- **`features/bootstrap/FeatureContext.php`** - Behat step definitions and context class
- **`behat.yml`** - Behat configuration (Mink extension, Selenium connection, base URL)
- **`composer.json`** - Dependencies and post-install automation scripts
- **`bin/`** - Created by Composer; contains Behat executable

## Architecture Notes

### Test Context
`FeatureContext` extends `RawMinkContext` and implements Behat's `Context` interface. This provides access to Mink's browser automation methods (`getSession()`, `visitPath()`, etc.).

### Browser Configuration
Tests are configured to:
- Use Chrome browser via Selenium WebDriver
- Connect to Selenium at `http://localhost:4444/wd/hub`
- Use `https://en.wikipedia.org/` as base URL (configurable in `behat.yml`)

### Custom Step Definitions
Step definitions use Behat's annotation format (`@Given`, `@When`, `@Then`) and leverage:
- Mink's page interaction methods (`fillField()`, `find()`, `click()`)
- PHPSpec2-style expectations (`expect(...)->toBe(...)`) for assertions

## Modifying Tests

When adding new scenarios:
1. Write Gherkin scenarios in `features/*.feature` files
2. Run `bin/behat` to generate step definition snippets
3. Implement step definitions in `features/bootstrap/FeatureContext.php`
4. Use `$this->getSession()->getPage()` to interact with browser elements

## Testing Against Different Sites

To test a different website, update `base_url` in `behat.yml`:
```yaml
Behat\MinkExtension:
  base_url: "https://example.com/"
```
