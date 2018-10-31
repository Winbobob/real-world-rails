describe FeedWrapper do
  subject do
    FeedWrapper.new(MultiXml.parse('
      <Document>
        <Subdocument Initials="abcd">
          <Ajax>a</Ajax>
          <Boris>b</Boris>
          <Charlotte>c</Charlotte>
          <Delphine Alt="porpoise">d</Delphine>
        </Subdocument>
        <Subdocument Initials="efgh">
          <Ernest>e</Ernest>
          <Flora>f</Flora>
          <Gawain>g</Gawain>
          <Hrothgar>h</Hrothgar>
        </Subdocument>
      </Document>
    '))
  end

  context 'wrapping a collection' do
    it 'should wrap key lookups in a new FeedWrapper object' 


    it 'should return a blank object for missing keys' 


    it 'should implement Enumerable methods' 


    context 'finding by key and value' do
      it 'should find elements by key and value' 


      it 'should return blank on failed finds' 

    end
  end

  context 'wrapping a String' do
    let(:text_wrapper) { FeedWrapper.new('text    ') }
    let(:date_wrapper) { FeedWrapper.new('3rd Feb 2001    ') }
    let(:time_wrapper) { FeedWrapper.new(923) }

    it 'should strip string on coercion' 


    it 'should return blank on key lookups' 


    it 'should parse date strings' 


    it 'should format time strings' 


    it 'should return blank on unparseable dates or times' 

  end

  context 'wrapping blank' do
    let(:blankwrapper) { FeedWrapper.new(nil) }

    it 'should return blank or default on key lookups' 


    it 'should return blank objects on coercion' 


    it 'should accept a default argument on coercion' 

  end

  context 'as collection' do
    it 'should wrap a non-Array in an Array' 


    it 'should not wrap an Array in another Array' 

  end

end

