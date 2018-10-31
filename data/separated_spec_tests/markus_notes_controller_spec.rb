require 'spec_helper'

describe NotesController do

  # Security test - these it all fail
  context 'An authenticated and authorized student doing a ' do
    before :each do
      @student = create(:student)
    end

    it 'get on notes_dialog' 


    it ' on notes_dialog' 


    it 'GET on :add_note' 


    it 'POST on :add_note' 


    it 'GET on :index' 


    it 'GET on :new' 


    it 'POST on :create' 


    it 'GET on :new_update_groupings' 


    it 'GET on :edit' 


    it 'POST on :update' 


    it 'DELETE on :destroy' 

  end # student context

  context 'An authenticated and authorized TA doing a ' do
    before :each do
      @assignment = create(:assignment)
      @grouping = create(:grouping, assignment:@assignment)
      @controller_to = 'groups'
      @action_to = 'manage'
      @message = 'This is a note'
      @ta = create(:ta)
    end

    it 'be able to get :notes_dialog' 


    it 'be able to add new notes with a valid note' 


    it 'be able to add new notes with an invalid note' 


    it 'get index, with a note' 


    it 'get :new' 


    context 'POST on :create' do
      it 'be able to create with empty note' 


      it 'with good Grouping data' 


      it 'with good Student data' 


      it 'with good Assignment data' 

    end

    it 'be able to update new groupings' 


    context 'GET on :noteable_object_selector' do
      it 'for Groupings' 


      it 'for Students' 


      it 'for Assignments' 

    end

    context 'GET on :edit' do
      it 'for a note belonging to themselves (get as TA)' 


      it 'for a note belonging to someone else (get as TA)' 

    end

    context 'POST on :update' do
      context 'for a note belonging to themselves' do
        it 'with bad data' 


        it 'with good data' 

      end

      it 'for a note belonging to someone else (post as TA)' 

    end

    context 'DELETE on :destroy' do
      it 'for a note belonging to themselves' 


      it 'for a note belonging to someone else (delete as TA)' 

    end
  end # TA context

  context 'An authenticated and authorized admin doing a ' do
    before :each do
      @admin = create(:admin)
    end

    it 'be able to get the index' 


    it 'to go on new' 


    it 'for Students' 


    it 'for Assignments' 


    it 'for invalid type' 


    context 'with an assignment' do
      render_views
      before :each do
        @grouping = create(:grouping)
        @student = create(:student)
        @assignment = @grouping.assignment
        @controller_to = 'groups'
        @action_to = 'manage'
        @message = 'This is a note'
      end

      it 'GET on :notes_dialog' 


      it 'with a valid note' 


      it 'with an invalid note' 


      it 'with empty note' 


      it "with good Grouping data" 


      it "with good Student data" 


      it "with good Assignment data" 


      it 'GET on :new_update_groupings' 


      it 'for Groupings' 


      it 'for a note belonging to themselves (get as Admin)' 


      it 'for a note belonging to someone else (get as Admin)' 


      it 'with bad data' 


      it 'with good data' 


      it 'for a note belonging to someone else (post as Admin)' 


      it 'for a note belonging to themselves (delete as Admin)' 


      it 'for a note belonging to someone else (delete as Admin)' 


      it 'have noteable options for selection when viewing noteable_type Grouping' 


      it 'have noteable options for selection when viewing noteable_type Student' 


      it 'have noteable options for selection when viewing noteable_type Assignment' 

    end
  end # admin context
end

