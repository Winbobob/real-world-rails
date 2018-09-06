require_relative '../lib/unicode/display_width'

describe 'Unicode::DisplayWidth.of' do
  describe '[east asian width]' do
    it 'returns 2 for F' 


    it 'returns 2 for W' 


    it 'returns 2 for W (which are currently unassigned)' 


    it 'returns 1 for N' 


    it 'returns 1 for Na' 


    it 'returns 1 for H' 


    it 'returns first argument of display_width for A' 


    it 'returns first argument of display_width for A' 


    it 'returns 1 for A if no argument given' 

  end

  describe '[zero width]' do
    it 'returns 0 for Mn chars' 


    it 'returns 0 for Me chars' 


    it 'returns 0 for Cf chars' 


    it 'returns 0 for HANGUL JUNGSEONG chars' 


    it 'returns 0 for U+2060..U+206F' 


    it 'returns 0 for U+FFF0..U+FFF8' 


    it 'returns 0 for U+E0000..U+E0FFF' 

  end

  describe '[special characters]' do
    it 'returns 0 for ␀' 


    it 'returns 0 for ␅' 


    it 'returns 0 for ␇' 


    it 'returns -1 for ␈' 


    it 'returns -1 for ␈, but at least 0' 


    it 'returns 0 for ␊' 


    it 'returns 0 for ␋' 


    it 'returns 0 for ␌' 


    it 'returns 0 for ␍' 


    it 'returns 0 for ␎' 


    it 'returns 0 for ␏' 


    it 'returns 1 for other C0 characters' 


    it 'returns 1 for SOFT HYPHEN' 


    it 'returns 2 for THREE-EM DASH' 


    it 'returns 3 for THREE-EM DASH' 

  end


  describe '[overwrite]' do
    it 'can be passed a 3rd parameter with overwrites' 

  end

  describe '[encoding]' do
    it 'works with non-utf8 Unicode encodings' 

  end

  describe '[emoji]' do
    it 'does not count modifiers and zjw sequences for valid emoji' 


    it 'works with flags' 

  end
end

