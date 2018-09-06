describe ClaimController, :type => :controller do
  render_views

  context 'setting production and use_live_postcode_lookup' do
    it 'should not be produciton nor use_live_postcode_lookup in demo with nothing in url' 


    it 'should not be production but should be use_live_postcode_lookup if url contains use_live_postcode_lookup' 


    it 'should be both production and use_live_postcode_lookup on staging' 


    it 'should be both production and use_live_postcode_lookup on production' 


  end

  describe "#new" do
    it "should render the new claim form" 


    shared_examples 'session mantained' do
      it 'should not clear session' 

    end

    context 'referrer is' do
      before do
        allow(@controller.request).to receive(:referrer).and_return("http://example.com#{referrer_path}")
      end

      context '/' do
        let(:referrer_path) { '/' }
        it_behaves_like 'session mantained'
      end

      context '/confirmation' do
        let(:referrer_path) { '/confirmation' }
        it_behaves_like 'session mantained'
      end

      context '' do
        let(:referrer_path) { '' }
        it_behaves_like 'session mantained'
      end

      context 'is gov.uk landing page' do
        before {
          allow(@controller.request).to receive(:referrer).and_return('https://www.gov.uk/accelerated-possession-eviction')
        }
        let(:referrer_path) { nil }

        it 'should clear session' 

      end

    end
  end

  describe '#confirmation' do
    context 'with valid claim data' do
      it 'should render the confirmation page' 


      it 'should contain links to root_url' 

    end

    context 'with no claim data' do
      it 'should redirect to the claim form' 

    end

    context 'with invalid claim data' do
      it 'should redirect to the claim form' 

    end
  end

  describe '#submission' do
    it 'should redirect to the confirmation page' 

  end

  describe 'GET download' do

    context 'with valid claim data' do
      it "should return a PDF" 

    end

    context "with 'flatten=false' parameter" do
      it 'should still return PDF' 

    end

    context 'with invalid claim data' do
      it 'should redirect to the claim form' 

    end

    context 'with expired session' do
      it 'should log and call app signal' 

    end

    context 'logging fee_account_num' do
      it 'should log fee account num logstash record if first time for this session' 


      it 'should not log a fee account num if already done this session for the same postcode' 


      it 'should log a fee account num if already done this session for a different postcode' 

    end
  end

  describe 'GET data' do

    context 'with valid claim data' do
      it "should return json" 

    end

    context 'with invalid claim data' do
      it 'should redirect to the claim form' 

    end
  end

end

