RSpec.describe TruthValidator do
  let(:klass) {
    Class.new do
      include BasicModel

      def self.model_name
        ActiveModel::Name.new(self, nil, 'thing')
      end

      attribute :wotsit, Virtus::Attribute::Boolean
      validates :wotsit, truth: true
    end
  }

  subject { klass.new }

  it 'passes validation if attribute is true' 


  it 'fails validation if attribute is false' 


  it 'fails validation if attribute is nil' 

end

