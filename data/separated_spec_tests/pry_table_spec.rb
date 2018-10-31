require_relative '../helper'

describe 'Formatting Table' do
  it 'knows about colorized fitting' 


  describe 'formatting - should order downward and wrap to columns' do
    FAKE_COLUMNS = 62
    def try_round_trip(expected)
      things = expected.split(/\s+/).sort
      actual = Pry::Helpers.tablify(things, FAKE_COLUMNS).to_s.strip
      [expected, actual].each{|e| e.gsub!(/\s+$/, '')}
      if actual != expected
        bar = '-'*25
        puts \
          bar+'expected'+bar,
          expected,
          bar+'actual'+bar,
          actual
      end
      expect(actual).to eq expected
    end

    it 'should handle a tiny case' 


    it 'should handle the basic case' 


    it 'should handle... another basic case' 


    it 'should handle colors' 


    it 'should handle empty input' 


    it 'should handle one-token input' 

  end

  describe 'line length is smaller than the length of the longest word' do
    before do
      element = 'swizzle'
      @elem_len = element.length
      @out = [element, 'crime', 'fun']
    end

    it 'should not raise error' 


    it 'should format output as one column' 

  end

  specify 'decide between one-line or indented output' do
    expect(Pry::Helpers.tablify_or_one_line('head', %w(ing))).to eq "head: ing\n"
  end
end

