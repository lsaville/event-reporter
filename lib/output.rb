require './lib/que'
require 'erb'
require 'csv'

class Output
  attr_reader :headers, :html

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

  def html(set, filename)
    template_html = File.read "template.erb"
    erb_template = ERB.new template_html
    html = erb_template.result(binding)

    Dir.mkdir("output") unless Dir.exists? "output"

    filename = "output/#{filename}"

    File.open(filename, 'w') do |file|
      file.puts html
    end
  end

  def csv(set, filename)
    prep = set.map do |attendee|
      [attendee.first_name, attendee.last_name, attendee.email, attendee.phone, attendee.street, attendee.city, attendee.state, attendee.zipcode, attendee.reg_date, attendee.district]
    end

    Dir.mkdir("output") unless Dir.exists? "output"

    filename = "output/#{filename}"

    CSV.open(filename, 'wb') do |csv|
      csv << ["First_Name","Last_Name","Email_Address","Home_Phone","Street","City","State","Zipcode","Reg_Date","District"]
      prep.each do |attendee|
        csv << attendee
      end
    end
  end

end
