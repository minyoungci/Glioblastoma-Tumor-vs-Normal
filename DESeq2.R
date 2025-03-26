# 설치
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DESeq2")

# 로딩
library(DESeq2)

counts <- read.csv("Result/combined_counts_df.csv", header = TRUE, row.names = 1)
condition <- factor(c("Tumor", "Tumor", "Tumor", "Normal", "Normal", "Normal"))
coldata <- data.frame(row.names=colnames(counts), condition=condition)

-----

# DESeq2로 분석 
library(DESeq2)

# DESeq2 데이터셋 생성
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)

# DESeq2 분석 실행
dds <- DESeq(dds)

# 결과 추출
res <- results(dds)

# 결과를 데이터프레임 형태로 변환
res_df <- as.data.frame(res)

# 결과를 CSV 파일로 저장
write.csv(res_df, file = "Result/DESeq2_results.csv")
