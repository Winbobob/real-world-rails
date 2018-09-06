require 'rails_helper'

RSpec.describe SearchHelper, type: :helper do
  describe "#paginate" do
    let(:page_stubs) do
      {
        total_pages: 3,
        previous_link: "/petitions?page=1&state=all",
        next_link: "/petitions?state=all",
        model: Petition
      }
    end

    context "when viewing the first page of the petitions search results" do
      let(:first_page_stubs) do
        {
          first_page?: true,
          last_page?: false,
          previous_params: { state: :all, page: nil },
          next_params: { state: :all, page: 2 },
          previous_page: nil,
          next_page: 2,
        }
      end

      let(:petitions) { double('petitions', page_stubs.merge(first_page_stubs)) }

      it "adds a link to the next page" 


      it "does not add a link to the previous page" 


      it "adds the correct number range for the next page" 

    end

    context "when viewing an intermediary page of the petitions search results" do
      let(:intermediary_page_stubs) do
        {
          first_page?: false,
          last_page?: false,
          previous_params: { state: :all, page: 1 },
          next_params: { state: :all, page: 3 },
          previous_page: 1,
          next_page: 3,
        }
      end

      let(:petitions) { double('petitions', page_stubs.merge(intermediary_page_stubs)) }

      it "adds a link to the next page" 


      it "adds a link to the previous page" 


      it "adds the correct number range for the next page" 


      it "adds the correct number range for the previous page" 

    end

    context "when viewing the last page of the petitions search results" do
      let(:last_page_stubs) do
        {
          first_page?: false,
          last_page?: true,
          previous_params: { state: :all, page: 2 },
          next_params: { state: :all, page: nil },
          previous_page: 2,
          next_page: nil,
        }
      end

      let(:petitions) { double('petitions', page_stubs.merge(last_page_stubs)) }

      it "does not add a link to the next page" 


      it "adds a link to the previous page" 


      it "adds the correct number range for the previous page" 

    end
  end

  describe "#filtered_petition_count" do
    context 'when search term is not present' do
      it 'renders correctly with > 1 results' 

      it 'renders correctly with just 1 result' 

    end

    context 'when search term is present' do
      it 'renders correctly with > 1 results' 

      it 'renders correctly with just 1 result' 

    end
  end
end

