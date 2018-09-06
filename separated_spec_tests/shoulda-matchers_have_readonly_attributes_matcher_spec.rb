require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::HaveReadonlyAttributeMatcher, type: :model do
  context 'a read-only attribute' do
    it 'accepts' 

  end

  context 'an attribute that is not part of the read-only set' do
    it 'rejects being read-only' 

  end

  context 'an attribute on a class with no readonly attributes' do
    it 'rejects being read-only' 


    it 'assigns a failure message' 

  end

  def with_readonly_attr
    define_model :example, attr: :string do
      attr_readonly :attr
    end.new
  end
end

