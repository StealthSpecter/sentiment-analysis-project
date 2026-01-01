# Dataset Information

## Amazon Fine Food Reviews

This project uses the **Amazon Fine Food Reviews** dataset from Kaggle.

### Dataset Statistics

- **Total Reviews**: 568,454
- **Sample Size Used**: 200,000 reviews
- **Time Period**: October 1999 - October 2012
- **Columns**: Review text, ratings, timestamps, product IDs, user IDs

### How to Download

1. **Option 1: Kaggle Website**
   - Visit: https://www.kaggle.com/datasets/snap/amazon-fine-food-reviews
   - Click "Download" (requires Kaggle account)
   - Extract `Reviews.csv` to this directory

2. **Option 2: Kaggle API** (Recommended)
   ```bash
   # Install Kaggle API
   pip install kaggle
   
   # Setup API credentials (get from Kaggle Account Settings)
   mkdir ~/.kaggle
   # Place kaggle.json in ~/.kaggle/
   
   # Download dataset
   kaggle datasets download -d snap/amazon-fine-food-reviews
   unzip amazon-fine-food-reviews.zip -d data/
   ```

3. **Option 3: Direct Link**
   - Dataset is also available at: https://snap.stanford.edu/data/web-FineFoods.html

### File Structure

After downloading, your data directory should look like:

```
data/
├── README.md (this file)
└── Reviews.csv (568,454 rows)
```

### Data Sampling

The notebooks automatically sample 200,000 reviews for analysis. The sampling is:
- Stratified by rating to maintain distribution
- Reproducible (random_state=42)
- Balanced across time periods

### Dataset Schema

| Column | Description |
|--------|-------------|
| `Id` | Unique review identifier |
| `ProductId` | Unique product identifier |
| `UserId` | Unique user identifier |
| `ProfileName` | User's profile name |
| `HelpfulnessNumerator` | Number of users who found review helpful |
| `HelpfulnessDenominator` | Number of users who rated helpfulness |
| `Score` | Rating between 1 and 5 |
| `Time` | Timestamp of review |
| `Summary` | Brief review summary |
| `Text` | Full review text |

### Data Quality Notes

- Reviews are in English
- Contains both short and long reviews
- Heavy positive sentiment skew (~88% positive)
- Some reviews may contain HTML formatting
- Missing values are minimal

### Citation

If you use this dataset, please cite:

```
J. McAuley and J. Leskovec. 
From amateurs to connoisseurs: modeling the evolution of user expertise through online reviews. 
WWW, 2013.
```

### Privacy & Ethics

- User identities are anonymized
- Product information is public
- Dataset is used for research and educational purposes only

---

**Note**: Due to file size (~280MB), the dataset is not included in this repository. Please download it separately using the instructions above.
