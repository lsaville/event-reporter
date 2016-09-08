require './lib/que'

class Output
  attr_reader :headers

  def headers
    puts "#{sprintf("%-12s", "LAST NAME")}#{sprintf("%-14s", "FIRST NAME")}#{sprintf("%-38s", "EMAIL")}#{sprintf("%-10s", "ZIPCODE")}#{sprintf("%-20s", "CITY")}#{sprintf("%-10s", "STATE")}#{sprintf("%-50s", "ADDRESS")}#{sprintf("%-13s", "PHONE")}#{sprintf("%-5s", "DISTRICT")}"
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
    print_set = set.sort_by do |attendee|
      attendee.send(attribute)
    end
    people(print_set)
  end
end
