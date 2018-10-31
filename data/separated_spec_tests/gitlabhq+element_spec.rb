describe QA::Page::Element do
  describe '#selector' do
    it 'transforms element name into QA-specific selector' 

  end

  describe '#selector_css' do
    it 'transforms element name into QA-specific clickable css selector' 

  end

  context 'when pattern is an expression' do
    subject { described_class.new(:something, /button 'Sign in'/) }

    it 'matches when there is a match' 


    it 'does not match if pattern is not present' 

  end

  context 'when pattern is a string' do
    subject { described_class.new(:something, 'button') }

    it 'matches when there is match' 


    it 'does not match if pattern is not present' 

  end

  context 'when pattern is not provided' do
    subject { described_class.new(:some_name) }

    it 'matches when QA specific selector is present' 


    it 'does not match if QA selector is not there' 

  end
end

