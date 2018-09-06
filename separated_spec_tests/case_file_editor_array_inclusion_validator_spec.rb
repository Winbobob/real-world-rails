RSpec.describe ArrayInclusionValidator do
  let(:klass) {
    Class.new do
      include BasicModel

      def self.model_name
        ActiveModel::Name.new(self, nil, 'thing')
      end

      attribute :wotsit, Array[String]
      validates :wotsit,
        array_inclusion: { in: ['OK', 'Also fine'] }
    end
  }

  subject { klass.new }

  it 'passes validation if all attributes are in the acceptable list' 


  it 'passes validation if the array is empty' 


  it 'fails validation if an attribute is not in the acceptable list' 

end

