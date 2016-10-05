class Entry
  attr_accessor :name, :phone_number, :email
  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  def print
    puts "Name: " + @name
    puts "Phone: " + @phone_number
    puts "Email: " + @email
  end
end
