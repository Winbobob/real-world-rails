require 'spec_helper'

describe Gitlab::View::Presenter::Simple do
  let(:project) { double(:project, user: 'John Doe') }
  let(:presenter_class) do
    Class.new(described_class)
  end

  it 'includes Gitlab::View::Presenter::Base' 


  describe '#initialize' do
    it 'takes arbitrary key/values and exposes them' 


    it 'override the presentee attributes' 

  end

  describe 'delegation' do
    it 'does not forward missing methods to subject' 

  end
end

