describe NoticesController, type: 'controller' do
  it_requires_authentication for: { locate: :get }

  let(:notice) { Fabricate(:notice) }
  let(:xml) { Rails.root.join('spec', 'fixtures', 'hoptoad_test_notice.xml').read }
  let(:app) { Fabricate(:app) }
  let(:error_report) { double(valid?: true, generate_notice!: true, notice: notice, should_keep?: true) }

  context 'notices API' do
    context "with bogus xml" do
      it "returns an error" 

    end

    context "with all params" do
      before do
        expect(ErrorReport).to receive(:new).with(xml).and_return(error_report)
      end

      context "with xml pass in raw_port" do
        before do
          expect(request).to receive(:raw_post).and_return(xml)
          post :create, format: :xml
        end

        it "generates a notice from raw xml [POST]" 

      end

      it "generates a notice from xml in a data param [POST]" 


      it "generates a notice from xml [GET]" 

      context "with an invalid API_KEY" do
        let(:error_report) { double(valid?: false) }
        it 'return 422' 

      end
    end

    context "without params needed" do
      it 'return 400' 

    end
  end

  describe "GET /locate/:id" do
    context 'when logged in as an admin' do
      before(:each) do
        @user = Fabricate(:admin)
        sign_in @user
      end

      it "should locate notice and redirect to problem" 

    end
  end
end

