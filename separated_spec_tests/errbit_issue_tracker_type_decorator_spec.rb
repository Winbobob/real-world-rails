describe IssueTrackerDecorator do
  let(:fake_tracker_class) do
    klass = Class.new(ErrbitPlugin::IssueTracker) do
      def self.label
        'fake'
      end

      def self.note
        'a note'
      end

      def self.fields
        {
          foo: { label: 'foo' },
          bar: { label: 'bar' }
        }
      end

      def self.icons
        {
          one: ['text/plain', 'all your base are belong to us'],
          two: ['application/xml', '<root></root>']
        }
      end
    end

    allow(ErrbitPlugin::Registry).to receive(:issue_trackers).and_return(fake: klass)

    klass
  end

  let(:fake_tracker) { IssueTrackerDecorator.new(fake_tracker_class.new) }
  let(:decorator) { IssueTrackerTypeDecorator.new(fake_tracker_class) }

  describe "::note" do
    it 'return the html_safe of Note' 

  end

  describe "#fields" do
    it 'return all FIELDS define decorate' 

  end

  describe "#params_class" do
    it 'adds the label in class' 


    it 'adds chosen class if type is same' 

  end
end

