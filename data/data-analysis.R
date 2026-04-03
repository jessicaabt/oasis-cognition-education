> cleaned_oasis <- read.csv("~/SDS 320e Project/cleaned_oasis.csv")
>   View(cleaned_oasis)
> hist(cleaned_oasis$MMSE, xlab='MMSE Score', main='Distribution of MMSE Scores', right=FALSE, col='lightblue')
> fivenum(cleaned_oasis$MMSE)
[1] 17.0 25.5 29.0 29.0 30.0
> mean(cleaned_oasis$MMSE)
[1] 27.05
> hist(cleaned_oasis$EDUC, xlab='Years of Education', main='Distribution of Years of Education', right=FALSE, col='lightblue')
> fivenum(cleaned_oasis$EDUC)
[1]  6 12 14 16 23
> mean(cleaned_oasis$EDUC)
[1] 14.33
> plot(cleaned_oasis$EDUC, cleaned_oasis$MMSE, xlab='Years of Education', ylab='MMSE Score', main='Years of Education and MMSE Score', pch=16)
> barplot(table(cleaned_oasis$Group), ylab='Frequency', main='Counts of Diagnostic Group', col='lightblue')
> boxplot(MMSE~Group, data=cleaned_oasis, ylab='MMSE Score', main='MMSE Score Distribution Between Diagnostic Groups', col=c('lightblue', 'lightpink'))
> fivenum(cleaned_oasis$MMSE[cleaned_oasis$Group == "Demented"])
[1] 17.0 23.0 25.5 27.0 30.0
> mean(cleaned_oasis$MMSE[cleaned_oasis$Group == "Demented"])
[1] 24.92
> fivenum(cleaned_oasis$MMSE[cleaned_oasis$Group == "Nondemented"])
[1] 26 29 29 30 30
> mean(cleaned_oasis$MMSE[cleaned_oasis$Group == "Nondemented"])
[1] 29.18
