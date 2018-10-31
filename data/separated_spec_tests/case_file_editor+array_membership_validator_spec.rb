RSpec.describe ArrayMembershipValidator do
  let(:klass) {
    Class.new do
      include BasicModel

      def self.model_name
        ActiveModel::Name.new(self, nil, 'thing')
      end

      attribute :wotsit, Array[String]
      validates :wotsit,
        array_membership: { of: 'foo' }
    end
  }

  subject { klass.new }

  it 'passes validation if the required item is present' 


  it 'fails validation if the array is empty' 


  it 'fails validation if the required item is absent' 

end

