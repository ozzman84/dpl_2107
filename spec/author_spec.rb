require './lib/book'
require './lib/author'

RSpec.describe Author do
  before :each do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})#=> #<Author:0x00007fb898081850...>
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")#=> #<Book:0x00007fb896e22538...>
    @villette = @charlotte_bronte.write("Villette", "1853")#<Book:0x00007fb8980aaca0...>
  end

  it 'exists & has attributes' do
    expect(@charlotte_bronte).to be_a(Author)
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(@charlotte_bronte.books).to eq([])
  end

  it 'exists & has attributes' do
    expect(@jane_eyre.class).to eq(Book)
    expect(@jane_eyre.title).to eq("Jane Eyre")
  end

  it 'returns books' do
    @charlotte_bronte.add_book( @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847"))
    @charlotte_bronte.add_book(@villette = @charlotte_bronte.write("Villette", "1853"))

    expect(@charlotte_bronte.books).to eq([@jane_eyre, @villette])
  end
end
