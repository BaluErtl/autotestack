# DDEV Configuration for autotestack

This directory contains DDEV configuration for the autotestack Behat testing project.

## What's Included

- **PHP 8.4** environment with Composer 2
- **Selenium with Chrome** for browser automation (accessible at `http://selenium:4444/wd/hub`)
- **MariaDB 10.11** database (included but not required for basic tests)
- Custom `ddev behat` command for running tests

## Getting Started

### Prerequisites
- [DDEV installed](https://ddev.readthedocs.io/en/stable/#installation) on your system

### Start the Project

```bash
# Start DDEV
ddev start

# Dependencies are installed automatically via post-start hook
# Or manually run:
ddev composer install
```

### Running Tests

```bash
# Run all Behat tests (uses behat.ddev.yml configuration)
ddev behat

# Run specific feature file
ddev behat features/search.feature

# Run with tags
ddev behat --tags=@tagname
```

### Accessing Services

- **Web**: https://autotestack.ddev.site
- **Selenium Grid UI**: https://autotestack.ddev.site:7900 (password: `secret`)
- **Selenium Hub**: http://selenium:4444/wd/hub (from within containers)

## Configuration Files

- **config.yaml**: Main DDEV configuration
- **docker-compose.selenium.yaml**: Selenium standalone Chrome service
- **commands/web/behat**: Custom command to run Behat with DDEV config
- **../behat.ddev.yml**: Behat configuration for DDEV environment

## Differences from Local Setup

The main difference is the Selenium WebDriver host:
- **Local**: `http://localhost:4444/wd/hub`
- **DDEV**: `http://selenium:4444/wd/hub`

This is handled automatically by using `behat.ddev.yml` instead of `behat.yml`.

## Troubleshooting

### Selenium not responding
```bash
ddev restart
ddev logs -s selenium
```

### Tests failing
- Check Selenium status: `ddev exec curl http://selenium:4444/wd/hub/status`
- View Selenium logs: `ddev logs -s selenium`
- Access VNC viewer at port 7900 to watch tests run in real-time
