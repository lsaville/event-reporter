require 'queue'

class Print


end
header1 = "LAST NAME"
header2 = "FIRST NAME"
header3 = "EMAIL"
header4 = "ZIPCODE"
header5 = "CITY"
header6 = "STATE"
header7 = "ADDRESS"
header8 = "PHONE"
header9 = "DISTRICT"
#{sprintf("%20s", header)}
headers = "#{sprintf("%-20s", header1)}#{sprintf("%-20s", header2)}#{sprintf("%-20s", header3)}#{sprintf("%-20s", header4)}#{sprintf("%-20s", header5)}#{sprintf("%-20s", header6)}#{sprintf("%-20s", header7)}#{sprintf("%-20s", header8)}#{sprintf("%-20s", header9)}"
item1 = attendee.first_name
