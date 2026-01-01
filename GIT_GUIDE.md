# GitHub Push Guide

Step-by-step guide to push your project to GitHub.

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `sentiment-analysis-project`
3. Description: "Comparative Analysis of Embedding Techniques for Sentiment Analysis on Customer Reviews"
4. Choose: **Public** (or Private if you prefer)
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

## Step 2: Initialize Local Git Repository

Open terminal in your project directory and run:

```bash
cd /path/to/sentiment-analysis-project

# Initialize git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Complete sentiment analysis project with 7 approaches"
```

## Step 3: Connect to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/sentiment-analysis-project.git

# Verify remote
git remote -v
```

## Step 4: Push to GitHub

```bash
# Push to main branch
git branch -M main
git push -u origin main
```

### If you get authentication error:

#### Option A: Personal Access Token (Recommended)

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Select scopes: `repo` (full control)
4. Copy the token (save it somewhere safe!)
5. Use token as password when pushing:
   ```bash
   git push -u origin main
   Username: YOUR_USERNAME
   Password: <paste your token here>
   ```

#### Option B: SSH (More Secure)

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub: Settings → SSH and GPG keys → New SSH key

# Change remote to SSH
git remote set-url origin git@github.com:YOUR_USERNAME/sentiment-analysis-project.git

# Push
git push -u origin main
```

## Step 5: Verify Upload

Visit: `https://github.com/YOUR_USERNAME/sentiment-analysis-project`

You should see:
- ✅ README.md displayed
- ✅ All folders (notebooks, data, docs, etc.)
- ✅ License file
- ✅ .gitignore working (no venv/, __pycache__, etc.)

## Common Git Commands

### Making Changes

```bash
# Check status
git status

# Add specific files
git add filename.py

# Add all changes
git add .

# Commit changes
git commit -m "Description of changes"

# Push to GitHub
git push
```

### Updating README

```bash
# Edit README.md
nano README.md  # or use any editor

# Commit and push
git add README.md
git commit -m "Update README with new information"
git push
```

### Creating Branches

```bash
# Create new branch
git checkout -b feature/new-analysis

# Work on branch
git add .
git commit -m "Add new analysis"

# Push branch
git push -u origin feature/new-analysis

# Merge to main (on GitHub via Pull Request)
```

### Downloading Notebooks from Colab

```bash
# In each Colab notebook:
# File → Download → Download .ipynb

# Move to notebooks folder
mv ~/Downloads/notebook_name.ipynb notebooks/

# Commit
git add notebooks/notebook_name.ipynb
git commit -m "Add [approach] notebook"
git push
```

## Repository Customization

### Add Topics (Tags)

On GitHub repository page:
1. Click ⚙️ (Settings icon near About)
2. Add topics: `sentiment-analysis`, `nlp`, `machine-learning`, `deep-learning`, `bert`, `transformers`, `topic-modeling`, `python`

### Add Description

1. Click ⚙️ near About
2. Description: "Comparative study of 7 approaches for sentiment analysis and topic modeling on 200K Amazon reviews"
3. Website: Link to Colab or portfolio (optional)

### Enable GitHub Pages (Optional)

To create a project website:
1. Settings → Pages
2. Source: Deploy from branch
3. Branch: main, folder: /docs (if you add HTML)
4. Save

### Add Badges to README

Add at the top of README.md:

```markdown
![Python](https://img.shields.io/badge/python-3.8+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)
```

## Organizing Notebooks

Since notebooks are on Colab, you have two options:

### Option 1: Keep Links Only (Current)

The README already has all Colab links. Users can run directly on Colab.

### Option 2: Download and Include

```bash
# Download each notebook from Colab
# Place in notebooks/ folder
# Commit and push

git add notebooks/*.ipynb
git commit -m "Add all analysis notebooks"
git push
```

## Large Files Warning

If you get "file too large" error:

```bash
# Files over 100MB need Git LFS

# Install Git LFS
git lfs install

# Track large files
git lfs track "*.csv"
git lfs track "*.h5"
git lfs track "*.model"

# Add and commit
git add .gitattributes
git commit -m "Configure Git LFS"
git push
```

**Recommendation**: Keep dataset in `.gitignore` and provide download instructions (already done).

## Project Structure on GitHub

```
https://github.com/YOUR_USERNAME/sentiment-analysis-project/
│
├── README.md                    # Main project description
├── SETUP.md                     # Setup instructions
├── LICENSE                      # MIT License
├── requirements.txt             # Dependencies
├── .gitignore                  # Ignored files
│
├── notebooks/                   # Jupyter notebooks
├── data/                        # README with download instructions
├── docs/                        # Project report PDF
├── results/                     # Empty (users generate)
└── figures/                     # Empty (users generate)
```

## Maintaining Your Repository

### Regular Updates

```bash
# Pull latest changes (if working on multiple machines)
git pull

# Make changes
# Add and commit
git add .
git commit -m "Update analysis with new findings"
git push
```

### Semantic Commit Messages

Use clear commit messages:
- `feat: Add RoBERTa sentiment analysis`
- `fix: Correct coherence calculation in LDA`
- `docs: Update README with results`
- `refactor: Optimize preprocessing pipeline`
- `test: Add unit tests for tokenization`

## Best Practices

1. ✅ **Commit Often**: Small, focused commits
2. ✅ **Clear Messages**: Descriptive commit messages
3. ✅ **Ignore Large Files**: Use .gitignore for data/models
4. ✅ **Document Everything**: Update README with changes
5. ✅ **Tag Releases**: Use `git tag v1.0.0` for versions
6. ✅ **Branch for Experiments**: Don't break main branch

## Troubleshooting

### Problem: "Repository not found"

```bash
# Check remote URL
git remote -v

# Update if wrong
git remote set-url origin https://github.com/YOUR_USERNAME/sentiment-analysis-project.git
```

### Problem: "Failed to push some refs"

```bash
# Pull first, then push
git pull origin main --rebase
git push
```

### Problem: "Large file detected"

```bash
# Remove from staging
git rm --cached large_file.csv

# Add to .gitignore
echo "large_file.csv" >> .gitignore

# Commit
git add .gitignore
git commit -m "Remove large file, add to gitignore"
git push
```

## Success Checklist

After pushing, verify:

- [ ] README displays correctly
- [ ] Project report PDF accessible in docs/
- [ ] All notebooks linked or uploaded
- [ ] Setup instructions clear
- [ ] .gitignore working (no venv/, data files)
- [ ] License visible
- [ ] Repository description added
- [ ] Topics/tags added
- [ ] Star your own repo! ⭐

---

**You're all set!** Your project is now on GitHub and ready to share. 🎉

Share your repository link:
`https://github.com/YOUR_USERNAME/sentiment-analysis-project`
