require 'spec_helper'

describe ExportGenerator do
  describe 'when generating a CSV download' do
    describe 'with just a name field' do

      before(:each) do
        @user = User.new(
            :user_name => 'user',
            :full_name => 'name',
            :organisation => 'UNICEF'
        )

        @child1 = Child.new_with_user_name(@user,
                                           '_id' => '3-123451', 'name' => 'Dave', 'unique_identifier' => 'xxxy',
                                           'photo_url' => 'http://testmachine:3000/some-photo-path/1',
                                           'audio_url' => 'http://testmachine:3000/some-audio-path/1',
                                           'current_photo_key' => 'photo-some-id-1', 'some_audio' => 'audio-some-id-1')
        @child1.create_unique_id

        @child2 = Child.new_with_user_name(@user,
                                           '_id' => '4-153213', 'name' => 'Mary', 'unique_identifier' => 'yyyx',
                                           'photo_url' => 'http://testmachine:3000/some-photo-path/2',
                                           'audio_url' => 'http://testmachine:3000/some-audio-path/2',
                                           'current_photo_key' => 'photo-some-id-2', 'some_audio' => 'audio-some-id-2')
        @child2.create_unique_id

        @child3 = Child.new_with_user_name(@user,
                                           '_id' => '5-188888', 'name' => 'Jane', 'unique_identifier' => 'yxyy',
                                           'photo_url' => 'http://testmachine:3000/some-photo-path/3',
                                           'audio_url' => 'http://testmachine:3000/some-audio-path/3',
                                           'current_photo_key' => 'photo-some-id-2', 'some_audio' => 'audio-some-id-2')
        @child3.create_unique_id
      end

      subject do
        ExportGenerator.new([@child1, @child2, @child3]).to_csv
      end

      it 'should have a header for unique_identifier followed by all the user defined fields and metadata fields' 


      it 'should render a row for each result, plus a header row' 


      it 'should add the correct mime type' 


      it 'should add the correct filename' 


      it 'should have a photo column with appropriate links' 


      it 'should have an audio column with appropriate links' 


      it 'should add metadata of children at the end' 


      it 'should not have updated_by info for child that was not edited' 


    end

    describe 'with a multi checkbox field' do
      subject do
        allow(FormSection).to receive(:all_visible_child_fields_for_form).and_return [
          build(:check_boxes_field, :name => 'multi')
        ]
        ExportGenerator.new([
          Child.new('multi' => %w(Dogs Cats), 'unique_identifier' => 'xxxy'),
          Child.new('multi' => nil, 'unique_identifier' => 'xxxy'),
          Child.new('multi' => %w(Cats Fish), 'unique_identifier' => 'yyyx')
        ]).to_csv
      end

      it 'should render multi checkbox fields as a comma separated list' 

    end

    describe 'for just one record' do
      subject do
        ExportGenerator.new([
          Child.new('name' => 'Mary', 'unique_identifier' => 'yyyx')
        ]).to_csv
      end

      it 'should add the unique id to the filename' 

    end
  end
end

