require 'spec_helper'

describe Gitlab::View::Presenter::Delegated do
  let(:project) { double(:project, user: 'John Doe') }
  let(:presenter_class) do
    Class.new(described_class)
  end

  it 'includes Gitlab::View::Presenter::Base' 


  describe '#initialize' do
    it 'takes arbitrary key/values and exposes them' 


    it 'raise an error if the presentee already respond to method' 

  end

  describe 'delegation' do
    it 'forwards missing methods to subject' 

  end
end

