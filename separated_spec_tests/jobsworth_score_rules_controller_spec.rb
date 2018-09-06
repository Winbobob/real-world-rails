require 'spec_helper'
include ScoreRulesHelper

describe ScoreRulesController do
  render_views

  describe "GET 'index'" do

    context 'When the user is not logged in' do
      it 'should redirect to the login page' 

    end

    context 'When the user is logged in' do
      before(:each) do
        sign_in User.make
        @project = Project.make
      end

      it 'should render the right template' 


      context "When the project doesn't have any score rules" do
        it 'should not display any score rules' 

      end

      context 'when the project have some score rules' do
        before(:each) do
          @score_rule_1 = ScoreRule.make
          @score_rule_2 = ScoreRule.make
          @project.score_rules << @score_rule_1
          @project.score_rules << @score_rule_2
          @project.save
        end

        it 'should display a list with all the score rules' 

      end

      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end
    end
  end

  describe "GET 'new'" do

    context 'when the user is not signed in' do

      it 'should redirect to the login page' 

    end

    context 'when the user has signed in' do

      before(:each) do
        sign_in User.make
        @project = Project.make
      end

      it 'should render the right template' 


      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

    end
  end

  describe "POST 'create'" do
    context 'when the user is not signed in' do
      it 'should redirect to the login page' 

    end

    context 'when the user is signed in' do
      before(:each) do
        sign_in User.make
        @project = Project.make
        @score_rule ||= ScoreRule.make
        @score_rule_attrs = @score_rule.attributes.with_indifferent_access.slice(:name, :score, :score_type, :exponent)
      end

      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

      context 'when using invalid attributes' do
        before(:each) do
          @score_rule_attrs.merge!('name' => '')
        end

        it 'should not create a new score rule' 


        it "should render the 'new' template" 


        it 'should display some kind of validation error' 


      end

      context 'when using valid attributes' do

        it 'should create a new score rule' 


        it "should redirect to the 'index' action" 


        it 'should display a notification' 

      end
    end
  end

  describe "GET 'edit'" do

    context 'when the user is not signed in' do

      it 'should redirect to the login page' 

    end

    context 'when the user is signed in' do
      before(:each) do
        sign_in User.make
        @score_rule = ScoreRule.make
        @project = Project.make(:score_rules => [@score_rule])
      end

      it 'should render the right template' 


      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

      context 'when using an invalid score rule id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end
    end
  end

  describe "PUT 'update'" do

    context 'when the user is not signed in' do

      it 'should redirect to the login page' 

    end

    context 'when the user is signed in' do

      before(:each) do
        sign_in User.make
        @score_rule = ScoreRule.make
        @project = Project.make(:score_rules => [@score_rule])
        @score_rule_attrs = @score_rule.attributes.with_indifferent_access.slice(:name, :score, :score_type, :exponent)
      end

      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

      context 'when using an invalid score rule id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

      context 'when using invalid attributes' do

        before(:each) do
          @score_rule_attrs.merge!('name' => '')
        end

        it 'should not update the score rule' 


        it "should render the 'edit' template" 


        it 'should display some validation error message' 

      end

      context 'when using valid attributes' do

        before(:each) do
          @score_rule_attrs.merge!('name' => 'bananas')
        end

        it 'should update the score rule' 


        it "should redirect to the 'index' action" 


        it 'should display a notification' 

      end
    end
  end

  describe "DELETE 'destroy'" do

    context 'when the user is not signed in' do

      it 'should redirect to the login page' 

    end


    context 'when the user is signed in' do

      before(:each) do
        sign_in User.make
        @score_rule = ScoreRule.make
        @project = Project.make(:score_rules => [@score_rule])
      end

      context 'when using an invalid project id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end

      context 'when using a valid score rule id' do
        it 'should delete the score rule' 


        it "should redirect to the 'index' action" 


        it 'should display a notification message' 

      end

      context 'when using an invalid score rule id' do
        it "should redirect to the project 'index' action" 


        it 'should display an error message' 

      end
    end
  end
end

