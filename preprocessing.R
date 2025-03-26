# R 코드 예시
library(DESeq2)

counts <- read.csv("combined_counts.csv", row.names = 1)
condition <- factor(c("Tumor","Tumor","Tumor","Normal","Normal","Normal"))

coldata <- data.frame(row.names=colnames(counts), condition=condition)

dds <- DESeqDataSetFromMatrix(countData=counts, colData=coldata, design=~condition)
dds <- DESeq(dds)

res <- results(dds)
res_df <- as.data.frame(res)

write.csv(res_df, file="DESeq2_results.csv")
