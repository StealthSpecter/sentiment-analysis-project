# Setup Guide

Complete guide to set up and run the sentiment analysis project.

## Prerequisites

- Python 3.8 or higher
- Git installed
- 16GB RAM minimum (32GB recommended)
- GPU recommended for transformer models (Tesla T4 or better)
- 10GB free disk space

## Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/sentiment-analysis-project.git
cd sentiment-analysis-project
```

## Step 2: Create Virtual Environment

### Using venv (recommended)

```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### Using conda (alternative)

```bash
# Create conda environment
conda create -n sentiment-analysis python=3.8

# Activate environment
conda activate sentiment-analysis
```

## Step 3: Install Dependencies

```bash
# Upgrade pip
pip install --upgrade pip

# Install all requirements
pip install -r requirements.txt

# Download NLTK data
python -c "import nltk; nltk.download('stopwords'); nltk.download('vader_lexicon'); nltk.download('punkt')"

# Download spaCy model (optional, for advanced preprocessing)
python -m spacy download en_core_web_sm
```

## Step 4: Download Dataset

### Option A: Kaggle API (Recommended)

```bash
# Install Kaggle
pip install kaggle

# Setup Kaggle credentials
# 1. Go to https://www.kaggle.com/account
# 2. Scroll to API section
# 3. Click "Create New API Token"
# 4. Move downloaded kaggle.json to:
#    - Linux/Mac: ~/.kaggle/kaggle.json
#    - Windows: C:\Users\<Username>\.kaggle\kaggle.json

# Download dataset
kaggle datasets download -d snap/amazon-fine-food-reviews

# Extract to data folder
unzip amazon-fine-food-reviews.zip -d data/
rm amazon-fine-food-reviews.zip
```

### Option B: Manual Download

1. Visit: https://www.kaggle.com/datasets/snap/amazon-fine-food-reviews
2. Click "Download" (requires Kaggle account)
3. Extract `Reviews.csv` to the `data/` directory

## Step 5: Download Pre-trained Embeddings (Optional)

### GloVe Embeddings

```bash
# Download GloVe 6B (Wikipedia 2014 + Gigaword 5)
cd data/
wget http://nlp.stanford.edu/data/glove.6B.zip
unzip glove.6B.zip
rm glove.6B.zip
cd ..
```

### Word2Vec Embeddings

Word2Vec embeddings are trained from scratch in the notebooks, so no download is needed.

## Step 6: Verify Installation

Create a test script to verify everything is working:

```bash
python << EOF
import numpy as np
import pandas as pd
import nltk
import gensim
import sklearn
import torch
import transformers
from bertopic import BERTopic
print(" All core libraries imported successfully!")

# Check NLTK data
try:
    from nltk.corpus import stopwords
    stopwords.words('english')[:5]
    print(" NLTK data downloaded successfully!")
except:
    print(" NLTK data missing - run: python -c \"import nltk; nltk.download('all')\"")

# Check dataset
import os
if os.path.exists('data/Reviews.csv'):
    print(" Dataset found!")
else:
    print(" Dataset missing - download from Kaggle")

print("\n Setup complete! Ready to run notebooks.")
EOF
```

## Step 7: Running the Notebooks

### Local Jupyter

```bash
# Start Jupyter
jupyter notebook

# Navigate to notebooks/ folder
# Open any notebook and run
```

### Google Colab

All notebooks are already available on Colab (links in main README). To run locally:

1. Download the `.ipynb` files from Colab links
2. Place them in the `notebooks/` directory
3. Update file paths to point to local data

## GPU Setup (Optional but Recommended)

### For Local GPU (NVIDIA)

```bash
# Install PyTorch with CUDA support
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Verify GPU
python -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}')"
```

### For Google Colab

GPU is automatically configured in Colab. Just ensure:
1. Runtime → Change runtime type → Hardware accelerator → GPU

## Common Issues & Solutions

### Issue 1: Out of Memory

```python
# Solution: Reduce batch size in transformer notebooks
# BERT/RoBERTa: Change batch_size from 32 to 16 or 8
trainer = Trainer(
    per_device_train_batch_size=16,  # Reduced from 32
    per_device_eval_batch_size=16,
)
```

### Issue 2: NLTK Data Not Found

```bash
# Download all NLTK data
python -c "import nltk; nltk.download('all')"
```

### Issue 3: Transformers Model Download Fails

```bash
# Pre-download models
python -c "from transformers import AutoModel; AutoModel.from_pretrained('bert-base-uncased')"
python -c "from transformers import AutoModel; AutoModel.from_pretrained('roberta-base')"
```

### Issue 4: GloVe File Not Found

```bash
# Ensure GloVe is in data/ directory
ls data/glove.6B.100d.txt

# If missing, re-download
cd data/
wget http://nlp.stanford.edu/data/glove.6B.zip
unzip glove.6B.zip
```

## Running Experiments

### Quick Test (Subset)

```python
# In any notebook, use a small sample first
df = pd.read_csv('data/Reviews.csv')
df_sample = df.sample(n=10000, random_state=42)  # 10K sample for testing
```

### Full Experiments

```python
# Use full 200K dataset
df = pd.read_csv('data/Reviews.csv')
df_full = df.sample(n=200000, random_state=42)
```

## Directory Structure After Setup

```
sentiment-analysis-project/
├── venv/                         # Virtual environment
├── data/
│   ├── Reviews.csv              # Downloaded dataset
│   ├── glove.6B.100d.txt        # GloVe embeddings (optional)
│   └── README.md
├── notebooks/
│   ├── *.ipynb                  # Downloaded from Colab
├── results/
├── figures/
├── requirements.txt
└── README.md
```

## Next Steps

1.  Complete setup
2.  Run `01_bow_lda_vader.ipynb` as a test
3.  Experiment with hyperparameters
4.  Generate your own results
5.  Extend the analysis

## Performance Tips

1. **Use GPU**: 10-20x faster for BERT/RoBERTa
2. **Sample First**: Test on 10K samples before full 200K
3. **Monitor Memory**: Close other applications
4. **Save Checkpoints**: Save models after training
5. **Parallel Processing**: Use `workers=4` in Gensim models

## Additional Resources

- **Gensim Documentation**: https://radimrehurek.com/gensim/
- **Transformers Documentation**: https://huggingface.co/docs/transformers/
- **BERTopic Tutorial**: https://maartengr.github.io/BERTopic/
- **NLTK Book**: https://www.nltk.org/book/

## Getting Help

If you encounter issues:

1. Check this setup guide
2. Review notebook comments
3. Open an issue on GitHub
4. Check library documentation

---

Happy analyzing! 
