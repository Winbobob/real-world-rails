require 'spec_helper'

describe DatabaseController, :type => :controller do
  before do
    fake_admin_login
  end

  before do
    @original_rails_env = Rails.env
    Rails.env = 'android'
  end

  after do
    Rails.env = @original_rails_env
  end

  it 'should delete all child models in non-production environments' 


  it 'should delete all enquiry models in non-production environments' 


  it 'should not delete any models in production environments' 

end

