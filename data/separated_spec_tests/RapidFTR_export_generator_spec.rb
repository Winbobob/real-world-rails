require 'spec_helper'

describe ExportGenerator, :type => :request do

  it 'should generate a PDF file for a single child record' 


  it 'should generate a PDF file for multiple child records' 


  describe 'Suspect status' do
    before do
      @suspected_child = build_child 'Suhas', :flag => true
      @unsuspected_child = build_child 'Suhas', :flag => false
    end

    context 'in PDF generation' do
      it 'should be rendered when child is flagged as suspect' 


      it 'should not be rendered when child is not flagged as suspect' 

    end

    context 'in CSV generation' do
      it 'should be rendered when child is flagged as suspect' 


      it 'should not be rendered when child is not flagged as suspect' 

    end
  end

  describe 'Reunification status' do
    before do
      @reunited_child = build_child 'Bob', :reunited => true
      @not_reunited_child = build_child 'Bob', :reunited => false
    end

    context 'in PDF generation' do
      it 'should be rendered when child is reunited' 


      it 'should not be rendered when child is not reunited' 

    end

    context 'in CSV generation' do
      it 'should be rendered when child is reunited' 


      it 'should not be rendered when child is not reunited' 

    end
  end

  describe 'when a section is blank' do
    # before :all do
    #   form = FormSection.new(:name => "test_form", :order => 1 )
    #   form.save!
    # end

    # after :all do
    #   FormSection.all.each{ |form| form.destroy }
    # end

    # it "should not fail" do
    #   child = build_child("jdoe", {
    #       "name" => "Dave",
    #       "age" => "28",
    #       "last_known_location" => "London"})
    #   pdf_generator = ExportGenerator.new child
    #   subject.to_full_pdf
    #  end
  end

  private

  def build_child(created_by, options = {})
    user = User.new(:user_name => created_by)
    Child.new_with_user_name user, options
  end
end

