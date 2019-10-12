#!/bin/bash
yesterday=$(date -v-1d +%Y-%m-%d)
today=$(date +%Y-%m-%d)
echo "Creating todo"
cp ~/OneDrive\ -\ Ryanair\ Ltd/notes/todos/$yesterday.md ~/OneDrive\ -\ Ryanair\ Ltd/notes/todos/$today.md
echo "Removing done elements from $today"
sed -i '' '/\[X\]/d' ~/OneDrive\ -\ Ryanair\ Ltd/notes/todos/$today.md
sed -i '' '/\[x\]/d' ~/OneDrive\ -\ Ryanair\ Ltd/notes/todos/$today.md
echo "Clear discussions...Under work"
