RSpec.describe ArrayFormatValidator do
  let(:klass) {
    Class.new do
      include BasicModel

      def self.model_name
        ActiveModel::Name.new(self, nil, 'thing')
      end

      attribute :wotsit, Array[String]
      validates :wotsit,
        array_format: { with: /OK/ }
    end
  }

  subject { klass.new }

  it 'passes validation if all attributes match the format' 


  it 'passes validation if the array is empty' 


  it 'fails validation if an attribute does not match the format' 


  it 'fails validation if an attribute is nil' 

end

