# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminHolidayImportsController do

  describe 'GET new' do

    it 'renders the new template' 


    it 'creates an import' 


    describe 'if the import is valid' do

      it 'populates the import' 


    end

  end

  describe 'POST create' do

    it 'creates an import' 


    describe 'when handling an iCal feed' do

      let(:params) do
        {
          "holiday_import" => {
            "holidays_attributes" => {
              "0" => {
                "description" => "M L King Day",
                "day(1i)" => "2017",
                "day(2i)" => "1",
                "day(3i)" => "16"
              },
              "1" => {
                "description" => "Thanksgiving Day",
                "day(1i)" => "2017",
                "day(2i)" => "11",
                "day(3i)" => "23"
              }
            }
          },
          "commit" => "Import"
        }
      end

      it 'should create the expected holidays' 


    end

    describe 'if the import can be saved' do

      before do
        mock_import = double(HolidayImport, :save => true)
        allow(HolidayImport).to receive(:new).and_return(mock_import)
        post :create
      end

      it 'should show a success notice' 


      it 'should redirect to the index' 


    end

    describe 'if the import cannot be saved' do

      before do
        mock_import = double(HolidayImport, :save => false)
        allow(HolidayImport).to receive(:new).and_return(mock_import)
        post :create
      end

      it 'should render the new template' 


    end

  end


end

