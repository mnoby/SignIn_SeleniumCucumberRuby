@SignInAmazon
Feature: Sign In to Amazon Website

@ValidDataLogIn @withEmailAddress
Scenario Outline: User want to log in to Amazon
Given User open amazon.com
And User Click Sign In
Then User input email or phone number "<email>" 
And User Click Continue
Then User input password "<password>"
And User Click Submit Password
Examples:
|email                     | password          |   
|input_your_valid_email     | input_your_valid_pass |

@ValidDataLogIn @withPhoneNumber
Scenario Outline: User want to log in to Amazon
Given User open amazon.com
And User Click Sign In
Then User input email or phone number "<phone>" 
And User Click Continue
Then User input password "<password>"
And User Click Submit Password
Examples:
|phone                       | password          |   
|input_your_valid_phoneNumber | input_your_valid_pass |

@InValidDataLogIn @UsingWrongPassword
Scenario Outline: User want to log in to Amazon
Given User open amazon.com
And User Click Sign In
Then User input email or phone number "<phone>" 
And User Click Continue
Then User input password "<password>"
And User Click Submit Password
Examples:
|phone                     | password          |   
|input_your_valid_email/Phone | testing           |

