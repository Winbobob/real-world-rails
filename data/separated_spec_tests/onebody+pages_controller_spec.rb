require 'rails_helper'

describe PagesController, type: :controller do
  before do
    @admin = FactoryGirl.create(:person, admin: Admin.create(edit_pages: true))
    @person = FactoryGirl.create(:person)
    @parent_page = FactoryGirl.create(:page, slug: 'foo')
    @child_page = FactoryGirl.create(:page, slug: 'baz', parent: @parent_page)
  end

  it 'should show a top level page based on path' 


  it 'should show a child level page based on path' 


  it 'should not show a page if it does not exist' 


  it 'should not show a page if it is not published' 


  # admin actions...

  it 'should show edit page form' 


  it 'should update a page' 


  it 'should not edit a page unless user is admin' 

end

