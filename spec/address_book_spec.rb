require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
  end

  it "initializes entries as an array" do
    book = AddressBook.new
    expect(book.entries).to be_an(Array)
  end

  it "initializes entries as empty" do
    book = AddressBook.new
    expect(book.entries.size).to eq(0)
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "remove one entry from address book" do
      book = AddressBook.new
      book.add_entry('Oleg Sokolov', '012.345.6789', 'ole.sokolov@lovelace.com')
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(2)

      book.remove_entry('Oleg Sokolov', '012.345.6789', 'ole.sokolov@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "remove correct entry from address book" do
      book = AddressBook.new
      book.add_entry('Oleg Sokolov', '012.345.6789', 'ole.sokolov@lovelace.com')
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(2)

      book.remove_entry('Oleg Sokolov', '012.345.6789', 'ole.sokolov@lovelace.com')
      expect(book.entries.size).to eq(1)

      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')

    end
  end

  describe "#get_entry_by_number" do
    it "get entry by number" do
      book = AddressBook.new
      book.add_entry('Oleg Sokolov', '012.345.6789', 'ole.sokolov@lovelace.com')
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(2)

      entry = book.get_entry_by_number(1)
      expect(entry.name).to eq('Ada Lovelace')
      expect(entry.phone_number).to eq('010.012.1815')
      expect(entry.email).to eq('augusta.king@lovelace.com')
    end
  end
end
