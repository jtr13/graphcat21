
# 1. Load the birth-data-for-alluvial.csv file 
# 2. Run the data cleaning code 
# 3. Make an alluvial diagram that will give you the mother's weight quartile pre-pregnancy as the first state and the mother's weight gain quartile at pregnancy
# 4. Pick a color scheme 

# Variables
# user_id: randomly generated user id        
# pre_weight: weight of mother befofe pregnancy      
# pre_weight_cat: weight of mother befofe pregnancy split into quartiles  
# weight_gain: weight gain of mother during pregnancy        
# weight_gain_cat: weight gain of mother during pregnancy split into quartiles   
# mother_age: mother's age at start of pregnancy

library(tidyverse)

## Read in data 
birth_data <- readr::read_csv("birth-data-for-alluvial.csv")