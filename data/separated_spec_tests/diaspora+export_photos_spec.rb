# frozen_string_literal: true

describe Workers::ExportPhotos do
  before do
    allow(User).to receive(:find).with(alice.id).and_return(alice)
  end

  it 'calls export_photos! on user with given id' 


  it 'sends a success message when the export photos is successful' 


  it 'sends a failure message when the export photos fails' 

end

