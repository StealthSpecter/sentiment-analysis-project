# Sentiment Analysis on Customer Reviews: A Comparative Study

A comprehensive comparative analysis of embedding techniques and transformer-based models for sentiment analysis and topic modeling on Amazon Fine Food Reviews.

## 📊 Project Overview

This project conducts a systematic comparison of **7 different approaches** for sentiment analysis and topic modeling on a dataset of **200,000 Amazon Fine Food Reviews**. The study evaluates both traditional machine learning methods and state-of-the-art transformer models.

### Key Highlights

- **Dataset**: 200,000 Amazon Fine Food Reviews
- **Best Topic Modeling**: TF-IDF + LDA (Coherence: 0.5379)
- **Best Sentiment Classification**: RoBERTa (Accuracy: 91.47%)
- **Approaches Evaluated**: 7 different methodologies
- **Comprehensive Analysis**: Includes convergence analysis, coherence evaluation, and performance metrics

## 🎯 Research Objectives

1. Evaluate different embedding techniques (BoW, TF-IDF, Word2Vec, GloVe) vs transformers (BERT, RoBERTa)
2. Compare topic modeling approaches (LDA, NMF, K-Means, BERTopic)
3. Establish relationship between discovered topics and sentiment
4. Determine optimal hyperparameters through systematic analysis
5. Assess computational efficiency of each approach
6. Identify factors impacting customer satisfaction

## 🔬 Methodologies Implemented

### Traditional Machine Learning Approaches

| Approach | Topic Modeling | Sentiment Analysis | Optimal k | Coherence Score |
|----------|---------------|-------------------|-----------|----------------|
| **BoW + LDA + VADER** | LDA | VADER | 25 | 0.4943 |
| **TF-IDF + LDA + VADER** | LDA | VADER | 33 | **0.5379** ⭐ |
| **TF-IDF + NMF + VADER** | NMF | VADER | 18 | 0.3411 |
| **Word2Vec + K-Means + VADER** | K-Means | VADER | 49 | 0.4378 |
| **GloVe + BERTopic + VADER** | BERTopic | VADER | 29 | 0.4503 |

### Transformer-Based Deep Learning

| Model | Epochs | Accuracy | F1-Score | Training Time |
|-------|--------|----------|----------|---------------|
| **BERT** | 1 | 89.61% | 0.8875 | ~15 min |
| **RoBERTa** | 2 | **91.47%** ⭐ | 0.9115 | ~30 min |

## 📁 Project Structure

```
sentiment-analysis-project/
│
├── notebooks/                    # Jupyter/Colab notebooks
│   ├── 01_bow_lda_vader.ipynb
│   ├── 02_tfidf_lda_vader.ipynb
│   ├── 03_tfidf_nmf_vader.ipynb
│   ├── 04_word2vec_kmeans_vader.ipynb
│   ├── 05_glove_bertopic_vader.ipynb
│   ├── 06_bert_sentiment.ipynb
│   └── 07_roberta_sentiment.ipynb
│
├── data/                         # Dataset (not included - see setup)
│   └── README.md                 # Instructions to download data
│
├── results/                      # Model outputs and results
│   ├── coherence_scores.csv
│   ├── sentiment_distributions.csv
│   └── performance_metrics.csv
│
├── figures/                      # Visualizations and plots
│   ├── coherence_analysis/
│   ├── sentiment_distributions/
│   └── topic_analysis/
│
├── docs/                         # Documentation
│   └── project_report.pdf       # Full research report
│
├── requirements.txt              # Python dependencies
├── .gitignore                   # Git ignore file
└── README.md                    # This file
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- GPU recommended for transformer models (BERT, RoBERTa)
- Minimum 16GB RAM

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/sentiment-analysis-project.git
cd sentiment-analysis-project

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Download NLTK data
python -c "import nltk; nltk.download('stopwords'); nltk.download('vader_lexicon')"
```

### Dataset Setup

1. Download the Amazon Fine Food Reviews dataset from [Kaggle](https://www.kaggle.com/datasets/snap/amazon-fine-food-reviews)
2. Place the `Reviews.csv` file in the `data/` directory
3. The dataset contains 568,454 reviews; we use a 200,000 sample for this analysis

## 📚 Notebook Links

All notebooks are available on Google Colab:

1. **BoW + LDA + VADER**: [Colab Link](https://colab.research.google.com/drive/1ifY8wuEaROTS0WSqjmC6iWAt-r76jro_)
2. **TF-IDF + LDA + VADER**: [Colab Link](https://colab.research.google.com/drive/1U1W5_hAEhns81TY0c4YVQDTCl6aLfPnk)
3. **TF-IDF + NMF + VADER**: [Colab Link](https://colab.research.google.com/drive/1IRDxp5zxhbVKfLr8Tnr8Dlpi05aAQyQX)
4. **Word2Vec + K-Means + VADER**: [Colab Link](https://colab.research.google.com/drive/1HtZhYe0c5XQf3OiBZWXIGyi-HE0SK5B3)
5. **GloVe + BERTopic + VADER**: [Colab Link](https://colab.research.google.com/drive/16I45qxZJrzV2k_yi53Wzqd8Ti8VwMjYR)
6. **BERT Sentiment Classification**: [Colab Link](https://colab.research.google.com/drive/1dFpdDvTiHRVnwFddR_YIFwlDCh6XA7oV)
7. **RoBERTa Sentiment Classification**: [Colab Link](https://colab.research.google.com/drive/1SQqTJiaOdTDr3uVIbvuSwzufG9bj5pyl)

## 🎓 Key Findings

### Topic Modeling Results

- **TF-IDF + LDA** achieved the highest coherence (0.5379), demonstrating superior topic quality
- TF-IDF weighting effectively highlights distinctive terms, leading to more interpretable topics
- NMF showed lower coherence but faster training time
- BERTopic's performance degraded when scaling from 50K to 200K documents

### Sentiment Classification Results

- **RoBERTa** achieved the best accuracy (91.47%) with improved minority class performance
- **BERT** detected 5.8% more negative sentiment than VADER (15.3% vs 9.7%)
- Transformers reveal subtle negativity that VADER's lexicon-based approach misses
- VADER shows optimism bias with 88.3% positive classification

### Business Insights

**High-Satisfaction Topics (>93% Positive):**
- Snacks & Treats: 95%+ positive
- Pet Products: 94%+ positive
- Baking & Gluten-Free: 93%+ positive

**Problem Areas (>15% Negative):**
- Delivery/Fulfillment: 20-22% negative
- Product Quality: 18% negative
- Packaging Issues: 16% negative

## ⚙️ Technical Details

### Data Preprocessing Pipeline

1. HTML tag removal
2. Case normalization
3. Punctuation handling
4. Whitespace normalization
5. Tokenization (method varies by approach)
6. Stopword removal (for traditional methods)

### Hyperparameter Optimization

- Systematic convergence analysis for passes/epochs
- Comprehensive coherence evaluation across topic ranges
- Cross-validation for transformer models
- Computational efficiency tracking

## 📊 Performance Comparison

### Computational Efficiency (200K documents)

| Approach | Training Time | Hardware |
|----------|--------------|----------|
| TF-IDF + NMF | ~15-20 min | CPU |
| BoW + LDA | ~20-25 min | CPU |
| TF-IDF + LDA | ~25-30 min | CPU |
| Word2Vec + K-Means | ~30-35 min | CPU |
| BERT (1 epoch) | ~15 min | GPU (T4) |
| RoBERTa (2 epochs) | ~30 min | GPU (T4) |
| GloVe + BERTopic | ~3 hours | CPU |

### Use Case Recommendations

**For Topic Discovery & Interpretability:**
- Primary: TF-IDF + LDA (highest coherence, interpretable)
- Alternative: BoW + LDA (simpler, faster)

**For Fast Prototyping:**
- Primary: TF-IDF + NMF (fastest training, deterministic)
- Alternative: BoW + LDA (simple implementation)

**For Production Sentiment Classification:**
- Primary: RoBERTa (best accuracy: 91.47%)
- Alternative: BERT (faster training, 89.61% accuracy)

**For Resource-Constrained Environments:**
- Primary: TF-IDF + LDA + VADER (CPU-only, good performance)
- Alternative: BoW + LDA + VADER (minimal resources)

## 🔧 Technologies Used

- **Programming**: Python 3.8+
- **NLP Libraries**: NLTK, Gensim, SpaCy
- **ML Frameworks**: scikit-learn, TensorFlow/PyTorch
- **Transformers**: Hugging Face Transformers
- **Topic Modeling**: Gensim (LDA), scikit-learn (NMF), BERTopic
- **Embeddings**: Word2Vec, GloVe, BERT, RoBERTa
- **Sentiment Analysis**: VADER, BERT, RoBERTa
- **Visualization**: Matplotlib, Seaborn, Plotly
- **Environment**: Google Colab (GPU: Tesla T4)

## 📝 Citation

If you use this work in your research, please cite:

```bibtex
@project{sentiment_analysis_2024,
  title={Comparative Analysis of Embedding Techniques for Sentiment Analysis on Customer Reviews},
  author={Deb, Samiksha and Sarraf, Vanshika},
  institution={National Institute of Technology Meghalaya},
  year={2024},
  supervisor={Singh, Thoudam Doren}
}
```

## 🤝 Contributors

- **Samiksha Deb** (B22CS029)
- **Vanshika Sarraf** (B22CS037)
- **Supervisor**: Dr. Thoudam Doren Singh, Assistant Professor, CSE, NIT Meghalaya

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

We express our sincere gratitude to Dr. Thoudam Doren Singh for his invaluable guidance, support, and mentorship throughout this project. We acknowledge the National Institute of Technology Meghalaya for providing the academic environment and resources that enabled this research.

## 📧 Contact

For questions or collaboration opportunities, please open an issue in this repository.

---

**Note**: This is an academic research project conducted as part of coursework at NIT Meghalaya. The code and methodologies are provided for educational and research purposes.
