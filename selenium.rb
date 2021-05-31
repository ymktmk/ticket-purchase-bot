require 'selenium-webdriver'
require 'securerandom'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://t.livepocket.jp/login?acroot=header-res-new_p_u_nl'
driver.find_element(:name, 'login').send_keys ''

driver.find_element(:name, 'password').send_keys ''

driver.find_element(:name, 'action').click
# ログイン完了
sleep 2

# 購入したいチケットのURL
driver.navigate.to "https://t.livepocket.jp/e/a9y22"

select = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'ticket-388833'))
select.select_by(:value, '1')

driver.find_elements(:tag_name, 'button')[2].click

# 支払い方法
driver.find_element(:id, 'other_payment_method_select_img').click

# コンビニ選択
select = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'cvs_select'))
select.select_by(:value, '002')

# 同意
driver.find_element(:id, 'agreement_check_lp').click

# 購入
driver.find_element(:name, 'sbm').click
