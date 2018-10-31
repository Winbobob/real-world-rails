require 'spec_helper'

describe 'fake' do

  let :title do
    'foo'
  end

  it { should be_valid_type }

  describe 'tests of the types' do

    {
      :parameters =>
        {:baddies => ['one', 'two'], :goodies => ['three', 'four']},
      :properties =>
        {:baddies => ['five', 'fix'], :goodies => ['seven', 'eight']},
      :features   =>
        {:baddies => ['nine', 'ten'], :goodies => ['eleven', 'twelve']}
    }.each do |k, v|

      describe "#{k} checks" do

        [v[:baddies], v[:baddies].first].each do |baddies|
          it "should fail for #{baddies.size} baddies" 

        end

        [v[:goodies], v[:goodies].first].each do |goodies|
          it "should pass with #{goodies.size} goodies" 

        end

      end

    end

  end

  describe 'tests that create a resource instance' do

    let :params do
      { :three => 'value' }
    end

    it 'should pass when providers match' 


    it 'should fail when provider does not match' 


    it 'should pass when providers match' 


    it 'should fail with invalid parameters' 


    it 'should not fail with valid parameters' 


  end

end

