require 'spec_helper'

describe TemplateReposController do

  describe 'GET #index' do

    let(:template_repos) { [TemplateRepo.new] }

    before do
      allow(TemplateRepo).to receive(:all).and_return(template_repos)
    end

    it 'renders the index view' 


    it 'retrieves all template repos' 

  end

  describe 'POST #create' do

    let(:fake_template_repo) { [TemplateRepo.new] }

    context 'when create is successful' do
      before do
        allow(TemplateRepo).to receive(:create).and_return(fake_template_repo)
      end

      it 'assigns the template repo' 


      it 'creates a template repo with a sanitized name' 


      it 'creates a template repo with a sanitized name' 

    end

    context 'when create is not successful' do
      before do
        allow(TemplateRepo).to receive(:create).and_raise(StandardError.new)
      end

      it 'handles an exception' 

    end
  end

  describe 'POST #reload' do

    let(:template_repo) { double(:template_repo, post: true) }

    before do
      allow(TemplateRepo).to receive(:new).with({ id: '1' }, true).and_return(template_repo)
    end

    it 'reloads the template repo' 


    it 'redirects to template repos index path' 


  end

  describe 'DELETE #destroy' do

    let(:template_repo) { double(:template_repo, destroy: true) }

    before do
      allow(TemplateRepo).to receive(:new).with({ id: '1' }, true).and_return(template_repo)
    end

    it 'destroys the template repo' 


  end

end

