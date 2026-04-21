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
> model <- lm(MMSE ~ EDUC + Group, data = cleaned_oasis)
> hist(model$residuals, main = "Model Residuals", xlab = "Residual", col = "light blue", right = F)
> plot(model$fitted.values, model$residuals, xlab = "Fitted Values", ylab = "Residuals", main = "Residual Plot", pch = 20)
> abline(h = 0, col = "red")
> summary(model)

Call:
lm(formula = MMSE ~ EDUC + Group, data = cleaned_oasis)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.8474 -1.0755 -0.0093  0.9760  5.1526 

Coefficients:
                 Estimate Std. Error t value
(Intercept)      24.25863    1.27455   19.03
EDUC              0.04906    0.09092    0.54
GroupNondemented  4.17659    0.51821    8.06
                 Pr(>|t|)    
(Intercept)        <2e-16 ***
EDUC                0.591    
GroupNondemented    2e-12 ***
---
Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1
  ‘ ’ 1

Residual standard error: 2.473 on 97 degrees of freedom
Multiple R-squared:  0.4343,	Adjusted R-squared:  0.4226 
F-statistic: 37.23 on 2 and 97 DF,  p-value: 1.001e-12

> summary(model)$adj.r.squared
[1] 0.422635
> library(ggplot2)
> ggplot(cleaned_oasis, aes(x = EDUC, y = MMSE, col = Group, shape = Group)) + 
+     geom_point() + xlab("Years of Education") + ylab("MMSE Score") + 
+     labs(col = "Diagnostic Group", shape = "Diagnostic Group") + ggtitle("MMSE Score by Diagnostic Group and Years of Education") + 
+     theme_classic() + scale_color_manual(values = c("lightblue", "lightpink")) + geom_line(aes(y = yhat))
