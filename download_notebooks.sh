#!/bin/bash

# Script to help download Colab notebooks
# This creates placeholder files with instructions

echo "================================================"
echo "📓 Colab Notebooks Download Helper"
echo "================================================"
echo ""
echo "This script creates placeholder files for your Colab notebooks."
echo "You'll need to manually download each notebook from Colab."
echo ""

# Create notebooks directory if it doesn't exist
mkdir -p notebooks

# Array of notebook names and their Colab links
declare -A notebooks=(
    ["01_bow_lda_vader"]="https://colab.research.google.com/drive/1ifY8wuEaROTS0WSqjmC6iWAt-r76jro_"
    ["02_tfidf_lda_vader"]="https://colab.research.google.com/drive/1U1W5_hAEhns81TY0c4YVQDTCl6aLfPnk"
    ["03_tfidf_nmf_vader"]="https://colab.research.google.com/drive/1IRDxp5zxhbVKfLr8Tnr8Dlpi05aAQyQX"
    ["04_word2vec_kmeans_vader"]="https://colab.research.google.com/drive/1HtZhYe0c5XQf3OiBZWXIGyi-HE0SK5B3"
    ["05_glove_bertopic_vader"]="https://colab.research.google.com/drive/16I45qxZJrzV2k_yi53Wzqd8Ti8VwMjYR"
    ["06_bert_sentiment"]="https://colab.research.google.com/drive/1dFpdDvTiHRVnwFddR_YIFwlDCh6XA7oV"
    ["07_roberta_sentiment"]="https://colab.research.google.com/drive/1SQqTJiaOdTDr3uVIbvuSwzufG9bj5pyl"
)

# Create README in notebooks directory
cat > notebooks/README.md << 'EOF'
# Notebooks Directory

This directory contains all analysis notebooks for the sentiment analysis project.

## Download Instructions

### Method 1: Manual Download (Recommended)

For each notebook below:

1. Click the Colab link
2. In Colab: **File → Download → Download .ipynb**
3. Save to this `notebooks/` directory
4. Rename to match the filename below

### Method 2: Direct Links

You can also use the notebooks directly in Colab without downloading.

## Available Notebooks

1. **01_bow_lda_vader.ipynb**
   - Approach: Bag of Words + LDA + VADER
   - Coherence: 0.4943
   - [Colab Link](https://colab.research.google.com/drive/1ifY8wuEaROTS0WSqjmC6iWAt-r76jro_)

2. **02_tfidf_lda_vader.ipynb** ⭐ Best Topic Modeling
   - Approach: TF-IDF + LDA + VADER
   - Coherence: 0.5379 (HIGHEST)
   - [Colab Link](https://colab.research.google.com/drive/1U1W5_hAEhns81TY0c4YVQDTCl6aLfPnk)

3. **03_tfidf_nmf_vader.ipynb**
   - Approach: TF-IDF + NMF + VADER
   - Coherence: 0.3411
   - [Colab Link](https://colab.research.google.com/drive/1IRDxp5zxhbVKfLr8Tnr8Dlpi05aAQyQX)

4. **04_word2vec_kmeans_vader.ipynb**
   - Approach: Word2Vec + K-Means + VADER
   - Coherence: 0.4378
   - [Colab Link](https://colab.research.google.com/drive/1HtZhYe0c5XQf3OiBZWXIGyi-HE0SK5B3)

5. **05_glove_bertopic_vader.ipynb**
   - Approach: GloVe + BERTopic + VADER
   - Coherence: 0.4503
   - [Colab Link](https://colab.research.google.com/drive/16I45qxZJrzV2k_yi53Wzqd8Ti8VwMjYR)

6. **06_bert_sentiment.ipynb**
   - Approach: BERT for Sentiment Classification
   - Accuracy: 89.61%
   - [Colab Link](https://colab.research.google.com/drive/1dFpdDvTiHRVnwFddR_YIFwlDCh6XA7oV)

7. **07_roberta_sentiment.ipynb** ⭐ Best Sentiment Classification
   - Approach: RoBERTa for Sentiment Classification
   - Accuracy: 91.47% (HIGHEST)
   - [Colab Link](https://colab.research.google.com/drive/1SQqTJiaOdTDr3uVIbvuSwzufG9bj5pyl)

## After Downloading

Once all notebooks are downloaded:

```bash
# Verify all notebooks present
ls -la notebooks/*.ipynb

# You should see 7 .ipynb files

# Add to git
git add notebooks/*.ipynb
git commit -m "Add all analysis notebooks"
git push
```

## Running Notebooks Locally

```bash
# Activate virtual environment
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Start Jupyter
jupyter notebook

# Navigate to notebooks/ and open any .ipynb file
```

## File Naming Convention

- `01_` - `07_`: Sequential numbering
- Method description: `bow_lda_vader`, `tfidf_lda_vader`, etc.
- Extension: `.ipynb`

## Notes

- All notebooks are designed to run on Google Colab with GPU support
- For local execution, ensure you have sufficient RAM (16GB+)
- BERT and RoBERTa notebooks require GPU for reasonable performance
- Traditional methods (BoW, TF-IDF, Word2Vec, GloVe) can run on CPU

---

**Tip**: You can keep notebooks in Colab and just link to them in your README, or download them for local version control. Both approaches work!
EOF

echo "✅ Created notebooks/README.md"
echo ""

# Create individual instructions
for name in "${!notebooks[@]}"; do
    file="notebooks/${name}.ipynb"
    link="${notebooks[$name]}"
    
    echo "📓 $file"
    echo "   Link: $link"
    echo "   Status: Ready to download"
    echo ""
done

echo "================================================"
echo "📋 Next Steps:"
echo "================================================"
echo ""
echo "1. Visit each Colab link above"
echo "2. In Colab: File → Download → Download .ipynb"
echo "3. Save to notebooks/ directory"
echo "4. Rename to match the filename shown"
echo ""
echo "Alternative: Keep notebooks in Colab and link to them"
echo "(Your README already has all the links!)"
echo ""
echo "================================================"
echo "✅ Setup complete!"
echo "================================================"
