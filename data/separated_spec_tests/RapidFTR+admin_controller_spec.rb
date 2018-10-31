# encoding: utf-8

require 'spec_helper'

describe AdminController, :type => :controller do
  before :each do
    fake_admin_login
  end

  after :each do
    I18n.default_locale = :en
  end

  it 'should set the given locale as default' 


  it 'should flash a update message when the system language is changed and affected by language changed ' 

end

