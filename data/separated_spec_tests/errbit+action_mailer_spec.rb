describe 'initializers/action_mailer' do
  def load_initializer
    load File.join(Rails.root, 'config', 'initializers', 'action_mailer.rb')
  end

  after do
    ActionMailer::Base.delivery_method = :test
  end

  describe 'delivery method' do
    it 'sets the delivery method to :smtp' 


    it 'sets the delivery method to :sendmail' 

  end

  describe 'smtp settings' do
    it 'lets smtp settings be set' 

  end
end

