require 'spec_helper'

RSpec.describe 'Single method' do
  after do
    Object.instance_eval { remove_const :Hello } if defined?(Hello)
  end

  it 'plain: should handle a method with no arguments' 


  it 'color: should handle a method with no arguments' 


  it 'plain: should handle a method with one argument' 


  it 'color: should handle a method with one argument' 


  it 'plain: should handle a method with two arguments' 


  it 'color: should handle a method with two arguments' 


  it 'plain: should handle a method with multiple arguments' 


  it 'color: should handle a method with multiple arguments' 


  it 'plain: should handle a method defined in mixin' 


  it 'color: should handle a method defined in mixin' 


  it 'plain: should handle an unbound method' 


  it 'color: should handle an unbound method' 

end

RSpec.describe 'Object methods' do
  after do
    Object.instance_eval { remove_const :Hello } if defined?(Hello)
  end

  describe 'object.methods' do
    it 'index: should handle object.methods' 


    it 'no index: should handle object.methods' 

  end

  describe 'object.public_methods' do
    it 'index: should handle object.public_methods' 


    it 'no index: should handle object.public_methods' 

  end

  describe 'object.private_methods' do
    it 'index: should handle object.private_methods' 


    it 'no index: should handle object.private_methods' 

  end

  describe 'object.protected_methods' do
    it 'index: should handle object.protected_methods' 


    it 'no index: should handle object.protected_methods' 

  end

  describe 'object.private_methods' do
    it 'index: should handle object.private_methods' 


    it 'no index: should handle object.private_methods' 

  end

  describe 'object.singleton_methods' do
    it 'index: should handle object.singleton_methods' 


    it 'no index: should handle object.singleton_methods' 

  end
end

RSpec.describe 'Class methods' do
  after do
    Object.instance_eval { remove_const :Hello } if defined?(Hello)
  end

  describe 'class.instance_methods' do
    it 'index: should handle unbound class.instance_methods' 


    it 'no index: should handle unbound class.instance_methods' 

  end

  describe 'class.public_instance_methods' do
    it 'index: should handle class.public_instance_methods' 


    it 'no index: should handle class.public_instance_methods' 

  end

  describe 'class.protected_instance_methods' do
    it 'index: should handle class.protected_instance_methods' 


    it 'no index: should handle class.protected_instance_methods' 

  end

  describe 'class.private_instance_methods' do
    it 'index: should handle class.private_instance_methods' 


    it 'no index: should handle class.private_instance_methods' 

  end
end

if RUBY_VERSION >= '1.9.2'
  RSpec.describe 'Ruby 1.9.2+ Method#parameters' do
    before do
      stub_dotfile!
    end

    after do
      Object.instance_eval { remove_const :Hello } if defined?(Hello)
    end

    it '()' 


    it ':req' 


    it ':opt' 


    it ':rest' 


    it ':block' 

  end
end

RSpec.describe 'Methods arrays' do
  after do
    Object.instance_eval { remove_const :Hello } if defined?(Hello)
    Object.instance_eval { remove_const :World } if defined?(World)
  end

  it 'obj1.methods - obj2.methods should be awesome printed' 


  it 'obj1.methods & obj2.methods should be awesome printed' 


  it 'obj1.methods.grep(pattern) should be awesome printed' 


  it 'obj1.methods.grep(pattern, &block) should pass the matching string within the block' 


  it 'obj1.methods.grep(pattern, &block) should be awesome printed' 


  # See https://github.com/awesome-print/awesome_print/issues/30 for details.
  it 'grepping methods and converting them to_sym should work as expected' 


  it 'appending garbage to methods array should not raise error' 

end

