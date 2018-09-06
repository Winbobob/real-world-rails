require 'rails_helper'

RSpec.describe EnableSsoValidator do
  subject { described_class.new }

  describe '#valid_value?' do
    describe "when 'sso url' is empty" do
      before do
        SiteSetting.sso_url = ""
      end

      describe 'when val is false' do
        it 'should be valid' 

      end

      describe 'when value is true' do
        it 'should not be valid' 

      end
    end

    describe "when 'sso url' is present" do
      before do
        SiteSetting.sso_url = "https://www.example.com/sso"
      end

      describe 'when value is false' do
        it 'should be valid' 

      end

      describe 'when value is true' do
        it 'should be valid' 

      end
    end

  end
end

