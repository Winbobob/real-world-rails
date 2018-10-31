require 'rails_helper'

RSpec.describe UploadSerializer do
  let(:upload) { Fabricate(:upload) }
  let(:subject) { UploadSerializer.new(upload, root: false) }

  it 'should render without errors' 

end

