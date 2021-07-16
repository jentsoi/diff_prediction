#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
testFile=args[1]
outputPredictionFile=args[2]

if (length(args)==0) {
  stop("Input file needs to be supplied", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  outputPredictionFile = "Prediction_output.txt"
} else if(length(args)==2) {
    testFile=args[1]
    outputPredictionFile=args[2]
  }

# Load library and prediction model
library(kernlab)
load("PredictionModel.RData")

# Prepare test data set
testData=read.delim(testFile,row.names=1,stringsAsFactors=F,check.names=F)
genepairListIndex=lapply(genepairList, function(x){
  if(length(intersect(rownames(testData),x))==2) sapply(x,function(g) which(rownames(testData)== g)) else NA })
testDataList=as.list(testData)
testDataGPList=lapply(testDataList,function(x) sapply(genepairListIndex,function(g){
  if(!all(is.na(g))) as.numeric(x[g[1]]>x[g[2]]) else 0 }))
testDataGP=do.call(cbind,testDataGPList)
       
# Make predictions     
testPredictions=data.frame("Sample"=colnames(testDataGP),"class"=predict(ksvm.prob,t(testDataGP),type="prob"),check.names=F)
clustertypes=c("Undifferentiated","Neural crest-like","Transitory","Melanocytic")
testPredictions$class=apply(testPredictions[,2:5],1,function(x) clustertypes[which.max(x)])
write.table(testPredictions,outputPredictionFile,sep='\t',row.names=F,quote=F)
