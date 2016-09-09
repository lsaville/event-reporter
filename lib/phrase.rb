module Phrase
  def self.help
    puts "******************************************"
    puts "Here are your choices:\nhelp\nload\nfind\nqueue count\nqueue clear\nqueue district\nqueue print\nqueue print by\nqueue save to\nqueue export html"
  end

  def self.load
    puts "\nLoads the program with data so you can search it. Optional filename.\nuse:  'load full_attendees.csv'\n"
  end

  def self.count
    puts "\nDisplays the number of items in the queue\nuse:  'queue count'\n"
  end

  def self.clear
    puts "\nClears the current queue.\nuse:  'queue clear'\n"
  end

  def self.district
    puts "\nIf there are less than 10 items in the queue, will fetch district data for those items.\nuse:  'queue district'\n"
  end

  def self.print
    puts "\nPrints the contents of the queue to the screen.\nuse:  'queue print'\n"
  end

  def self.print_by
    puts "\nPrints the contents of the queue sorted by a provided attribute.\nuse:  'queue print by <attribute>''\n"
  end

  def self.save
    puts "\nSave the contents of the queue to your_file_name.csv, filename required as option\nuse:  'queue save to <filename.csv>'\n"
  end

  def self.export
    puts "\nExport the contents of the queue to an html file, filename required.\nuse:  'queue export html <filename.html>\n"
  end

  def self.find
    puts "\nFind works to populate the queue by searching through the data by attribute and criteria.\nuse:  'find <attribute> <criteria>'\n"
  end

  def self.help_help
    puts "\nYou've already found it!\n"
  end
end
