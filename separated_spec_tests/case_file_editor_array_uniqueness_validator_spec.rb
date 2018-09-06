RSpec.describe ArrayUniquenessValidator do
  let(:klass) {
    Class.new do
      include BasicModel

      def self.model_name
        ActiveModel::Name.new(self, nil, 'thing')
      end

      attribute :wotsit, Array[String]
      validates :wotsit,
        array_uniqueness: true
    end
  }

  subject { klass.new }

  it 'passes validation if all attributes are unique' 


  it 'passes validation if the array is empty' 


  it 'fails validation if an attribute is repeated' 

end

