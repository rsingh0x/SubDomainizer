#!/bin/bash
# Quick installation test script for SubDomainizer

echo "Testing SubDomainizer installation..."
echo "======================================"
echo ""

# Check Python version
echo "1. Checking Python version..."
python3 --version
echo ""

# Test help command
echo "2. Testing help command..."
python3 SubDomainizer.py --help > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✓ Help command works"
else
    echo "✗ Help command failed"
    exit 1
fi
echo ""

# Test logo display
echo "3. Testing logo display..."
python3 SubDomainizer.py 2>&1 | grep -q "Find interesting Subdomains"
if [ $? -eq 0 ]; then
    echo "✓ Logo displays correctly"
else
    echo "✗ Logo display failed"
    exit 1
fi
echo ""

# Check for warnings
echo "4. Checking for startup warnings..."
WARNINGS=$(python3 SubDomainizer.py --help 2>&1 | grep -i "warning")
if [ -z "$WARNINGS" ]; then
    echo "✓ No warnings detected"
else
    echo "⚠ Warnings found:"
    echo "$WARNINGS"
fi
echo ""

echo "======================================"
echo "Installation test completed successfully!"
echo "SubDomainizer is ready to use."
