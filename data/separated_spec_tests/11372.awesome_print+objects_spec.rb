require 'spec_helper'

RSpec.describe 'Objects' do
  after do
    Object.instance_eval { remove_const :Hello } if defined?(Hello)
  end

  describe 'Formatting an object' do
    it 'attributes' 


    it 'instance variables' 


    it 'attributes and instance variables' 


    it 'without the plain options print the colorized values' 


    it 'with multine as false show inline values' 


    it 'without the sort_vars option does not sort instance variables' 

  end
end

