# Contributing to asdf-claude-code

Thank you for considering contributing to asdf-claude-code! This document provides guidelines and information for contributors.

## Development Setup

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR_USERNAME/asdf-claude-code.git
cd asdf-claude-code
```

2. **Install ASDF** (if not already installed)

Follow the [ASDF installation guide](https://asdf-vm.com/guide/getting-started.html).

3. **Install Node.js via ASDF** (required for testing)

```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
```

## Testing Your Changes

### Run the Test Script

```bash
./test.sh
```

This validates:
- Script files exist and are executable
- Bash syntax is correct
- Required dependencies are available
- The list-all script can fetch versions

### Test the Plugin Locally

1. **Add the plugin locally**

```bash
asdf plugin add claude-code /path/to/your/asdf-claude-code
```

2. **List available versions**

```bash
asdf list all claude-code
```

3. **Install a version**

```bash
asdf install claude-code latest
```

4. **Set and test the version**

```bash
asdf global claude-code latest
claude-code --version
```

### Remove the Plugin (for clean testing)

```bash
asdf plugin remove claude-code
rm -rf ~/.asdf/installs/claude-code
```

## Plugin Structure

```
asdf-claude-code/
├── bin/
│   ├── install      # Installation script
│   └── list-all     # Version listing script
├── LICENSE
├── README.md
├── CONTRIBUTING.md
└── test.sh          # Validation script
```

### Required Scripts

ASDF plugins must implement specific scripts in the `bin/` directory:

#### `bin/list-all`

- **Purpose**: List all available versions of the tool
- **Output**: Space-separated list of versions
- **Environment**: No special environment variables

#### `bin/install`

- **Purpose**: Install a specific version
- **Environment Variables**:
  - `ASDF_INSTALL_TYPE`: Always "version" for this plugin
  - `ASDF_INSTALL_VERSION`: The version to install (e.g., "1.0.0")
  - `ASDF_INSTALL_PATH`: Where to install (e.g., `~/.asdf/installs/claude-code/1.0.0`)
- **Expected**: Create a `bin/` directory with executables in `$ASDF_INSTALL_PATH/bin/`

## Making Changes

### Before You Start

1. Check existing issues and pull requests
2. Create an issue to discuss major changes
3. Keep changes focused and atomic

### Coding Guidelines

1. **Use bash best practices**
   - Use `set -euo pipefail` at the start of scripts
   - Quote variables
   - Use meaningful variable names
   - Add comments for complex logic

2. **Error handling**
   - Provide clear error messages
   - Use the `fail()` function for errors
   - Direct errors to stderr (`>&2`)

3. **Compatibility**
   - Ensure scripts work on macOS and Linux
   - Use portable POSIX-compliant commands when possible
   - Test on different shells if possible

4. **User experience**
   - Provide helpful error messages
   - Show progress for long operations
   - Use emoji sparingly but effectively (✓, ❌, ⚠️)

### Testing Checklist

Before submitting a PR, ensure:

- [ ] `./test.sh` passes
- [ ] Scripts have no bash syntax errors: `bash -n bin/install && bash -n bin/list-all`
- [ ] Plugin can be added locally: `asdf plugin add claude-code ./`
- [ ] Version listing works: `asdf list all claude-code`
- [ ] Installation works: `asdf install claude-code latest`
- [ ] Installed tool is executable: `claude-code --version`
- [ ] README.md is updated if needed
- [ ] Commit messages are clear and descriptive

## Submitting Changes

1. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
```

2. **Make your changes and commit**

```bash
git add .
git commit -m "Description of your changes"
```

3. **Push to your fork**

```bash
git push origin feature/your-feature-name
```

4. **Create a Pull Request**

- Provide a clear description of the changes
- Reference any related issues
- Include testing steps

## Reporting Issues

When reporting issues, please include:

- Your operating system and version
- ASDF version: `asdf --version`
- Node.js/npm version: `node --version && npm --version`
- Steps to reproduce the issue
- Expected vs actual behavior
- Any error messages (full output)

## Questions?

Feel free to open an issue for questions or clarifications.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

