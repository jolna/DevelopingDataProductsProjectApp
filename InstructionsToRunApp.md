# DevelopingDataProductsProjectApp

Training Sample Percentage Evaluation App:
Prequisite;
   RStudio verion 3.2.3 or later
   libraries: shiny, MASS for the Boston housing data, ggplot2
   
1) To run this app, please download the ui.R and server.R into a folder in your local directory.
2) If you have not already installed, please install the "Shiny" package using the following command
   in your RStudio
     install.packages("shiny")
3) After installing set the working directory to the folder in which you downloaded the "ui" and "server" R files
4) Open the file "ui.R" file in your RStudio and do either one of the following
     . Click "Run App' 
     . or type "runApp()" in your console
5) The app loads 3 libraries: MASS for the Boston housing data, ggplot2 for the chart and shiny
6) This app generates a simple linear model from a trainset determined by the percentage in the slider. It uses
   the generated model to predict the "Median value of owner occupied homes" on the remaining holdout or testset data.
   The prediction is then presented visually with a plot between the "Actual' median value in the testset and the
   model predicted "Modeled" value for the testset.
   A R-Squared value is also presented to show the quality of the fit, whose value range from 0 to 1. Higher R Squared
   usually represents a better fit. We use this and the fit of the chart to determine the sampling percentage.
6) This app starts off with a default chart with a fit between the actual(shown in Red) and modelled(shown in blue) 
   data for the test set data that has
   been withheld from a linear model training of the Boston housing data.
   The default traing set sampling percentage is 75%. The slider provides a way to change the training sample percentage
   between 60% and 90%. After changing the slider, please click the "Submit" button to see the new model fit.
   Please note the R-Squared value for the model changes along with the chart when you submit.
 7) Optionally if you wish to see the number of rows in the dataset and training set, use the checkbock "Show Training Info" which can
    be checked, followed by a "submit" click to view that information. Same is the case with the "Show modeled R squared"
 8) The percentage determine could then be used to do other detailed analysis and modeling using advance machine learning algorithms.
    
    