require 'spec_helper'

describe TemplatesController do

  let(:fake_user) { double(:fake_user) }
  let(:fake_app) { double(:fake_app, id: 7, write_attributes: true, save: true) }
  let(:fake_types) { double(:fake_types) }
  let(:fake_template) { double(:fake_template, id: 1) }
  let(:fake_template_form) do
    double(:fake_template_form, repo: 'foo/bar', save: true, app_id: 7, documentation: 'some docs')
  end

  before do
    allow(Template).to receive(:find).and_return(fake_template)
    allow(User).to receive(:find).and_return(fake_user)
    allow(TemplateForm).to receive(:new).and_return(fake_template_form)
    allow(App).to receive(:find).and_return(fake_app)
    allow(Type).to receive(:all).and_return(fake_types)
    allow(fake_user).to receive(:github_access_token_present?)
    allow(fake_user).to receive(:has_valid_github_creds?)
    allow(fake_user).to receive(:has_invalid_github_creds?)
  end

  describe 'GET #new' do
    it 'hydrates the template form with a user, types, and app_id' 


    it 'renders the new view' 


    it 'looks up and assign the user' 


    it 'assigns a template form' 


    context 'when an app cannot be found' do
      before do
        allow(App).to receive(:find).and_raise(ActiveResource::ResourceNotFound.new(double('err', code: '404')))
      end

      it 'redirects to the apps page with a flash message' 

    end

    context 'when the user comes in for the first time' do
      before do
        allow(fake_user).to receive(:has_valid_github_creds?).and_return(false)
        allow(fake_user).to receive(:has_invalid_github_creds?).and_return(false)
      end

      it 'renders the new view without any error message' 


    end

    context 'when user github creds are not valid' do
      expected_flash_msg = I18n.t('templates.new.invalid_creds')
      before do
        allow(fake_user).to receive(:has_invalid_github_creds?).and_return(true)
        allow(fake_user).to receive(:has_valid_github_creds?).and_return(false)
      end

      it 'renders the new view with a flash error message' 


    end

  end

  describe 'POST #create' do

    let(:create_params) do
      {
        'name' => 'My template',
        'repo' => 'foo/bar',
        'app_id' => '7',
        'documentation' => 'some docs'
      }
    end

    it 'assigns a template form with the supplied parameters' 


    it 'updates the app with the new documentation' 


    context 'when saving is successful' do
      before do
        allow(fake_template_form).to receive(:save).and_return(true)
      end

      it 'sets a successful flash message' 


      it 'redirects to the applications path' 


      it 'adds the repo to the template_repo sources' 


    end

    context 'when saving is not successful' do
      before do
        allow(fake_template_form).to receive(:save).and_return(false)
        allow(fake_template_form).to receive(:errors).and_return(['some stuff'])
        allow(fake_template_form).to receive(:user=).and_return(true)
        allow(fake_template_form).to receive(:types=).and_return(true)
      end

      it 'looks up and assigns the user' 


      it 're-renders the templates#new view' 


      it 'does not add the repo to the template_repo sources' 


    end

    context 'for template_repo' do
      it 'invokes create unless repo already exists' 

    end
  end

  describe 'GET #details' do
    it 'assigns the template' 

    it 'renders the details view' 

    it 'renders without a layout' 

  end
end

