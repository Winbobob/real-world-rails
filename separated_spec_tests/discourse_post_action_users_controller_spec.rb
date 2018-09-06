require 'rails_helper'

describe PostActionUsersController do
  let(:post) { Fabricate(:post, user: log_in) }

  context 'with render' do
    render_views
    it 'always allows you to see your own actions' 

  end

  it 'raises an error without an id' 


  it 'raises an error without a post action type' 


  it "fails when the user doesn't have permission to see the post" 


  it 'raises an error when anon tries to look at an invalid action' 


  it 'succeeds' 


  it "paginates post actions" 

end

