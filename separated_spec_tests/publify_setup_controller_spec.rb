require 'rails_helper'

describe SetupController, type: :controller do
  describe '#index' do
    describe 'when no blog is configured' do
      before do
        # Set up database similar to result of seeding
        @blog = Blog.create
        create :none
        get 'index'
      end

      specify { expect(response).to render_template('index') }
    end

    describe 'when a blog is configured and has some users' do
      before do
        create(:blog)
        get 'index'
      end

      specify { expect(response).to redirect_to(controller: 'articles', action: 'index') }
    end
  end

  describe '#create' do
    context 'when no blog is configured' do
      before do
        # Set up database similar to result of seeding
        @blog = Blog.create
        create :none
      end

      context 'when passing correct parameters' do
        before do
          ActionMailer::Base.deliveries.clear
          post :create, params: { setting: { blog_name: 'Foo', email: 'foo@bar.net', password: 'foo123bar' } }
        end

        it 'should correctly initialize blog and users' 


        it 'should log in admin user' 


        it 'redirects to confirm the setup' 


        it 'sends a confirmation email' 

      end

      describe 'when passing incorrect parameters' do
        it 'empty blog name should raise an error' 


        it 'empty email should raise an error' 


        it 'empty password should raise an error' 

      end
    end

    describe 'when a blog is configured and has some users' do
      before do
        create(:blog)
        post :create, params: { setting: { blog_name: 'Foo', email: 'foo@bar.net' } }
      end

      specify { expect(response).to redirect_to(controller: 'articles', action: 'index') }

      it 'should not initialize blog and users' 

    end
  end
end

