### SAJ DATA COLLECTOR BY SEMATpl - Sebastian Matuszewski ###



from seleniumwire import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import time
import pickle

# Config for headless mode
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode (no graphical interface)
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# WebDriver init (Chrome)
driver = webdriver.Chrome(options=chrome_options)

# Open eop SITE
driver.get("https://eop.saj-electric.com/login")

# Find login fields with a specific ID
username_field = driver.find_element(By.CSS_SELECTOR, "div:nth-child(1) > .el-form-item:nth-child(1) .el-input__inner")  # Username field
password_field = driver.find_element(By.CSS_SELECTOR, ".form-item-input:nth-child(1) > .el-input__inner")  # Password field

#User credentials
username_field.send_keys("YOUR EMAIL")  # YOUR EMAIL
password_field.send_keys("YOUR PASSWORD")  # YOUR PASSWORD

# Find login button and click
login_button = driver.find_element(By.CSS_SELECTOR, ".submit")  # Login button selector
login_button.click()

# Sleep 5 second (for test)
time.sleep(5)

# Login verification

if "https://eop.saj-electric.com/index" in driver.current_url:  # Site for login check.
    print("Login successful!")

    cookies = driver.get_cookies()  # Get cookies
    with open("cookies.pkl", "wb") as cookie_file:
        pickle.dump(cookies, cookie_file)

    print("Cookies saved to file.")


    for request in driver.requests:
       print(request.headers['Authorization'])


else:
    print("Login failure!")

# Close webbrowser
driver.quit()