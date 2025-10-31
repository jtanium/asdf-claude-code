# asdf-claude-code

[![License](https://img.shields.io/github/license/jtanium/asdf-claude-code)](LICENSE)

An [asdf](https://asdf-vm.com/) plugin for managing [Claude Code](https://www.anthropic.com/claude) CLI installations.

## About

This plugin allows you to install and manage multiple versions of Claude Code CLI using ASDF. Claude Code is Anthropic's command-line tool that provides AI-powered coding assistance directly in your terminal.

## Prerequisites

- [asdf](https://asdf-vm.com/) version manager (>= 0.8.0)
- Node.js and npm (can be managed via ASDF with asdf-nodejs)
- bash, curl, and standard UNIX utilities

### Installing Node.js via ASDF (Recommended)

If you don't have Node.js/npm installed, you can install it via ASDF:

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
```

## Installation

### Add the Plugin

```bash
asdf plugin add claude-code https://github.com/jtanium/asdf-claude-code.git
```

Or if you're developing locally:

```bash
asdf plugin add claude-code /path/to/asdf-claude-code
```

## Usage

### List Available Versions

Show all available versions of Claude Code:

```bash
asdf list all claude-code
```

### Install a Specific Version

Install a specific version:

```bash
asdf install claude-code latest
# or
asdf install claude-code 0.1.0
```

**Note:** After installation, ASDF automatically creates shims. If the `claude-code` command is not found, run:

```bash
asdf reshim claude-code
```

### Set Global Version

Set the default version to use globally:

```bash
asdf global claude-code latest
```

### Set Local Version

Set a version for the current directory (creates `.tool-versions` file):

```bash
asdf local claude-code 0.1.0
```

### Use the CLI

Once installed and configured, you can use either the `claude-code` or `claude` command:

```bash
claude-code --help
claude-code --version

# or use the 'claude' alias (useful for IntelliJ plugin compatibility)
claude --help
claude --version
```

## How It Works

This plugin:

1. **Automatically integrates with ASDF-managed Node.js/npm** - If you have Node.js installed via ASDF, the plugin will use it automatically
2. **Downloads the official package** - Installs `@anthropic-ai/claude-code` from npm
3. **Creates isolated installations** - Each version is installed in its own directory under `~/.asdf/installs/claude-code/`
4. **Provides wrapper scripts** - Creates both `claude-code` and `claude` executables that properly set up the Node.js environment
5. **IntelliJ plugin compatibility** - The `claude` symlink ensures compatibility with IDE plugins that expect the shorter command name

## Configuration

No additional configuration is needed. The plugin will:

- Detect and use ASDF-managed Node.js/npm if available
- Provide helpful error messages if dependencies are missing
- Install Claude Code in an isolated environment per version

## Troubleshooting

### "npm is required but not found"

Install Node.js and npm first. The easiest way is via ASDF:

```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
```

### "Failed to install claude-code"

1. Check your internet connection
2. Verify the version exists: `asdf list all claude-code`
3. Ensure npm can access the registry: `npm config get registry`
### "command not found: claude-code"

If you get this error after installing, it usually means ASDF needs to refresh its shims. Run:

The plugin fetches versions from the npm registry. If you see only "0.1.0" listed, the package may not be published yet. Check the [Anthropic documentation](https://www.anthropic.com/claude) for availability.

### Claude Code not in PATH

This recreates the shim that points to the installed executable. You may need to reshim if:
- You just installed a new version
- You switched versions with `asdf global` or `asdf local`
- The shims directory is out of sync

**Verify it's working:**

```bash
which claude-code
# Should show: /Users/[your-username]/.asdf/shims/claude-code

which claude
# Should show: /Users/[your-username]/.asdf/shims/claude

claude-code --version
# Should show: [version number] (Claude Code)
```

### See installed versions

```bash
# List all installed versions
asdf list claude-code

# Show current version
asdf current claude-code
```

After installation, run:

```bash
asdf reshim claude-code
```

## Development

### Testing Locally

Clone this repository and add it as a local plugin:

```bash
git clone https://github.com/jtanium/asdf-claude-code.git
asdf plugin add claude-code ./asdf-claude-code
```

### File Structure

```
.
├── LICENSE
├── README.md
└── bin/
    ├── install      # Installs a specific version
    └── list-all     # Lists all available versions
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Related Projects

- [asdf](https://asdf-vm.com/) - The extensible version manager
- [asdf-nodejs](https://github.com/asdf-vm/asdf-nodejs) - Node.js plugin for ASDF
- [Claude Code](https://www.anthropic.com/claude) - Anthropic's AI coding assistant

## Author

James Conant

## Acknowledgments

- Thanks to the ASDF community for creating an excellent version manager
- Thanks to Anthropic for developing Claude Code

