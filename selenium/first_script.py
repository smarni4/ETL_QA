from selenium import webdriver
from selenium.webdriver.common.by import By
import time


def test_case():

    driver = web_setup()

    title = driver.title
    assert title == "Web form"
    driver.implicitly_wait(0.5)

    text_box = driver.find_element(by=By.NAME, value="my-text")
    submit_button = driver.find_element(by=By.CSS_SELECTOR, value="button")

    text_box.send_keys("Selenium")
    time.sleep(10)
    submit_button.click()

    message = driver.find_element(by=By.ID, value="message")
    text = message.text
    assert text == "Received!"
    
    teardown(driver)


def web_setup():

    driver = webdriver.Chrome()
    driver.get("https://www.selenium.dev/selenium/web/web-form.html")
    return driver


def teardown(driver):
    
    driver.quit()

