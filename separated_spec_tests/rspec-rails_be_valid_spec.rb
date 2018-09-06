require "spec_helper"
require 'rspec/rails/matchers/be_valid'

describe "be_valid matcher" do
  class Post
    include ActiveModel::Validations
    attr_accessor :title
    validates_presence_of :title
  end

  class Book
    def valid?
      false
    end

    def errors
      ['the spine is broken', 'the pages are dog-eared']
    end
  end

  class Boat
    def valid?
      false
    end
  end

  let(:post) { Post.new }
  let(:book) { Book.new }
  let(:boat) { Boat.new }

  it "includes the error messages in the failure message" 


  it "includes the error messages for simple implementations of error messages" 


  it "includes a brief error message for the simplest implementation of validity" 


  it "includes a failure message for the negative case" 


  it "uses a custom failure message if provided" 


  it "includes the validation context if provided" 


  it "does not include the validation context if not provided" 

end

