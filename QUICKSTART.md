# Quick Start Guide

Get up and running with the sentiment analysis project in 10 minutes.

## 🚀 Fast Track (Google Colab - No Setup Required)

**Fastest way to start**: Use our pre-configured Colab notebooks!

1. Choose a notebook from the [README](README.md#-notebook-links)
2. Click the Colab link
3. Click "Copy to Drive"
4. Run all cells (Runtime → Run all)

**No installation, no downloads, just click and run!** ✨

---

## 💻 Local Setup (15 minutes)

### Prerequisites
- Python 3.8+
- 16GB RAM
- 5GB free space

### One-Line Setup

```bash
# Clone, setup, and install
git clone https://github.com/YOUR_USERNAME/sentiment-analysis-project.git && \
cd sentiment-analysis-project && \
python -m venv venv && \
source venv/bin/activate && \
pip install -r requirements.txt && \
python -c "import nltk; nltk.download('stopwords'); nltk.download('vader_lexicon')"
```

### Download Dataset

**Option 1: Kaggle API** (Fastest)
```bash
pip install kaggle
# Setup kaggle.json credentials (see SETUP.md)
kaggle datasets download -d snap/amazon-fine-food-reviews
unzip amazon-fine-food-reviews.zip -d data/
```

**Option 2: Manual**
1. Visit: https://www.kaggle.com/datasets/snap/amazon-fine-food-reviews
2. Download → Extract to `data/`

### Test Installation

```bash
python -c "
import pandas as pd
import numpy as np
import nltk
from transformers import AutoTokenizer
print('✅ All good! Ready to run.')
"
```

---

## 🎯 Run Your First Analysis

### Option 1: Simple Baseline (5 minutes)

```python
import pandas as pd
from nltk.sentiment import SentimentIntensityAnalyzer

# Load data
df = pd.read_csv('data/Reviews.csv')
sample = df.sample(n=1000, random_state=42)

# Quick sentiment analysis
sia = SentimentIntensityAnalyzer()
sample['sentiment'] = sample['Text'].apply(
    lambda x: sia.polarity_scores(x)['compound']
)

# Results
print(f"Positive: {(sample['sentiment'] > 0.05).sum()}")
print(f"Negative: {(sample['sentiment'] < -0.05).sum()}")
print(f"Neutral: {((sample['sentiment'] >= -0.05) & (sample['sentiment'] <= 0.05)).sum()}")
```

### Option 2: Full Pipeline (30 minutes)

Run the best-performing approach:

```bash
jupyter notebook notebooks/02_tfidf_lda_vader.ipynb
```

Or via Colab:
https://colab.research.google.com/drive/1U1W5_hAEhns81TY0c4YVQDTCl6aLfPnk

---

## 📊 What to Expect

### Outputs

After running notebooks, you'll get:

1. **Topic Models**: 25-33 discovered topics
2. **Coherence Scores**: Quality metrics (0.3-0.5 range)
3. **Sentiment Distribution**: Positive/Negative/Neutral percentages
4. **Visualizations**: Coherence plots, topic distributions
5. **Business Insights**: High-satisfaction vs problem areas

### Sample Results

```
✅ Best Topic Modeling: TF-IDF + LDA (Coherence: 0.5379)
✅ Best Sentiment: RoBERTa (Accuracy: 91.47%)

📊 Sentiment Distribution:
   - Positive: 88.3%
   - Negative: 9.7%
   - Neutral: 2.0%

🎯 Top Positive Topics:
   - Snacks & Treats (95%+ positive)
   - Pet Products (94%+ positive)
   - Baking Items (93%+ positive)

⚠️ Problem Areas:
   - Delivery Issues (20-22% negative)
   - Product Quality (18% negative)
```

---

## 🎓 Learning Path

### Beginner Track

1. **Start here**: `01_bow_lda_vader.ipynb`
   - Simplest approach
   - Understand basics of topic modeling
   - Learn VADER sentiment analysis

2. **Level up**: `02_tfidf_lda_vader.ipynb`
   - Best-performing traditional method
   - See how TF-IDF improves results

3. **Modern approach**: `06_bert_sentiment.ipynb`
   - Experience transformer models
   - Compare with traditional methods

### Advanced Track

1. **Word Embeddings**: `04_word2vec_kmeans_vader.ipynb`
   - Dense vector representations
   - K-Means clustering for topics

2. **State-of-the-art**: `07_roberta_sentiment.ipynb`
   - Highest accuracy model
   - Production-ready sentiment analysis

3. **Modern Topic Modeling**: `05_glove_bertopic_vader.ipynb`
   - BERTopic with HDBSCAN
   - Automatic topic discovery

---

## ⚡ Performance Tips

### Running Faster

```python
# Use smaller sample for testing
df_test = df.sample(n=10000)  # Instead of 200K

# Reduce topic range
topic_range = range(15, 25)  # Instead of 15-50

# Lower passes/epochs
passes = 5  # Instead of 10-20
```

### GPU Acceleration (Transformers)

**In Colab**: Runtime → Change runtime type → GPU

**Local**: Ensure CUDA is installed
```bash
python -c "import torch; print(torch.cuda.is_available())"
```

---

## 🔧 Common Quick Fixes

### "Module not found"
```bash
pip install missing-module
```

### "NLTK data not found"
```bash
python -c "import nltk; nltk.download('all')"
```

### "Out of memory"
```python
# Reduce batch size
batch_size = 16  # Default: 32
```

### "Dataset not found"
```bash
# Check data directory
ls data/Reviews.csv
```

---

## 📁 Project Structure (Simplified)

```
sentiment-analysis-project/
├── notebooks/           # 📓 7 analysis notebooks
├── data/               # 📊 Put Reviews.csv here
├── docs/               # 📄 Project report
└── requirements.txt    # 📦 Dependencies
```

---

## 🎯 Next Steps

1. ✅ Run a notebook
2. 📊 Analyze results
3. 🔬 Experiment with parameters
4. 📈 Compare approaches
5. 🚀 Apply to your own data

---

## 📚 Additional Resources

- **Full Setup**: See [SETUP.md](SETUP.md)
- **Git Guide**: See [GIT_GUIDE.md](GIT_GUIDE.md)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Main README**: See [README.md](README.md)

---

## 🆘 Need Help?

- **Quick questions**: Check [README.md](README.md)
- **Setup issues**: Check [SETUP.md](SETUP.md)
- **Code problems**: Open an issue
- **General help**: See documentation in notebooks

---

## ⏱️ Time Estimates

| Task | Time |
|------|------|
| Colab setup | 0 min (instant) |
| Local setup | 15 min |
| Download dataset | 5 min |
| Run baseline (1K samples) | 5 min |
| Run full analysis (200K) | 30-60 min |
| All 7 approaches | 3-4 hours |

---

## ✅ Success Checklist

- [ ] Environment set up
- [ ] Dataset downloaded
- [ ] Dependencies installed
- [ ] First notebook runs
- [ ] Results generated
- [ ] Understood key findings

**Congratulations! You're ready to explore sentiment analysis!** 🎉

---

**Pro Tip**: Start with Colab for instant results, then move to local for customization.
