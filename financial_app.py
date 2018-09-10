"""
@Will Reynolds 2018
this is a financial data gathering and manipulation program.

"""


# import libraries

import requests
from bs4 import BeautifulSoup
import pandas as pd
from IPython.core.display import clear_output
from time import sleep
from random import randint
import numpy as np


# web roots

bloomberg_root = 'https://www.bloomberg.com/quote/{}:US'
yahoo_url = 'https://finance.yahoo.com/quote/{}'

yahoo_key_stats_url = 'https://finance.yahoo.com/quote/{}/key-statistics?p={}'


# stocks list
stocks = []
## lists


# basic lists
ticker = []
previous_close = []
volume = []
avg_volume = []
market_cap = []
beta = []
p_e_ratio_ttm = []
eps = []

# valuation measures
enterprise_value = []
forward_p_e = []
# profitability
profit_margin = []
operating_margin = []
# mgmt
return_on_assets = []
return_on_equity = []
# income statement
revenue = []
quarterly_revenue_growth = []
gross_profit = []
ebitda = []
quarterly_earnings_growth = []
# balance sheet
total_cash = []
total_debt = []
total_debt_to_equity = []
current_ratio = []
# cash flow
operating_cash_flow = []

# price history
year_change = []
sp500_year_change = []
fifty_day_moving_average = []
twohundred_day_moving_average = []
# share stats
avg_vol_three_months = []
avg_vol_ten_days = []
shares_outstanding = []
# dividends
five_year_avg_dividend_yield = []
pay_out_ratio = []


# get stocks
while True:
    clear_output(wait = True)
    response = input('Enter stock ticker: ')
    stocks.append(response)
    clear_output(wait = True)
    print('current list: ', stocks)
    ask = input('Would you like to enter more tickers? (y/n) ')
    if ask.lower() == 'n':
        clear_output(wait = True)
        print('current list: ', stocks)
        break
    else:
        clear_output(wait = True)

# iterates through list of stocks
for i in stocks:
    # request
    page = requests.get(yahoo_url.format(i))

    # control crawl rate
    print("working...")
    sleep(np.random.randint(3))

    # soup
    soup = BeautifulSoup(page.content, 'html.parser')

    # isolate td
    td_group = soup.find_all('td')

    # select information
    ticker.append(i.upper())
    previous_close.append(td_group[1].get_text())
    volume.append(td_group[13].get_text())
    avg_volume.append(td_group[15].get_text())
    market_cap.append(td_group[17].get_text())
    beta.append(td_group[19].get_text())
    p_e_ratio_ttm.append(td_group[21].get_text())
    eps.append(td_group[23].get_text())






# iterates through list of stocks to gather key statistics from yahoo
for i in stocks:
    # request
    page = requests.get(yahoo_key_stats_url.format(i,i))

    # control crawl rate
    print("Working...")
    sleep(np.random.randint(3))

    # soup
    soup = BeautifulSoup(page.content, 'html.parser')

    # isolate td
    td_group = soup.find_all('td')

    # select information
    enterprise_value.append(td_group[3].get_text())
    forward_p_e.append(td_group[7].get_text())
    profit_margin.append(td_group[23].get_text())
    operating_margin.append(td_group[25].get_text())
    return_on_assets.append(td_group[27].get_text())
    return_on_equity.append(td_group[29].get_text())
    revenue.append(td_group[31].get_text())
    quarterly_revenue_growth.append(td_group[35].get_text())
    gross_profit.append(td_group[37].get_text())
    ebitda.append(td_group[39].get_text())
    quarterly_earnings_growth.append(td_group[45].get_text())
    total_cash.append(td_group[47].get_text())
    total_debt.append(td_group[51].get_text())
    total_debt_to_equity.append(td_group[53].get_text())
    current_ratio.append(td_group[55].get_text())
    operating_cash_flow.append(td_group[59].get_text())
    year_change.append(td_group[65].get_text())
    sp500_year_change.append(td_group[67].get_text())
    fifty_day_moving_average.append(td_group[73].get_text())
    twohundred_day_moving_average.append(td_group[75].get_text())
    avg_vol_three_months.append(td_group[77].get_text())
    avg_vol_ten_days.append(td_group[79].get_text())
    shares_outstanding.append(td_group[81].get_text())
    five_year_avg_dividend_yield.append(td_group[107].get_text())
    pay_out_ratio.append(td_group[109].get_text())






stock_df = pd.DataFrame({'ticker':ticker,
                         'previous close' : previous_close,
                         'volume' : volume,
                         'avg volume' : avg_volume,
                         'market cap' : market_cap,
                         'beta' : beta,
                         'p/e ratio' : p_e_ratio_ttm})
stock_df = stock_df.set_index('ticker')





# creates pandas dataframes of key valuation, profitability, and management statistics
key_stats_valuation_profitability_management = pd.DataFrame({'ticker' : ticker,
                                                            'enterprise value' : enterprise_value,
                                                            'forward p/e' : forward_p_e,
                                                            'profit margin' : profit_margin,
                                                            'operating margin' : operating_margin,
                                                            'return on assets' : return_on_assets,
                                                            'return on equity' : return_on_equity})
# key valuation, profitability, and management statistics
key_stats_valuation_profitability_management = key_stats_valuation_profitability_management.set_index('ticker')


# creates pandas dataframes of key income, balance sheet, and cash flow statistics
key_stats_income_balance_cash = pd.DataFrame({'ticker' : ticker,
                                             'revenue' : revenue,
                                             'quarterly revenue growth' : quarterly_revenue_growth,
                                             'gross profit' : gross_profit,
                                             'ebitda' : ebitda,
                                             'quarterly earnings growth' : quarterly_earnings_growth,
                                             'total cash' : total_cash,
                                             'total debt' : total_debt,
                                             'debt to equity' : total_debt_to_equity,
                                             'current ratio' : current_ratio,
                                             'operating cash flow' : operating_cash_flow})
# key income and balance sheet statistics
key_stats_income_balance_cash = key_stats_income_balance_cash.set_index('ticker')



# creates pandas dataframes of key price statistics
key_stats_price = pd.DataFrame({'ticker' : ticker,
                               'yearly change' : year_change,
                               's&p500 yearly change' : sp500_year_change,
                               '50 day moving avg' : fifty_day_moving_average,
                               '200 day moving avg' : twohundred_day_moving_average,
                               'avg volume (3 months)' : avg_vol_three_months,
                               'avg volume (10 days)' : avg_vol_ten_days,
                               'shares outstanding' : shares_outstanding,
                               '5 year avg dividend yield' : five_year_avg_dividend_yield,
                               'pay out ratio' : pay_out_ratio})
# key price statistics
key_stats_price = key_stats_price.set_index('ticker')


print(stock_df)
print(key_stats_valuation_profitability_management)
print(key_stats_income_balance_cash)
print(key_stats_price)