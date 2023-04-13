# BIOSTAT824 Final Project
**Spring 2023** </br>
**Authors:** Caitlyn Nguyen and Costa Stavrianidis

## Project Description

**Exploratory Aims:**</br>
We are interested in: </br>
1) Predicting survival status in breast cancer patients using various clinical and genetic features and
2) Investigating the association between gene expression profiles and tumor stage.

**Dataset:** </br>
The data of interest is from the Molecular Taxonomy of Breast Cancer International Consortium (METABRIC) study which can be found on the cBioPortal (https://www.cbioportal.org/study/summary?id=brca_metabric). Our final study dataset consists of 1,980 breast cancer patients and includes various clinical characteristics and normalized gene expression profiles. The 36 clinical characteristics include variables such as age at diagnosis, chemotherapy status, and type of breast cancer surgery. The relative expression of an individual gene and tumor to the gene's expression distribution in a reference population was calculated as the mRNA Z-scores for 1,088 genes, identified as cancer genes by OncoKB. The outcomes of interest were the binary survival status of patients at the end of the study (0 =  living and 1 = death from cancer) and the multi-class tumor stage (stage 1 through 4).

**Machine Learning Approach:** </br>
We plan to construct a LASSO-penalized linear regression as a baseline model, random forest as a tree-based ensemble, a support-vector machine, and a multi-layer perceptron for a neural network. All models will be developed in Python. The dataset will be split into a training, validation, and testing set in the respective ratio of 80:10:10. As such, 1,584 patients will be in the training set, 198 patients in the validation set, and 198 patients in the testing set. Parameters for the models will be determined by using 5-fold cross-validation on the training dataset.

**Visualization Approach:** </br>
Visualizations will include exploratory data analysis plots of the clinical characteristics, a gene expression matrix which depicts the gene expression across all samples and genes, ROC curves of the final model predictions, and a feature importance plot of gene expression on tumor stage.

## Data Availability
The raw data can be found in the `Data` folder:
- `Zscores` folder contains the raw normalized Z-scores from cBioPortal for the cancer ganes
- `Split_Data` folder contains the training, validation, and testing X and y datasets. The files with PCA replace the genetic Z score data with the top 17 principal components derived from the genetic data.
- `brca_metabric_clinical_data.csv` is the clinical characteristics of the patients from cBioPortal
- `Data_Compile.R`is the script to compile the genetic Z-score data with the patient clinical characteristics
- `compiled_metabric_data.csv`is the final compiled dataset of both the genetic Z-score data and clinical data, produced from the compiler script
- `Data_Cleaning.ipynb` is the script that cleans the data as described below.
- `cleaned_data.R` is the final cleaned dataset
- `Data_Preprocessing.ipynb` is the script that pre-processes the data, derives principal components, and splits the data, as described below.

## Data Cleaning
The following binary variables were recoded to be 0 or 1:
- `Overall_Survival_Status`: Living (0) or Deceased (1)
- `Chemotherapy`: No (0) or Yes (1)
- `ER_status_measured_by_IHC`: Negative (0) or Positive (1)
- `ER_status`: Negative (0) or Positive (1)
- `HER2_status`: Negative (0) or Positive (1)
- `PR_status`: Negative (0) or Positive (1)
- `Hormone Therapy`: No (0) or Yes (1)
- `Radio Therapy`: No (0) or Yes (1)
- `Inferred_Menopausal_State`: Pre (0) or Post (1)
- `Relapse_Free_Status`: Not Recurred (0) or Recurred (1)

There were 717 individuals that had missing data in any of the clinical characteristics and were removed from that dataset.
There were 22 genes that had missing Z-scores for all samples and were thus removed from the dataset.

The final dimension size of the cleaned analytic dataset was 1263 patients and 1,093 predictors.

## Data Pre-Processing

One-hot encoding was done for the following categorical variables:
- `Pam50___Claudin_low_subtype`
- `Cancer_Type_Detailed`
- `Oncotree_Code`
- `Cellularity`
- `Primary_Tumor_Laterality`
- `Type_of_Breast_Surgery`
- `Tumor_Other_Histologic_Subtype`
- `HER2_status_measured_by_SNP6`
- `Neoplasm_Histologic_Grade`
- `Tumor_Stage`

The following continuous clinical variables were standardized:
- `Age_at_Diagnosis`
- `Lymph_nodes_examined_positive`
- `Mutation_Count`
- `Nottingham_prognostic_index`
- `Relapse_Free_Status__Months_`

Principal Component Analysis (PCA) was used to reduce dimensionality. The principal components using the genetic Z-score data was found. Taking the top 17 components resulted in a great reduction of loss and dimension from the original 1,066 gene expression Z-score predictors.

The data was split into a training/validation/testing set by a ratio of 80:10:10. The training set had 1,009 patients, validation had 127 patients, and testing had 127 patients.

Included in the `Data` -> `Split_Data` folder is the splitting into training, validation, and testing subsets of the full pre-processed datasets and the PCA datasets which contain the pre-processed clinical data along with the 17 principal components.