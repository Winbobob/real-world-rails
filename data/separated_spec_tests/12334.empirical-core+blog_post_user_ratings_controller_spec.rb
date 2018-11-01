require 'rails_helper'

RSpec.describe BlogPostUserRatingsController, type: :controller do
  describe '#create' do
    let(:blog_post) { create(:blog_post) }
    let(:teacher) { create(:teacher) }

    context 'when a user is logged in' do
      before(:each) do
        session[:user_id] = teacher.id
      end

      it 'should create a new rating' 


      it 'should update an old rating' 


      it 'should not create a rating if the specified rating is not in ACCEPTABLE_RATINGS' 

    end

    context 'when no user is logged in' do
      it 'should return an unauthorized error' 

    end
  end
end

