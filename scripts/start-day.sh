#!/bin/bash
yesterday=$(date -v-1d +%Y-%m-%d)
today=$(date +%Y-%m-%d)
echo "Creating todo"
cp ~/OneDrive/notes/todos/$yesterday.md ~/OneDrive/notes/todos/$today.md
echo "Removing done elements from $today"
sed -i '' '/\[X\]/d' ~/OneDrive/notes/todos/$today.md
sed -i '' '/\[x\]/d' ~/OneDrive/notes/todos/$today.md
echo "Clear discussions...Under work"
