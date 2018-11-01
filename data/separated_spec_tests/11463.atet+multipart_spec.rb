require 'rails_helper'

RSpec.describe Multipart, type: :service do
  context 'StringParam' do
    it 'renders with a header and the content' 

  end

  context 'FileParam' do
    it 'renders with two headers and the content' 

  end

  context 'Post' do
    let(:multipart_post) {
      Multipart::Post.new(
        '/foo',
        Multipart::StringParam.new('string', 'AAA'),
        Multipart::FileParam.new('file', 'filename', 'BBB')
      )
    }

    before do
      allow(SecureRandom).to receive(:hex) { "0123456789abcdefdeadbeefcafeface" }.once
    end

    it 'includes all parameters in the body, separated by boundary' 


    it 'includes the boundary in the header' 


    it 'is a Net::HTTP::Post' 

  end
end

