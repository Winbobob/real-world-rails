require 'spec_helper'

describe ChildrenHelper, :type => :helper do

  context 'View module' do
    it 'should have PER_PAGE constant' 


    it 'should have MAX_PER_PAGE constant' 

  end

  context 'EditView module' do
    it 'should have ONETIME_PHOTOS_UPLOAD_LIMIT constant' 

  end

  describe '#thumbnail_tag' do
    it 'should use current photo key if photo ID is not specified' 

    it 'should use photo ID if specified' 

  end

  # Delete this example and add some real ones or delete this file
  it 'is included in the helper object' 


  describe '#link_to_update_info' do
    it 'should not show link if child has not been updated' 


    it 'should show link if child has been updated by multiple people' 

  end
  describe 'field_for_display' do
    it 'should return the string value where set' 

    it 'should return empty string if field is nil or 0 length' 

    it 'should comma separate values if field value is an array' 

  end

  describe '#flag_summary_for_child' do
    it 'should show the flag summary for the child' 

  end

  describe '#order_options_array_from' do
    after :each do
      reset_couchdb!
    end

    it 'should use translated system field names' 


    it 'should translate all default and date field names' 


    it 'should map form fields by display name and name' 


    it 'should map multiple forms fields by display name and name' 


    it 'should combine form fields and system fields' 

  end

  describe '#confirmed_matches_header' do
    it 'should return nil if matches is empty' 


    it 'should separate links by commas and spaces' 

  end

  describe 'potential match links' do
    let!(:child) { build :child }
    let!(:enquiry) { build :enquiry }
    let!(:potential_match) { PotentialMatch.new(:child => child, :enquiry => enquiry) }

    describe '#mark_as_not_matching_link' do
      it 'should return nil if current child is a confirmed match' 


      it 'should return a link if confirmed_match is nil' 


      it 'should return a delete link beginning with |' 


      it 'should return a delete link returning to :child' 

    end

    describe '#confirm_match_link' do
      it 'should return nil if a confirmed_match exists' 


      it 'should return appropriate message if the enquiry is reunited elsewhere' 


      it 'should return appropriate message if the enquiry is confirmed elsewhere' 


      it 'should return a put link beginning with |' 


      it 'should return a put link with options' 

    end

    describe '#unconfirm_match_link' do
      it 'should return nil if there is no confirmed match' 


      it 'should return nil if child isnt the confirmed match' 


      it 'should return nil if enquiry isnt the confirmed match' 


      it 'should return a put link with confirm=false for a child that is the confirmed match' 


      it 'should return a put link with options for a child that is the confirmed match' 

    end
  end

  describe 'child_title' do
    before :each do
      reset_couchdb!
    end

    it 'should return short id and title field' 


    it 'should return short id and multiple title fields' 


    it 'should return only short id if no title field' 


    it 'should not have unecessary spaces' 

  end
end

