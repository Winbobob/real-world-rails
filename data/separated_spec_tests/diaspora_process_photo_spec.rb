# frozen_string_literal: true

describe Workers::ProcessPhoto do
  before do
   @user = alice
   @aspect = @user.aspects.first

   @fixture_name = File.join(File.dirname(__FILE__), '..', 'fixtures', 'button.png')

   @saved_photo = @user.build_post(:photo, :user_file => File.open(@fixture_name), :to => @aspect.id)
   @saved_photo.save
  end

  it 'saves the processed image' 


  context 'when trying to process a photo that has already been processed' do
    before do
      Workers::ProcessPhoto.new.perform(@saved_photo.id)
      @saved_photo.reload
    end

    it 'does not process the photo' 

  end

  context 'when a gif is uploaded' do
    before do
      @fixture_name = File.join(File.dirname(__FILE__), '..', 'fixtures', 'button.gif')
      @saved_gif = @user.build_post(:photo, :user_file => File.open(@fixture_name), :to => @aspect.id)
      @saved_gif.save
    end

    it 'does not process the gif' 

  end

  it 'does not throw an error if it is called on a remote photo' 


  it 'handles already deleted photos gracefully' 

end

