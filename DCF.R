# DISCOUNTED CASH FLOW MODEL



# access Quandl's API 
Quandl.api_key('Sp7tA8SGPyjyqrzkssRT')

# get SHARADAR information from Quandl
data_amd <- Quandl.datatable('SHARADAR/SF1', dimension="ART", ticker='AMD', paginate = T)
# convert Quandl information to dataframe
data_amd <- data.frame(data_amd)
# add quarters to the tabke
data_amd$quarter <- quarters(data_amd$reportperiod)


# create subsets

# recent 2018 subset
recent_subset <- subset(data_amd, data_amd$reportperiod == "2018-06-30")
recent_subset
# 2017 subset
subset_2017 <- subset(data_amd, data_amd$reportperiod == "2017-07-01")
# 2016 subset
subset_2016 <- subset(data_amd, data_amd$reportperiod == "2016-06-25")
# 2015 subset
subset_2015 <- subset(data_amd, data_amd$reportperiod == "2015-06-27")
# 2014 subset
subset_2014 <- subset(data_amd, data_amd$reportperiod == "2014-06-28")
# 2013 subset
subset_2013 <- subset(data_amd, data_amd$reportperiod == "2013-06-29")






# get EBITDA 

ebit_data <- data_amd$ebit
data_ebit_period <- data_amd[,c("reportperiod","ebit", "quarter")]
data_ebit_period
recent_ebit <- recent_subset$ebit
recent_ebit
# taxes
taxes_data <- data_amd$taxexp
recent_taxes_data <- recent_subset$taxexp
#capex
capex_data <- data_amd$capex
recent_capex_data <- recent_subset$capex
# depreciation and amort
depr_amor <- data_amd$depamor
recent_depr_amor <- recent_subset$depamor
# working capital
working_capital <- data_amd$workingcapital
recent_working_capital <- recent_subset$workingcapital
working_capital_2017 <- subset_2017$workingcapital
# cash
cash_data <- data_amd$cashneq
recent_cash_data <- recent_subset$cashneq
cash_2017 <- subset_2017$cashneq




#forcast should be build up to unlevered free cash flow (FCFF)
# **********
# calculate changes in non-cash working capital 
ncwc_recent <- recent_working_capital - recent_cash_data
ncwc_old <- working_capital_2017 - cash_2017
# find two year change/increase
change_ncwc <- ncwc_recent - ncwc_old
# change formula on ncwc from present date amd ncwc from two years ago





#calculate FCFF; ebit = ebit, t = taxes, dep_and_amort = depreciation and amortization, change_NCWC = increases in noncash working capital
#fcff_funct <- formula(ebitda, t, capex, dep_and_amort, increase_ncwc){
    #fcff <- (ebitda - t - capex + dep_and_amort - increase_ncwc)
#}

#fcff_funct(recent_ebitda, recent_taxes_data, recent_capex_data, recent_depr_amor, change_ncwc)

recent_fcff <- (recent_ebitda - recent_taxes_data - recent_capex_data + recent_depr_amor - change_ncwc)
recent_fcff
