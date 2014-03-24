#"******************************************************************************
#@Author					:  Pavan
#@Description		  :  OX Mail Login
#@Version				  :  0.1
#@Date					  :  24/03/2014
#@Reviewed By     :
#"******************************************************************************
    # Header Files
    require 'rubygems'
    require 'logger'
    require "watir-webdriver"
    require "test/unit"

  #Declaring variables
 
  Webmail_username = 'test@inspectionspark11.com'    # Add username
  Webmail_pw = 'Glow@12'                            # Add PassWord
  property = "ipage"                                 # Add Property Name
  OX_Mail_login = "https://email."+property+".com/ox6/ox.html" # Mail LoginURL
  sleep 5
  puts Time.now,''
  browser = Watir::Browser.new(:firefox)

 #OX Mail Login
 
  browser.goto(OX_Mail_login)
  browser.text_field(:id,"username").wait_until_present
  browser.text_field(:id,"username").set(Webmail_username)
  browser.text_field(:id, "password").set(Webmail_pw)
  browser.button(:id, "inner-login-button").click
  sleep 5

# Mail Box Login error message validation

  if browser.tr(:id,"loginStatus").present?
  h1=browser.tr(:id,"loginStatus").text
 
    if browser.text.include? h1
    puts 'Login failed. Please check your user name and password and try again.'
    browser.close
    end
    end
    sleep 5
    browser.img(:src, "v=OWQ6BI4/themes/default/icons/24/mod_mail.png")
           .wait_until_present
    if browser.img(:src, "v=OWQ6BI4/themes/default/icons/24/mod_mail.png")
              .present?
    puts "Sucessfully logged into WebMail"
    else
    puts "WebMail Logging into FAIL"
    browser.close
    end
  browser.img(:src, "v=OWQ6BI4/themes/default/icons/24/mod_mail.png").click
  browser.td(:class,"oxTreeNodeTitle").click
  browser.span(:title, "Logout").wait_until_present
  browser.span(:title, "Logout").click
  sleep 5
  puts 'Sucessfully logged out from OX-Mail'
 
  puts Time.now,''
    