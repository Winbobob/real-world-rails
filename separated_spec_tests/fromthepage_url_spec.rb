require 'spec_helper'

describe "URL tests" do

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @collection = Collection.joins(:deeds).where(deeds: {user_id: @user.id}).first
    @work = @collection.works.first
    @page = @work.pages.first
  end

  it "visits old URLs" 


  it "checks URLs paths/breadcrumbs" 


  it "checks user URLs" 


  it "edits a collection slug" 


  it "edits a work slug" 


  it "edits a user slug" 


  it "checks for weird breadcrumbs/clear the col_id" 


end

