require_relative 'entry'
require 'csv'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
      index = 0
      entries.each do |entry|
        if name < entry.name
          break
        end
        index += 1
      end
      entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
      index = 0
      entries.each do |entry|
        if name == entry.name && phone_number == entry.phone_number && email == entry.email
          break
        end
        index += 1
      end
      entries.delete_at(index)
  end

  def get_entry_by_number(entry_number)
    return entries[entry_number-1]
  end

  def import_from_csv(file_name)
      puts Dir.pwd
      csv_path = './models/' + file_name
      csv_text = File.read(csv_path)
      csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end
      return @entries
   end

   def binary_search(name)
     lower = 0
     upper = entries.length - 1

     while lower <= upper
       mid = (lower + upper) / 2
       mid_name = entries[mid].name

       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end

     return nil
   end

   def iterative_search(name)
     for entry in entries
       if entry.name == name
         return entry
       end
     end
     return nil
   end

   def remove_all_entry
     entries.clear
   end
end
