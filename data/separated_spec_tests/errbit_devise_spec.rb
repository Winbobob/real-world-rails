describe 'initializers/devise' do
  def load_initializer
    load File.join(Rails.root, 'config', 'initializers', 'devise.rb')
  end

  after do
    # reset to the defaults
    load_initializer
  end

  describe 'omniauth github' do
    it 'sets the client options correctly for the default github_url' 


    it 'sets the client options correctly for the a GitHub Enterprise github_url' 

  end
end

