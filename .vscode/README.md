# VS Code Configuration

This directory contains VS Code configuration for the autotestack project.

## Files

### `settings.json`
Project-specific settings including:
- PHP configuration (executable path, formatting)
- File associations for `.feature` (Gherkin), `.yml` (YAML)
- Editor settings (tabs, formatting)
- Exclude patterns for search and file explorer
- Composer integration

### `extensions.json`
Recommended extensions for this project:
- **PHP Intelephense** - PHP language support
- **PHP Debug** - Xdebug integration
- **Composer** - Composer command integration
- **Cucumber** - Gherkin/Behat syntax highlighting
- **PHPUnit** - PHPUnit test runner
- **GitLens** - Enhanced Git integration
- **YAML** - YAML language support
- **Docker** - Docker/DDEV support

When you open this project in VS Code, you'll be prompted to install these extensions.

### `tasks.json`
Pre-configured tasks accessible via `Terminal > Run Task`:
- **Behat: Run All Tests** - Execute all Behat tests (Cmd+Shift+B default)
- **Behat: Run Current Feature** - Run the currently open feature file
- **DDEV: Start** - Start DDEV environment
- **DDEV: Run Behat Tests** - Run tests inside DDEV
- **Composer: Install** - Install dependencies
- **Composer: Update** - Update dependencies
- **Composer: Normalize** - Normalize composer.json
- **PHPUnit: Run All Tests** - Execute PHPUnit tests

### `launch.json`
Debug configurations accessible via `Run and Debug` panel:
- **Listen for Xdebug** - Listen for Xdebug connections (port 9003)
- **Launch currently open script** - Debug the current PHP file
- **Debug Behat Tests** - Debug Behat test execution

## Workspace File

The `autotestack.code-workspace` file in the project root is configured with:
- Workspace path: `/Users/baluertl/Repos/autotestack`
- All settings, extensions, tasks, and launch configs embedded
- Can be opened directly: `code autotestack.code-workspace`

## Usage

### Opening the Project

**Option 1: Open folder**
```bash
cd /Users/baluertl/Repos/autotestack
code .
```

**Option 2: Open workspace file (Recommended)**
```bash
code /Users/baluertl/Repos/autotestack/autotestack.code-workspace
```

### Running Tests

1. Press `Cmd+Shift+B` (macOS) or `Ctrl+Shift+B` (Linux/Windows)
2. Select "Behat: Run All Tests"

Or via Command Palette (`Cmd+Shift+P`):
1. Type "Tasks: Run Task"
2. Select desired task

### Debugging

1. Set breakpoints in PHP files (click left gutter)
2. Press `F5` or go to Run and Debug panel
3. Select "Debug Behat Tests" configuration
4. Click Start Debugging

## Customization

These settings are shared across the team. For personal preferences:
1. Use VS Code's User Settings (`Cmd+,`)
2. Or create `.vscode/settings.local.json` (add to `.gitignore`)
