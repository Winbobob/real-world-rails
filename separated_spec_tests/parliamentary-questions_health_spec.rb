require 'spec_helper'

describe Metrics::Health do
  context '#collect!' do
    context 'DB' do
      before(:each) do
        allow(subject).to receive(:get_sendgrid_status).and_return(true)
        allow(subject).to receive(:get_pqa_api_status).and_return(true)
      end

      it 'should set the db status to false if the db is not available' 


      it 'should set the db status to false if the db is not accessible' 


      it 'should set the db status to true otherwise' 

    end

    context 'SendGrid' do
      before(:each) do
        allow(subject).to receive(:get_db_status).and_return(true)
        allow(subject).to receive(:get_pqa_api_status).and_return(true)
      end

      it 'should set the sendgrid status to false if sendgrid is not available' 


      it 'should set the sendgrid status to false if sendgrid is not accessible' 


      it 'should set the sendgrid status to true otherwise' 

    end

    context 'PQA API' do
      let(:pqa_file) { Metrics::Health::PqaFile }
      let(:pqa_data) {  "1431099345::OK::[]\n"  }

      before(:each) do
        allow(subject).to receive(:get_db_status).and_return(true)
        allow(subject).to receive(:get_sendgrid_status).and_return(true)
      end

      def set_properties(exists, stale, status)
        allow(File).to receive(:exists?).and_return(exists)
        allow(File).to receive(:read).and_return(pqa_data)
        allow_any_instance_of(pqa_file).to receive(:stale?).and_return(stale)
        allow_any_instance_of(pqa_file).to receive(:status).and_return(status)
      end

      it 'should set the pqa api status to false if the api status check is not OK' do        
        set_properties(true, false, 'Not OK')
        subject.collect!

        expect(subject.pqa_api_status).to eq false
      end

      it 'should set the pqa api status to false if the api status check timestamp file is not present' 


      it 'should set the pqa api status to false if the api status check timestamp is not up to date' 


      it 'should set the pqa api status to true otherwise' 

    end
  end
end

