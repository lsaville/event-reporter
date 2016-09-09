require 'open-uri'
require 'json'


url = "https://maps.googleapis.com/maps/api/geocode/json?address=3220+Williams+St,+Denver,+CO&key=AIzaSyD9sZ9I99m59vVAy7D2vlSlNml70nOly9E"
data = JSON.parse(open(url).read)
require "pry"; binding.pry
