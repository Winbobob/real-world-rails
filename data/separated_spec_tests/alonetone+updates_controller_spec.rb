require "rails_helper"

RSpec.describe UpdatesController, type: :controller do
  fixtures :users, :updates

  it 'should allow anyone to view the updates index' 


  it "should not allow a normal user to edit an update" 


  it 'should not let a guest edit an update' 


  it 'should not let a guest update or destroy an update' 


  it "should allow an admin to edit a blog entry" 


  it "should allow an admin to update a blog entry" 


  it "should not let a normal joe create a blog entry" 

end

