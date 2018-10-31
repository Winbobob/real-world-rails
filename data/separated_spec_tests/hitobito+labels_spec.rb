require 'spec_helper'

describe Export::Pdf::Labels do

  let(:contactables) { [people(:top_leader).tap{ |u| u.update(nickname: 'Funny Name') }] }
  let(:label_format) { label_formats(:standard) }
  let(:pdf) { Export::Pdf::Labels.new(label_format).generate(contactables) }

  let(:subject) { PDF::Inspector::Text.analyze(pdf) }

  context 'for nickname' do
    it 'renders pp_post if pp_post given' 


    it 'ignores nickname if disabled' 

  end

  context 'for pp_post' do
    it 'renders pp_post if pp_post given' 


    it 'ignores pp_post if not given' 

  end
end

