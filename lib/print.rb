require './lib/que'

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
template = "#{sprintf("%-12s", item1)}#{sprintf("%-14s", item2)}#{sprintf("%-38s", c)}#{sprintf("%-10s", header4)}#{sprintf("%-20s", header5)}#{sprintf("%-10s", header6)}#{sprintf("%-50s", header7)}#{sprintf("%-13s", header8)}#{sprintf("%-5s", header9)}"
item1 = attendee.first_name
