require 'spec_helper'

describe HelpController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    context 'with absolute url' do
      it 'keeps the URL absolute' 

    end

    context 'with relative url' do
      it 'prefixes it with /help/' 

    end

    context 'when url is an external link' do
      it 'does not change it' 

    end
  end

  describe 'GET #show' do
    context 'for Markdown formats' do
      context 'when requested file exists' do
        before do
          get :show, path: 'ssh/README', format: :md
        end

        it 'assigns to @markdown' 


        it 'renders HTML' 

      end

      context 'when requested file is missing' do
        it 'renders not found' 

      end
    end

    context 'for image formats' do
      context 'when requested file exists' do
        it 'renders the raw file' 

      end

      context 'when requested file is missing' do
        it 'renders not found' 

      end
    end

    context 'for other formats' do
      it 'always renders not found' 

    end
  end

  describe 'GET #ui' do
    context 'for UI Development Kit' do
      it 'renders found' 

    end
  end

  def stub_readme(content)
    allow(File).to receive(:read).and_return(content)
  end
end

