describe 'locomotive/memberships/new', type: :view do

  helper(Locomotive::BaseHelper, Locomotive::SitesHelper, Locomotive::Engine.routes.url_helpers)
  helper(Locomotive::TestViewHelpers)

  let(:site)        { build('test site') }
  let(:membership)  { site.memberships.first }

  before do
    allow(view).to receive(:current_site).and_return(site)
    assign(:membership, membership)
  end

  subject { render }

  it 'renders something without an exception' 


end

