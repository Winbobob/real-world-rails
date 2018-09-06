require 'rails_helper'

describe API::VersionsController do
  let(:user) { create :user }
  let(:discussion) { create :discussion , private: false, title: "Ready Player Zero"}
  let(:comment) { create :comment, discussion:discussion, body: "Ready Player Zero"}

  describe 'show' do
    before do
      discussion.group.add_admin! user
      sign_in user
      discussion.update(title: "Ready Player One")
      discussion.update(private: true)
      discussion.update(title: "Ready Player Two")
      comment.update(body: "Ready Player One")

    end

    it '(zero) should return the original version' 


    it '(one) should return name change and not privacy' 


    it '(two) should return privacy and constant name change' 


    it '(three) final version name change' 


    it 'should show original body on zero for comment' 


    it 'should show first revision on one for comment' 

  end
end

