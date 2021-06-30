
| Member               	| Role 	                 | Responsibilities                                                 |
|----------------------	|---------------------   | -------------                                                    |
| [Rob Bonovich](https://github.com/rbobo22)|  Project Manager and Dashboard Lead    	 |  Manage the Project, Presentation, Dashboard, Technology, and GitHub Repo   |
| [Nuphar Ezra](https://github.com/nupharezra)    	|  Machine Learning Lead         |  Manage the Machine Learning Model and Design                             |

**Software:**
- Pandas
- matplotlib
- scikit-learn
**Tools:**
- Jupyter Notebook
- GitHub
- AWS S3
- PostgreSQL / pdAdmin4
- Tableau

## Machine Learning

#### Provisional Model

Our provisional model used to identify trends within the data was a Linear Regression model, where collected the mean weekly sales across the years for each store independently. See graph below. As you can see, there are two large spikes in sales towards the end of the year across all stores, 
 Later in this project, we will test and compare the performance of other techniques to create a more optimized model.

#### Updated Model

After multiple trials, we have decided to use a Random Forest Regression Model. We have chosen to use this model because it is robust to outliers, works well on non-linear data, and estimates of what variables that are important in the classification. It should be recognized that a limitation of Random Forest Regressors is the tend to overfit for some datasets with noisy classification/regression tasks. The data is split into test and training by a ratio of 30:70. For the features, we chose to use the new features from the FRED data and as our target we selected weekly sales.

![Month_day_vs_Weekly_sales_per_year.png](Month_day_vs_Weekly_sales_per_year.png)
