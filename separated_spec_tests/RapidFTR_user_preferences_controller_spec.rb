require 'spec_helper'

describe UserPreferencesController, :type => :controller do

  before :each do
    fake_field_worker_login
  end

  after :each do
    I18n.default_locale = :en
  end

  it 'should save the given local in user' 


  it 'should flash a update message when the system language is changed' 


end

