require 'chefspec'

describe 'render_file::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  context 'file' do
    it 'renders the file' 


    it 'renders the file with content' 


    it 'renders the file with matching content' 


    it 'renders the file when given a block' 


    it 'renders the file with content matching arbitrary matcher' 

  end

  context 'cookbook_file' do
    shared_examples 'renders file' do
      it 'renders the file' 


      it 'renders the file with content' 


      it 'renders the file with matching content' 


      it 'renders the file when given a block' 


      it 'renders the file with content matching arbitrary matcher' 


      it 'renders the file with chained content matchers' 

    end

    context 'with a pristine filesystem' do
      it_behaves_like 'renders file'
    end

    context 'with a same rendered file on filesystem' do
      before do
        allow(File).to receive(:read).and_call_original
        allow(File).to receive(:read).with('/tmp/cookbook_file', 'rb').and_yield('This is content!')
      end

      it_behaves_like 'renders file'
    end
  end

  context 'template' do
    it 'renders the file' 


    it 'renders the file with content' 


    it 'renders the file with matching content' 


    it 'renders the file when given a block' 


    it 'renders the file with content matching arbitrary matcher' 

  end

  context 'template with render' do
    it 'renders the file' 


    it 'renders the file with content' 


    it 'renders the file when given a block' 


    it 'renders the file with matching content' 

  end
end

