require 'rails_helper'

RSpec.describe EnableLocalLoginsViaEmailValidator do
  subject { described_class.new }

  describe '#valid_value?' do
    describe "when 'enable_local_logins' is false" do
      before do
        SiteSetting.enable_local_logins = false
      end

      describe 'when val is false' do
        it 'should be valid' 

      end

      describe 'when value is true' do
        it 'should not be valid' 

      end
    end

    describe "when 'enable_local_logins' is true" do
      before do
        SiteSetting.enable_local_logins = true
      end

      describe 'when val is false' do
        it 'should be valid' 

      end

      describe 'when value is true' do
        it 'should be valid' 

      end
    end
  end
end

