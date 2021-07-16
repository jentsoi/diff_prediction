# Prediction differentiation subtypes in melanoma cell lines
 
Usage:
```
Rscript predict_subtypes.R <input filename> <optional output filename>
```
 
 
 Example:
 
 ```
 Rscript predict_subtypes.R CCLE_melanoma_microarray_RMA_normalized-example_input_file.txt prediction_example.txt
 ```
 
- RScript and RData file will need to be saved in the same directory.
- You will need to install R if you have not done so, and the R package “kernlab” prior to running the script.
- The input file with the expression data should be with genes as rownames (in HUGO gene symbol nomenclature) and samples as column names and saved as a tab-delimited text file.
- The script will convert the expression input into a dataframe of gene pair comparisons that will be used for prediction.
- The output file contains the samples, probability of each class, and the assigned class by the maximum probability.
 
 

------------------
For more information:

Tsoi J, Robert L, Paraiso K, Galvan C, Sheu KM, Lay J, Wong DJL, Atefi M, Shirazi R, Wang X, Braas D, Grasso CS, Palaskas N, Ribas A, Graeber TG. Multi-stage Differentiation Defines Melanoma Subtypes with Differential Vulnerability to Drug-Induced Iron-Dependent Oxidative Stress. Cancer Cell. 2018 May 14;33(5):890-904.e5. doi: 10.1016/j.ccell.2018.03.017. Epub 2018 Apr 12. PMID: 29657129; PMCID: PMC5953834.
https://pubmed.ncbi.nlm.nih.gov/29657129/
