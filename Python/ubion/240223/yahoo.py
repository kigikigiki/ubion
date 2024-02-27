from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup as bs
import time
import pandas as pd

driver = webdriver.Chrome()

driver.get('https://www.naver.com')

element = driver.find_element(By.ID, 'query')

element.send_keys("야후파이낸스")

element.send_keys(Keys.ENTER)

time.sleep(1)

element2 = driver.find_element(By.CLASS_NAME, 'link_name')
element2.click()

time.sleep(1)

driver.switch_to.window(driver.window_handles[1])

element3 = driver.find_element(By.XPATH, '//*[@id="Nav-0-DesktopNav-0-DesktopNav"]/div/div[3]/div/nav/ul/li[3]/a')

element3.click()

time.sleep(4)

element4 = driver.find_element(By.XPATH, '//*[@id="SecondaryNav-0-SecondaryNav-Proxy"]/div/ul/li[3]/a')
element4.click()

time.sleep(4)
soup = bs(driver.page_source, 'html.parser')

driver.quit()

table_data = soup.find('table')

thead_data = table_data.find("thead")

th_list = thead_data.find_all("th")

_cols = []

for col in th_list :
    #print(col.get_text())
    _cols.append(col.get_text())

tbody_data = table_data.find('tbody')

tr_list = tbody_data.find_all('tr')

_values = []

for tr in tr_list:
    td_list = tr.find_all('td')
    td_data = []
    for td in td_list :
        td_data.append(td.get_text())
    _values.append(td_data)

df = pd.DataFrame(_values, columns = _cols)
df.to_csv('yfinance_data.csv', mode='a', header=False)