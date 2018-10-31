require 'spec_helper'

describe Banzai::Filter::VideoLinkFilter do
  def filter(doc, contexts = {})
    contexts.reverse_merge!({
      project: project
    })

    described_class.call(doc, contexts)
  end

  def link_to_image(path)
    %(<img src="#{path}" />)
  end

  let(:project) { create(:project, :repository) }

  context 'when the element src has a video extension' do
    UploaderHelper::VIDEO_EXT.each do |ext|
      it "replaces the image tag 'path/video.#{ext}' with a video tag" 

    end
  end

  context 'when the element src is an image' do
    it 'leaves the document unchanged' 

  end
end

