# access Quandl with api key
Quandl.api_key('Sp7tA8SGPyjyqrzkssRT')




#get revenue statistics
revenue_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('revenue'))
revenue_data <- data.frame(revenue_data)


# get eps statistics
eps_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('eps'))
eps_data <- data.frame(eps_data)



# get ROIC statistics
roic_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('roic'))
roic_data <- data.frame(roic_data)


# get ROE statistics
roe_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('roe'))
roe_data <- data.frame(roe_data)


# get ROA statistics
roa_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('roa'))
roa_data <- data.frame(roa_data)


# get total_debt statistics
total_debt_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('debt'))
total_debt_data <- data.frame(total_debt_data)


# get EBITDA statistics
ebitda_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('ebitda'))
ebitdat_data <- data.frame(ebitda_data)


# get P/E statistics
p_e_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('pe'))
p_e_data <- data.frame(p_e_data)


# get CAPEX statistics
capex_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('capex'))
capex_data <- data.frame(capex_data)


# get net income statistics
ni_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('netinc'))
ni_data <- data.frame(ni_data)


# get net margin statistics
net_margin_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('netmargin'))
net_margin_data <- data.frame(net_margin_data)



# get rnd statistics
rnd_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('rnd'))
rnd_data <- data.frame(rnd_data)



# get working capital statistics
working_capital_data <- Quandl.datatable('SHARADAR/SF1', ticker='NVDA', qopts.columns=('workingcapital'))
working_capital_data <- data.frame(working_capital_data)





# select the min, max, and mean of the retrieved statistics


# revenue
print('Revenue Statistics: ')
min(revenue_data)
max(revenue_data)
mean_revenue <- mean(revenue_data[,1])
mean_revenue

# net income statistics
print('Net Income Statistics: ')
min(ni_data)
max(ni_data)
mean(ni_data[,1])

# net margin statistics
print('Net Margin Statistics')
min(net_margin_data)
max(net_margin_data)
mean(net_margin_data[,1])

# EPS statistics
print('EPS Statistics: ')
min(eps_data)
max(eps_data)
mean(eps_data[,1])

# P/E statistics
print('P/E Statistics: ')
min(p_e_data)
max(p_e_data)
mean(p_e_data[,1])

# ROE statistics
print('ROE Statistics: ')
min(roe_data)
max(roe_data)
mean(roe_data[,1])

# ROA statistics
print('ROA Statistics: ')
min(roa_data)
max(roa_data)
mean(roa_data[,1])

# net working capital statistics
print('Net Working Capital Statistics: ')
min(working_capital_data)
max(working_capital_data)
mean(working_capital_data[,1])

# CAPEX statistics
print('CAPEX Statistics: ')
min(capex_data)
max(capex_data)
mean(capex_data[,1])

# EBITDA statistics
print('EBITDA Statistics: ')
min(ebitda_data)
max(ebitda_data)
mean(ebitda_data[,1])

# Total Debt statistics
print('Total Debt Statistics: ')
min(total_debt_data)
max(total_debt_data)
mean(total_debt_data[,1])








