require 'spec_helper'

describe NewsItemsController do
  render_views

  context 'If the logged user is an admin' do
    before :each do
      sign_in_admin
    end

    describe "GET 'index'" do
      before :each do
        @news_item_1 = NewsItem.make(:company => @logged_user.company)
        @news_item_2 = NewsItem.make(:company => @logged_user.company)
      end

      it 'should be successuful' 


      it 'should render the right template' 


      it 'should display a list of all the news items' 

    end

    describe "GET 'new'" do
      it 'should be successful' 


      it 'should render the right template' 

    end

    describe "POST 'create'" do
      context 'When using valid attributes' do
        before :each do
          @valid_attr = {:body => 'Lololol', :portal => true}
        end

        it 'should create a new instance' 


        it "should redirect to the 'index' action" 


        it 'should display a notification telling the user that the news was created' 

      end

      context 'When using invalid attributes' do
        before :each do
          @invalid_attrs = {:body => '', :portal => true}
        end

        it 'should not create a new instance' 


        it "should re-render the 'new' template" 

      end
    end

    describe "GET 'edit'" do
      before :each do
        @news = NewsItem.make(:company => @logged_user.company)
      end

      it 'should be successful' 


      it 'should render the right template' 

    end

    describe "PUT 'update'" do
      before :each do
        @news = NewsItem.make(:company => @logged_user.company)
        @attrs = {:body => 'something', :portal => true}
      end

      it 'should update the news attributes correctly' 


      it "should redirect to the 'index' action" 


      it 'should display a message telling the user the news was updated' 

    end

    describe "DELETE 'destroy'" do
      before :each do
        @news = NewsItem.make(:company => @logged_user.company)
      end

      it 'should delete the instance' 


      it "should redirect to the 'index' action" 


      it 'should display a message telling the user the news was deleted' 

    end
  end
end

