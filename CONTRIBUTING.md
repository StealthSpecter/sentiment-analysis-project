# Contributing to Sentiment Analysis Project

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion:

1. **Check existing issues** to avoid duplicates
2. **Open a new issue** with:
   - Clear, descriptive title
   - Detailed description of the problem/suggestion
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Environment details (OS, Python version, library versions)

### Suggesting Enhancements

We welcome suggestions for:

- New embedding techniques to evaluate
- Additional topic modeling algorithms
- Performance optimizations
- Documentation improvements
- Visualization enhancements

### Code Contributions

#### Getting Started

1. **Fork the repository**
2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/sentiment-analysis-project.git
   cd sentiment-analysis-project
   ```
3. **Create a branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

#### Making Changes

1. **Follow the existing code style**:
   - Use meaningful variable names
   - Add comments for complex logic
   - Follow PEP 8 guidelines for Python

2. **Test your changes**:
   - Run on a small dataset sample first
   - Verify results match expected output
   - Check for performance regressions

3. **Update documentation**:
   - Update README if adding new features
   - Add docstrings to new functions
   - Update SETUP.md if dependencies change

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "feat: Add XYZ feature"
   ```

#### Submitting Pull Requests

1. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request** on GitHub:
   - Provide clear description of changes
   - Reference related issues (e.g., "Fixes #123")
   - Include test results if applicable

3. **Respond to review feedback**:
   - Address reviewer comments
   - Update code as needed
   - Keep discussion professional and constructive

## Contribution Ideas

### Easy (Good First Issues)

- [ ] Add visualization for topic-sentiment relationships
- [ ] Improve error handling in preprocessing
- [ ] Add progress bars for long-running processes
- [ ] Create utility functions for common tasks
- [ ] Add more examples to documentation

### Medium

- [ ] Implement additional topic modeling algorithms (HDP, CTM)
- [ ] Add aspect-based sentiment analysis
- [ ] Create automated testing suite
- [ ] Optimize memory usage for large datasets
- [ ] Add command-line interface

### Advanced

- [ ] Implement LDA2Vec successfully
- [ ] Add multilingual support
- [ ] Create interactive visualization dashboard
- [ ] Implement online/streaming topic modeling
- [ ] Add neural topic models

## Code Style Guidelines

### Python Code

```python
# Good
def calculate_coherence(model, texts, dictionary, topn=10):
    """
    Calculate coherence score for topic model.
    
    Args:
        model: Trained topic model
        texts: Preprocessed text corpus
        dictionary: Gensim dictionary
        topn: Number of top words per topic
        
    Returns:
        float: Coherence score
    """
    coherence_model = CoherenceModel(
        model=model,
        texts=texts,
        dictionary=dictionary,
        topn=topn,
        coherence='c_v'
    )
    return coherence_model.get_coherence()

# Bad
def calc_coh(m, t, d, n=10):
    cm = CoherenceModel(model=m, texts=t, dictionary=d, topn=n, coherence='c_v')
    return cm.get_coherence()
```

### Notebook Style

- **Clear section headers** for each step
- **Markdown cells** explaining what and why
- **Print outputs** for key results
- **Clean up imports** at the beginning
- **Save important results** to files

### Documentation

- Use clear, concise language
- Include code examples
- Add screenshots where helpful
- Keep formatting consistent

## Testing Guidelines

### Before Submitting

Run these checks:

```bash
# Test on sample data
python -c "import numpy as np; print('NumPy works')"

# Verify imports
python -c "from your_module import your_function"

# Run quick test
python test_script.py
```

### What to Test

- [ ] Code runs without errors
- [ ] Results match expected output
- [ ] Performance is acceptable
- [ ] Memory usage is reasonable
- [ ] Documentation is updated

## Commit Message Guidelines

Use semantic commit messages:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Formatting, missing semicolons, etc.
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance tasks

Examples:

```
feat: Add GloVe embedding support
fix: Correct VADER sentiment thresholds
docs: Update README with new results
refactor: Optimize preprocessing pipeline
```

## Project Structure

When adding new files:

```
sentiment-analysis-project/
├── notebooks/
│   └── your_new_notebook.ipynb       # New analysis
├── src/                               # If creating reusable modules
│   └── utils/
│       └── preprocessing.py
├── tests/                             # If adding tests
│   └── test_preprocessing.py
└── docs/
    └── your_documentation.md
```

## Dependencies

### Adding New Dependencies

1. Add to `requirements.txt`:
   ```
   new-library==1.2.3
   ```

2. Update SETUP.md with installation instructions

3. Document why the dependency is needed

### Version Compatibility

- Maintain Python 3.8+ compatibility
- Test with both CPU and GPU if applicable
- Document any platform-specific requirements

## Performance Considerations

When contributing code:

- **Optimize for readability first**, then performance
- **Profile before optimizing**: use `%%time` in notebooks
- **Document performance characteristics**: O(n) complexity, memory usage
- **Test on realistic data sizes**: not just toy examples

## Documentation Standards

### Code Comments

```python
# Good: Explains WHY
# Use stratified sampling to maintain rating distribution
df_sample = df.sample(n=200000, stratify=df['Score'], random_state=42)

# Bad: Explains WHAT (obvious from code)
# Sample 200000 rows
df_sample = df.sample(n=200000, random_state=42)
```

### Docstrings

Use Google-style docstrings:

```python
def preprocess_text(text, remove_stopwords=True):
    """
    Preprocess text for sentiment analysis.
    
    Args:
        text (str): Raw text to preprocess
        remove_stopwords (bool): Whether to remove stopwords
        
    Returns:
        list: Tokenized and cleaned text
        
    Example:
        >>> preprocess_text("This is GREAT!")
        ['great']
    """
    # Implementation
```

## Community Guidelines

- **Be respectful**: Treat everyone with kindness
- **Be patient**: Not everyone has the same experience level
- **Be constructive**: Provide helpful feedback
- **Be collaborative**: Work together to improve the project
- **Give credit**: Acknowledge others' contributions

## Recognition

Contributors will be:

- Listed in CONTRIBUTORS.md (if we create one)
- Mentioned in release notes
- Credited in academic citations if applicable

## Questions?

- **Open an issue** for questions about contributing
- **Check existing issues** for similar questions
- **Read the documentation** for technical details

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to this project! 🙏
