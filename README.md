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
- `brca_metabric_clinical_data.csv` is the clinical characteristics of the patients from cBioPortal
- `Data_Compile.R`is the script to compile the genetic Z-score data with the patient clinical characteristics
- `compiled_metabric_data.csv`is the final compiled dataset of both the genetic Z-score data and clinical data, produced from the compiler script
