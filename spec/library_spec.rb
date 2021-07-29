require './lib/library'
require './lib/author'

RSpec.describe Library do
  before :each do
    @dpl = Library.new("Denver Public Library")
    #=> #<Library:0x00007fbeea3653c0...>
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    #=> #<Author:0x00007fbeea112730...>
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    # => #<Author:0x00007fbeea2d78b8...>
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    #=> #<Book:0x00007fbeeb3beca8...>
    @professor = @charlotte_bronte.write("The Professor", "1857")
    #=> #<Book:0x00007fbeea8efd90...>
    @villette = @charlotte_bronte.write("Villette", "1853")
    #=> #<Book:0x00007fbeea24fbe8...>
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    #=> #<Book:0x00007fbeeb1089f0...>
  end

  it 'exists & has attributes' do
    expect(@dpl).to be_a(Library)
    expect(@dpl.name).to eq("Denver Public Library")
    expect(@dpl.books).to eq([])
    expect(@dpl.authors).to eq([])
  end

  describe 'add books' do
    before :each do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.add_book(@jane_eyre)
      @dpl.add_book(@villette)
      @dpl.add_book(@professor)
      @dpl.add_book(@mockingbird)
    end

    it 'returns authors and books' do
      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end

    it 'returns pulications time frames' do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
end
