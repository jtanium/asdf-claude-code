#!/usr/bin/env bash

# Quick test script for the asdf-claude-code plugin
# This validates the plugin works locally before publishing

set -e

echo "🔍 Testing asdf-claude-code plugin..."
echo ""

# Check if scripts exist
echo "✓ Checking script files..."
if [ ! -f "bin/install" ]; then
    echo "❌ bin/install not found"
    exit 1
fi
if [ ! -f "bin/list-all" ]; then
    echo "❌ bin/list-all not found"
    exit 1
fi
echo "  - bin/install exists"
echo "  - bin/list-all exists"
echo ""

# Check if scripts are executable
echo "✓ Checking script permissions..."
if [ ! -x "bin/install" ]; then
    echo "❌ bin/install is not executable"
    exit 1
fi
if [ ! -x "bin/list-all" ]; then
    echo "❌ bin/list-all is not executable"
    exit 1
fi
echo "  - bin/install is executable"
echo "  - bin/list-all is executable"
echo ""

# Validate bash syntax
echo "✓ Validating bash syntax..."
bash -n bin/install
bash -n bin/list-all
echo "  - bin/install syntax valid"
echo "  - bin/list-all syntax valid"
echo ""

# Check for required commands
echo "✓ Checking dependencies..."
if ! command -v npm >/dev/null 2>&1; then
    echo "⚠️  npm not found (required for installation)"
    echo "   Install Node.js/npm or use: asdf plugin add nodejs && asdf install nodejs latest"
else
    echo "  - npm found: $(npm --version)"
fi

if ! command -v node >/dev/null 2>&1; then
    echo "⚠️  node not found (required for running)"
    echo "   Install Node.js or use: asdf plugin add nodejs && asdf install nodejs latest"
else
    echo "  - node found: $(node --version)"
fi
echo ""

# Try to list versions (if npm is available)
if command -v npm >/dev/null 2>&1; then
    echo "✓ Testing list-all script..."
    if versions=$(./bin/list-all 2>&1); then
        echo "  - Available versions: $versions"
    else
        echo "  - Could not fetch versions (package may not be published yet)"
        echo "  - Error: $versions"
    fi
    echo ""
fi

echo "✅ Plugin validation complete!"
echo ""
echo "To test installation locally:"
echo "  1. asdf plugin add claude-code $(pwd)"
echo "  2. asdf list all claude-code"
echo "  3. asdf install claude-code latest"
echo "  4. asdf global claude-code latest"

