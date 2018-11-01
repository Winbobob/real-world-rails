require 'rails_helper'

describe PicturesController, type: :controller do
  before do
    @person = FactoryGirl.create(:person)
    @album = FactoryGirl.create(:album, owner: @person)
    @picture = FactoryGirl.create(:picture, album: @album, person: @person)
  end

  def add_pictures(how_many = 2)
    @picture2 = FactoryGirl.create(:picture, album: @album, person: @person)
    @picture3 = FactoryGirl.create(:picture, album: @album, person: @person) unless how_many == 1
  end

  context '#index' do
    it 'redirects to album show page' 

  end

  context '#show' do
    it 'should display a picture' 

  end

  context '#next' do
    before do
      @picture2 = FactoryGirl.create(:picture, album: @album, person: @person)
    end

    it 'should redirect to next picture' 


    context 'given specified picture is last in album' do
      before do
        get :next,
            params: { album_id: @album.id, id: @picture2.id },
            session: { logged_in_id: @person.id }
      end

      it 'should redirect to first picture' 

    end
  end

  context '#prev' do
    before do
      @picture2 = FactoryGirl.create(:picture, album: @album, person: @person)
    end

    it 'should redirect to previous picture' 


    context 'given specified picture is first in album' do
      before do
        get :next,
            params: { album_id: @album.id, id: @picture.id },
            session: { logged_in_id: @person.id }
      end

      it 'should redirect to last picture' 

    end
  end

  context '#create' do
    it 'should create one picture' 


    it 'should create more than one picture' 


    it 'should create a new album by name' 


    context 'given one bad image and one good image' do
      before do
        Picture.delete_all
        post :create,
             params: {
               album: 'My Stuff',
               pictures: [
                 Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/image.jpg'), 'image/jpeg', true),
                 Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/image.bmp'), 'image/bmp', true)
               ]
             },
             session: { logged_in_id: @person.id }
      end

      it 'should create one image and fail one image' 

    end

    context 'group specified' do
      before do
        @group = FactoryGirl.create(:group)
        @album = @group.albums.create(name: 'Existing Album')
      end

      context 'existing album name specified' do
        context 'user is not a group member' do
          it 'should return forbidden' 

        end

        context 'user is a group member' do
          before do
            @group.memberships.create(person: @person)
          end

          it 'should redirect to the album' 


          context 'group does not allow pictures' do
            before do
              @group.update_attributes!(pictures: false)
            end

            it 'should return forbidden' 

          end
        end
      end
    end

    context 'group specified' do
      before do
        @group = FactoryGirl.create(:group)
      end

      context 'new album name specified' do
        context 'user is not a group member' do
          it 'should return forbidden' 


          it 'should not create an album' 

        end

        context 'user is a group member' do
          before do
            @group.memberships.create(person: @person)
          end

          it 'should redirect to the group' 


          context 'group does not allow pictures' do
            before do
              @group.update_attributes!(pictures: false)
            end

            it 'should return forbidden' 


            it 'should not create an album' 

          end
        end
      end
    end

    it 'should use an existing album by name' 


    it 'should use an existing album by id' 

  end

  context '#update' do
    it 'should select a picture as an album cover' 


    it 'should rotate a picture' 

  end

  context '#destroy' do
    it 'should delete a picture' 

  end
end

