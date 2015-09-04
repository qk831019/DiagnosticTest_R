require(lmtest)
require(tseries)
require(usdm)
require(ROCR)
require(sandwich)
require(robust)
require(nortest)

## Diagnostic Plots
par(mfrow=c(2,2))
plot(loss1Model_7,which=1:4)
## Additional Statistical Test

## residual normality:
residual <- resid(loss1Model_7)
## Anderson Darling
ad.test(residual)
## KS Test
ks.test(residual,"pnorm")
## Shapiro Wilks
shapiro.test(residual)

## Residual autocorrelation
dwtest(loss1Model_7)

## homoscedasticity
bptest(loss1Model_7)

## Collinearity
vif(loss1Df[,variable.names(loss1Model_7)[-c(1,length(variable.names(loss1Model_7)))]])

## stationarity
adf.test(residual,k=0)
adf.test(residual,k=1)
adf.test(residual,k=2)
adf.test(residual,k=3)
adf.test(residual)
