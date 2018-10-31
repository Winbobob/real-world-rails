describe BackgroundableShim do

  before do
    allow(Settings).to receive(:background_torquebox).and_return(use_torquebox)
  end
  context 'with Torquebox' do
    let(:use_torquebox) { true }
    it 'supports Torquebox background jobs' 

  end
  context 'without Torquebox' do
    let(:use_torquebox) { false }
    it 'still backgrounds' 

  end

end

