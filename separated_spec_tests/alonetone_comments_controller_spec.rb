require "rails_helper"

RSpec.describe CommentsController, type: :controller do

  fixtures :users, :comments, :assets

  context "basics" do

    it 'should allow anyone to view the comments index' 


    it 'should allow guest to comment on a track (via xhr)' 


    it 'should allow guest to comment on a blog post' 


    it 'should allow user comment on a track (via xhr)' 


    it 'should allow private comment on track' 

  end

  context "private comments made by user" do
    it "should be visible to private user viewing their own shit" 


    it "should be visible to admin" 


    it "should be visible to mod" 



    it "should not be visible to guest" 


    it "should not be visible to normal user" 

  end



  context "private comments on index" do

    it "should be visible to admin" 


    it "should be visible to mod" 



    it "should not be visible to guest" 


    it "should not be visible to normal user" 


  end

end

