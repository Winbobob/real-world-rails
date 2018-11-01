describe 'locomotive/current_site_metafields/index', type: :view do

  helper(Locomotive::BaseHelper, Locomotive::Shared::AccountsHelper, Locomotive::Shared::SitesHelper, Locomotive::Shared::SiteMetafieldsHelper, Locomotive::CurrentSiteMetafieldsHelper, Locomotive::Engine.routes.url_helpers)
  helper(Locomotive::TestViewHelpers)

  let(:schema)  { [] }
  let(:site)    { create('test site', metafields_schema: schema) }

  before do
    allow(view).to receive(:current_site).and_return(site)
    allow(view).to receive(:current_locomotive_account).and_return(site.memberships.first.account)
    assign(:site, site)
  end

  subject { render }

  describe 'no metafields schema' do

    it 'does not render the tab about the locales' 


  end

  describe 'UI' do

    let(:ui) { { 'label' => 'Store settings', 'icon' => 'shopping-cart', 'hint' => 'Metafields are awesome' } }
    let(:site) { create('test site', metafields_schema: schema, metafields_ui: ui) }

    it 'renders the hint' 


  end

  describe 'namespace' do

    let(:schema) { [
      { 'name' => 'theme', 'fields' => [{ 'name' => 'background_color'}], 'position' => 1 },
      { 'name' => 'shop', 'label' => 'My shop', 'fields' => [{ 'name' => 'address'}], 'position' => 0 }
    ] }

    it 'renders the tabs with namespaces' 


  end

  describe 'fields' do

    let(:schema) { [
      { 'name' => 'shop', 'label' => 'My shop', 'fields' => [
        { 'name' => 'address', 'hint' => 'My address goes here' }, { 'name' => 'city', 'label' => 'My city' }, { 'name' => 'zip_code' }, { 'name' => 'icon', 'type' => 'image' }
      ], 'position' => 0 } ] }

    it 'renders the fields' 


    describe 'select field type' do

      let(:schema) { [
        { 'name' => 'theme', 'fields' => [
          { 'name' => 'color', 'type' => 'select', 'select_options' => { 'blue' => { 'en' => 'Blue color' }, 'red' => { 'en' => 'Red color' } } }
        ] }] }

      it 'renders the options' 


    end

  end

end

