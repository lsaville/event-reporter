require 'open-uri'
require 'json'

class District
  def find_district(set)
    set.each do |attendee|
      zipcode = attendee.zipcode
      url = "https://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=3321d49851c347e284a0c20c2c73f2d4"
      data = JSON.parse(open(url).read)
      attendee.district = data["results"][0]["district"]
    end
  end
end
