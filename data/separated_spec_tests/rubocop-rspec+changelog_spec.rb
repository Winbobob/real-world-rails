RSpec.describe 'CHANGELOG.md' do
  subject(:changelog) { SpecHelper::ROOT.join('CHANGELOG.md').read }

  it 'has link definitions for all implicit links' 


  describe 'entry' do
    subject(:entries) { lines.grep(/^\*/).map(&:chomp) }

    let(:lines) { changelog.each_line }

    it 'has a whitespace between the * and the body' 


    it 'has a link to the contributors at the end' 


    describe 'link to related issue on github' do
      let(:issues) do
        entries.map do |entry|
          entry.match(/\[(?<number>[#\d]+)\]\((?<url>[^\)]+)\)/)
        end.compact
      end

      it 'has an issue number prefixed with #' 


      it 'has a valid URL' 


      it 'has a colon and a whitespace at the end' 

    end

    describe 'body' do
      let(:bodies) do
        entries.map do |entry|
          entry
            .sub(/^\*\s*(?:\[.+?\):\s*)?/, '')
            .sub(/\s*\([^\)]+\)$/, '')
        end
      end

      it 'does not start with a lower case' 


      it 'ends with a punctuation' 

    end
  end
end

