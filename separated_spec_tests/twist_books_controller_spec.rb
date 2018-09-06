require 'rails_helper'

describe BooksController do
  before do
    # Needs to exist (and have called Resque.enqueue) before we trigger the post-receive hook
    @book = FactoryGirl.create(:book)
  end
  
  it "post-receive hooks" 

end

