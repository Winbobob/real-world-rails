describe "Notices management", type: 'request' do
  let(:errbit_app) { Fabricate(:app, api_key: 'APIKEY') }

  describe "create a new notice" do
    context "with valide notice" do
      let(:xml) { Rails.root.join('spec', 'fixtures', 'hoptoad_test_notice.xml').read }
      it 'save a new notice' 

    end

    context "with notice with empty backtrace" do
      let(:xml) { Rails.root.join('spec', 'fixtures', 'hoptoad_test_notice_without_line_of_backtrace.xml').read }
      it 'save a new notice' 

    end

    context "with notice with bad api_key" do
      let(:errbit_app) { Fabricate(:app) }
      let(:xml) { Rails.root.join('spec', 'fixtures', 'hoptoad_test_notice.xml').read }
      it 'not save a new notice and return 422' 

    end

    context "with GET request" do
      let(:xml) { Rails.root.join('spec', 'fixtures', 'hoptoad_test_notice.xml').read }
      it 'save a new notice' 

    end
  end
end

