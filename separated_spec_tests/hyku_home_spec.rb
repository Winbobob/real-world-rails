RSpec.describe 'Home page', type: :request do
  context 'with multitenancy' do
    describe 'GET /' do
      context 'on the primary host' do
        before { host! 'localhost' }
        it 'redirects to the accounts landing page' 

      end

      context 'on an unknown subhost' do
        before { host! 'mystery.localhost' }
        it 'raises a 404' 

      end
    end
  end

  context 'with singletenancy', singletenant: true do
    describe 'GET /' do
      it 'fields the request' 

    end
  end
end

