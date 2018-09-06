describe StringNormalizer do

  describe '.to_ascii' do
    let(:normalized)    { StringNormalizer.to_ascii(@orig) }

    it 'should return straight alpha characters unchanged' 


    it 'should not change punctuation marks' 


    it 'should not change currency marks or curly braces' 


    it 'should not translate western European accented characters' 


    it 'should not translate capitalized western European characters' 


    it 'should strip accents from exotic Eastern European Characters' 


    it 'should strip accents from capitalized exotic Eastern European Characters' 


    it 'should handle a mixure of western and east European characters' 


    it 'should handle Romanian characters' 


    it 'should handle Czech and Slovak characters' 


    it 'should leave non-latin scripts alone' 


    it 'should handle o-macron' 

  end

  describe '.hash_to_ascii' do

    it 'should return the same hash with all the values normalized' 

  end

  def original_hash
    {
      "name" => 'Štęfāń Rįćčardź',
      :age => 45,
      :attrs => [:a, :b, :c],
      :address => '33 Hœgh Stråt'
    }
  end

  def expected_hash
    {
      "name" => 'Stefan Riccardz',
      :age => 45,
      :attrs => [:a, :b, :c],
      :address => '33 Hoegh Stråt'
    }
  end

end

