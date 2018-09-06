require 'spec_helper'
describe SearchController, :type => :controller do
  shared_examples 'search results' do
    it 'should render error if search is invalid' 


    it 'should search against specified model' 


    it 'should use fulltext search with the query' 


    it 'should authorize the user' 

  end

  describe '#search' do
    context 'when searching Children' do
      let :search do
        search = instance_double('Search', :results => [])
        allow(search).to receive(:paginated).and_return(search)
        allow(search).to receive(:created_by).and_return(search)
        allow(search).to receive(:fulltext_by).and_return(search)
        allow(search).to receive(:results).and_return([])
        allow(Search).to receive(:for).with(Child).and_return(search)
        search
      end

      before :all do
        create :form, :name => Child::FORM_NAME
      end

      before :each do
        fake_field_worker_login
      end

      it_behaves_like 'search results' do
        let(:search_type) { Child }
      end

      it 'should only return children for current user' 


      it 'should return all children if user can view all' 

    end

    context 'when searching Enquiries' do
      let :search do
        search = instance_double('Search', :results => [])
        allow(search).to receive(:paginated).and_return(search)
        allow(search).to receive(:created_by).and_return(search)
        allow(search).to receive(:fulltext_by).and_return(search)
        allow(search).to receive(:results).and_return([])
        allow(Search).to receive(:for).with(Enquiry).and_return(search)
        search
      end

      before :all do
        create :form, :name => Enquiry::FORM_NAME
      end

      before :each do
        fake_field_worker_login
      end

      it_behaves_like 'search results' do
        let(:search_type) { Enquiry }
      end

      it 'should return all children if user can view all' 

    end

    context 'when search type is unknown' do
      it 'should return status 400' 

    end

    context 'when enquiries are turned off' do
      before :each do
        SystemVariable.all.each { |variable| variable.destroy }
        @enable_enquiries = SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '0')
      end

      after :each do
        @enable_enquiries.destroy
      end

      it 'should return status 400' 

    end
  end
end

