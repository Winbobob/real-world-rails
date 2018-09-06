require 'spec_helper'

describe "notifications" , :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @admin = User.find_by(login: ADMIN)
    @collection = Collection.first
    @work = @collection.works.first
    @page = @work.pages.first
  end

  it "resets note notifications" 


  it "adds a response note (with email)" 


end

