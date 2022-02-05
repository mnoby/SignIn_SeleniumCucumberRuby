
include Test::Unit::Assertions
$signIn_btn = 'nav-link-accountList-nav-line-1' #id
$field_email = 'email'  #name
$field_pass = 'password' #name
$continue_btn = 'continue' #id
$submit_btn = 'signInSubmit' #id
$alert_exist = '//*[@id="authportal-main-section"]/div[2]/div/div[1]/div/div/div/p' #xpath
$amazon_logo = 'nav-logo-sprites' #id
$alert_incorrect_pass = 'a-list-item' #class
$wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def click_SignIn()
     $browser.find_element(:id,$signIn_btn).click if $wait.until {
        $browser.find_element(:id, $amazon_logo).displayed?
     }
end

def input_email(email)
    $browser.find_element(:name, $field_email).send_keys(email) if $wait.until {
    $browser.find_element(:id, $continue_btn).displayed?
    }
    $storeEmail = email
end

def click_continue()
    $browser.find_element(:id, $continue_btn).click
end

def input_password(password)
    el = $browser.find_element(:name, $field_pass)
    el.send_keys(password) if $wait.until{
        el.displayed?
    } 
    @storePass = password
end

def click_Submit()
    $browser.find_element(:id, $submit_btn).click
end

def validation()
    if @storePass == "change_to_your_valid_pass"
        $wait.until {$browser.find_element(:id, $amazon_logo).displayed?}
        web_title = $browser.title
        print "Log In Success. Page Title is" , web_title
    else 
        alert_caption = $browser.find_element(:class, $alert_incorrect_pass).text
        assert(alert_caption.include?("Your password is incorrect"))
        puts "Log in Failed"
    end
end

    
