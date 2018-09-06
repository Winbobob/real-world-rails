RSpec.describe Celluloid::Internals::Links do
  subject { Celluloid::Internals::Links.new }

  let(:mailbox_mock) do
    Class.new(Array) do
      attr_reader :address
      def initialize(address)
        @address = address
      end
    end
  end

  let(:first_actor) do
    Struct.new(:mailbox).new(mailbox_mock.new("foo123"))
  end

  let(:second_actor) do
    Struct.new(:mailbox).new(mailbox_mock.new("bar456"))
  end

  it "is Enumerable" 


  it "adds actors by their mailbox address" 


  it "removes actors by their mailbox address" 


  it "iterates over all actors" 

end

