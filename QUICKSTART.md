# Quick Start Guide - asdf-claude-code

This guide will help you get started with using the asdf-claude-code plugin.

## What is this?

This ASDF plugin allows you to install and manage Claude Code CLI using ASDF, the universal version manager. This means you can:

- Install multiple versions of Claude Code side-by-side
- Switch between versions easily
- Have different versions per project
- Manage Claude Code the same way you manage Node.js, Python, Ruby, etc.

## Prerequisites Check

Before you start, make sure you have:

### 1. ASDF Installed

```bash
asdf --version
```

If not installed, visit: https://asdf-vm.com/guide/getting-started.html

### 2. Node.js and npm

Option A - Via ASDF (Recommended):
```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
```

Option B - Check existing installation:
```bash
node --version
npm --version
```

## Installation

### Step 1: Add the Plugin

If this plugin is published on GitHub:
```bash
asdf plugin add claude-code https://github.com/jtanium/asdf-claude-code.git
```

Or if you're testing locally:
```bash
cd /Users/jtanium/Projects/asdf-claude-code
asdf plugin add claude-code $(pwd)
```

### Step 2: List Available Versions

```bash
asdf list all claude-code
```

This will show all available versions from npm.

### Step 3: Install a Version

```bash
asdf install claude-code latest
```

Or install a specific version:
```bash
asdf install claude-code 0.1.0
```

### Step 4: Set the Version

Set globally (all directories):
```bash
asdf global claude-code latest
```

Or set locally (current directory only):
```bash
asdf local claude-code latest
```

This creates a `.tool-versions` file in your current directory.

### Step 5: Verify Installation

```bash
which claude-code
claude-code --version
```

**If you get "command not found"**, run:

```bash
asdf reshim claude-code
```

This refreshes ASDF's shims and should make the command available.

## Usage Examples

### Check Current Version

```bash
asdf current claude-code
```

### List Installed Versions

```bash
asdf list claude-code
```

### Switch Versions

```bash
asdf global claude-code 0.1.0
```

### Uninstall a Version

```bash
asdf uninstall claude-code 0.1.0
```

### Update to Latest Version

```bash
asdf install claude-code latest
asdf global claude-code latest
```

## Project-Specific Versions

You can use different versions of Claude Code in different projects:

```bash
# In project A
cd ~/projects/project-a
asdf local claude-code 0.1.0

# In project B
cd ~/projects/project-b
asdf local claude-code 0.2.0
```

Now each project will automatically use its specified version!

## Troubleshooting

### Plugin not found

Make sure you've added the plugin:
```bash
asdf plugin list
```

Should show `claude-code`.

### npm not found

Install Node.js via ASDF:
```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
```

### Command not found after installation

Run reshim:
```bash
asdf reshim claude-code
```

### Remove and reinstall plugin

```bash
asdf plugin remove claude-code
asdf plugin add claude-code https://github.com/jtanium/asdf-claude-code.git
```

## Getting Help

- Plugin issues: https://github.com/jtanium/asdf-claude-code/issues
- ASDF documentation: https://asdf-vm.com/
- Claude Code documentation: https://www.anthropic.com/claude

## What's Next?

Now that you have Claude Code installed via ASDF, you can:

1. Use `claude-code` command in your terminal
2. Create project-specific versions with `.tool-versions`
3. Share your setup with teammates (they just need the `.tool-versions` file)
4. Easily update or rollback versions as needed

Happy coding with Claude! 🚀

