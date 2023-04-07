# BIOSTAT824 Final Project
**Spring 2023** </br>
**Authors:** Caitlyn Nguyen and Costa Stavrianidis

**Exploratory Aims:**</br>
We are interested in: </br>
1) Predicting survival status in breast cancer patients using various clinical and genetic features and
2) Investigating the association between gene expression profiles and tumor stage.

**Dataset:** </br>
The data of interest is from the Molecular Taxonomy of Breast Cancer International Consortium (METABRIC) study which can be found on the cBioPortal (https://www.cbioportal.org/study/summary?id=brca_metabric). Our final study dataset consists of 1,980 breast cancer patients and includes various clinical characteristics and normalized gene expression profiles. The 36 clinical characteristics include variables such as age at diagnosis, chemotherapy status, and type of breast cancer surgery. The relative expression of an individual gene and tumor to the gene's expression distribution in a reference population was calculated as the mRNA Z-scores for 1,088 genes, identified as cancer genes by OncoKB. The outcomes of interest were the binary survival status of patients at the end of the study (0 =  living and 1 = death from cancer) and the multi-class tumor stage (stage 1 through 4).

**Machine Learning Approach:** </br>
We plan to construct a LASSO-penalized linear regression as a baseline model, random forest as a tree-based ensemble, a support-vector machine, and a multi-layer perceptron for a neural network. All models will be developed in Python. The dataset will be split into a training, validation, and testing set in the respective ratio of 80:10:10. As such, 1,584 patients will be in the training set, 198 patients in the validation set, and 198 patients in the testing set. Parameters for the models will be determined by using 5-fold cross-validation on the training dataset. Final models will be compared to each other in terms of various performance metrics. The beta coefficients of the LASSO-penalized linear regression model could provide insight on the effect of each gene expression or clinical feature on predicting mortality. We can similarly look at the feature importance from the random forest, support-vector machine, and multi-layer perceptron for similar interpretation. We will similarly construct models and do subsequent analysis for the multi-class outcome of tumor stage.

**Visualization Approach:** </br>
Visualizations will include exploratory data analysis plots of the clinical characteristics, a gene expression matrix which depicts the gene expression across all samples and genes, ROC curves of the final model predictions, and a feature importance plot of gene expression on tumor stage. Exploratory data analysis will include looking at distributions of various clinical characteristics, as well as checking for outliers within those features. A correlation heatmap for gene expression will be created. Analysis will include calculating the area under the ROC curve as an evaluation of model discrimination performance and determining importance of individual features within the constructed models. For our first aim, it is important to understand the features we are using to predict survival status before incorporating them into statistical and machine learning models. These models may have required underlying assumptions that must be checked using the data before implementing them.
