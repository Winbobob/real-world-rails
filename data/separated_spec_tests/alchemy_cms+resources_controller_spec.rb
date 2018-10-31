# frozen_string_literal: true

require "spec_helper"

describe Admin::EventsController do
  it "should include ResourcesHelper" 


  describe '#index' do
    let(:params)  { Hash.new }
    let!(:peter)  { create(:event, name: 'Peter') }
    let!(:lustig) { create(:event, name: 'Lustig') }

    before do
      authorize_user(:as_admin)
    end

    it "returns all records" 


    context 'with search query given' do
      let(:params) { {q: {name_or_hidden_name_or_description_or_location_name_cont: "PeTer"}} }

      it "returns only matching records" 


      context "but searching for record with certain association" do
        let(:bauwagen) { create(:location, name: 'Bauwagen') }
        let(:params)   { {q: {name_or_hidden_name_or_description_or_location_name_cont: "Bauwagen"}} }

        before do
          peter.location = bauwagen
          peter.save
        end

        it "returns only matching records" 

      end

      context 'with sort parameter given' do
        let(:params) { {q: {s: "name asc"}} }

        it "returns records in the right order" 

      end
    end
  end

  describe '#update' do
    let(:params) { {q: {name_or_hidden_name_or_description_or_location_name_cont: 'some_query'}, page: 6} }

    context 'with regular noun model name' do
      let(:peter) { create(:event, name: 'Peter') }

      it 'redirects to index, keeping the current location parameters' 

    end

    context 'with zero plural noun model name' do
      let!(:peter) { create(:series, name: 'Peter') }
      let(:params) { {q: { name_cont: 'some_query'}, page: 6} }

      it 'redirects to index, keeping the current location parameters' 

    end
  end

  describe '#create' do
    let(:params) { {q: {name_or_hidden_name_or_description_or_location_name_cont: 'some_query'}, page: 6} }
    let!(:location) { create(:location) }

    context 'with regular noun model name' do
      it 'redirects to index, keeping the current location parameters' 

    end

    context 'with zero plural noun model name' do
      let(:params) { {q: {name_cont: 'some_query'}, page: 6} }

      it 'redirects to index, keeping the current location parameters' 

    end
  end

  describe '#destroy' do
    let(:params) { {q: {name_or_hidden_name_or_description_or_location_name_cont: 'some_query'}, page: 6} }
    let!(:peter)  { create(:event, name: 'Peter') }

    it 'redirects to index, keeping the current location parameters' 

  end
end

