require 'rspec/core'

RSpec.describe 'partial-rails' do
  context 'when Rails constant is present but the railties are not' do
    before(:all) do
      class Rails
        # A class about railways
      end
    end

    it 'does not raise an exception when we require hashie' 

  end
end

