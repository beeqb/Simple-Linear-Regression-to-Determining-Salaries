# Simple Linear Regression. Do companies really consider years of experience to determine a potential employee's salary?

#R code


# let's Preprocess the data first. 
#Setting work directory 


# Step 1 Importing the dataset
dataset = read.csv('Salary_Data.csv')
View(dataset)




# Step 2: Splitting the dataset into the Training set and Test set
install.packages('caTools') 
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary..in.US.., SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



#Step 3:  Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary..in.US.. ~ Duration.of.Work.Experience..in.Years.,
               data = training_set)

# Step 4: Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Step 5:  Visualising the Training set results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$Duration.of.Work.Experience..in.Years., y = training_set$Salary..in.US..),
             colour = 'blue') +
  geom_line(aes(x = training_set$Duration.of.Work.Experience..in.Years., y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Duration of Work Experience v/s Salar (in USD) (Training set)') +
  xlab('Work Experience (in years)') +
  ylab('Salary (in USD)')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$Duration.of.Work.Experience..in.Years., y = test_set$Salary..in.US..),
             colour = 'red') +
  geom_line(aes(x = training_set$Duration.of.Work.Experience..in.Years., y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Work Experience (in years) (Test set)') +
  xlab('Work Experience (in years)') +
  ylab('Salary (in USD)')



