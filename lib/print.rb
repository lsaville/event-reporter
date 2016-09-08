require './lib/que'

class Print
  attr_reader :headers
  def headers
    item1 = "LAST NAME"
    item2 = "FIRST NAME"
    item3 = "EMAIL"
    item4 = "ZIPCODE"
    item5 = "CITY"
    item6 = "STATE"
    item7 = "ADDRESS"
    item8 = "PHONE"
    item9 = "DISTRICT"
    puts "#{sprintf("%-12s", item1)}#{sprintf("%-14s", item2)}#{sprintf("%-38s", item3)}#{sprintf("%-10s", item4)}#{sprintf("%-20s", item5)}#{sprintf("%-10s", item6)}#{sprintf("%-50s", item7)}#{sprintf("%-13s", item8)}#{sprintf("%-5s", item9)}"
  end

  def people(set)
    headers
    set.each do |attendee|
      item1 = attendee.last_name
      item2 = attendee.first_name
      item3 = attendee.email
      item4 = attendee.zipcode
      item5 = attendee.city
      item6 = attendee.state
      item7 = attendee.street
      item8 = attendee.phone
      item9 = attendee.district
      puts "#{sprintf("%-12s", item1)}#{sprintf("%-14s", item2)}#{sprintf("%-38s", item3)}#{sprintf("%-10s", item4)}#{sprintf("%-20s", item5)}#{sprintf("%-10s", item6)}#{sprintf("%-50s", item7)}#{sprintf("%-13s", item8)}#{sprintf("%-5s", item9)}"
    end
  end

  def people_by(set, attribute)
    
end
