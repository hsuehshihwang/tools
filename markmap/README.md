---
markmap:
  color:
    - blue
  initialExpandLevel: 2
  # other options
---

# markmap
# installation
## nvm
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc  # or ~/.zshrc
nvm install --lts
```
## markmap
```bash
npm install -g markmap-cli
```
## example
### example.md
```markdown
# My Mind Map
## Section 1
- Item 1
- Item 2
## Section 2
- Sub-item A
- Sub-item B
```
### generate mymap.html
```bash
# markmap example.md
# markmap example.md -o mymap.html
markmap --no-open example.md -o mymap.html
```

