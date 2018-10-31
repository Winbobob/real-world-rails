require 'rails_helper'
require_relative '../helpers/rspec_matchers'

describe 'adoptapet_sync:export_upload', type: :task do
  describe 'inclusion of photos in the csv' do
    5.times do |i|
      let("photo#{i}"){ FactoryBot.build(:photo, updated_at: DateTime.new(2018,1,i+1)) }
    end
    let(:foster) { FactoryBot.create(:foster, region: "VA") }
    let!(:dog) { FactoryBot.create(:dog, status: 'adoptable', foster_id: foster.id, photos_attributes: [photo0,photo1,photo2,photo3,photo4].map(&:attributes)) }
    let!(:rake){ task.execute }
    let(:recent_photos){ Dog.first.photos.sort_by{|photo| photo.updated_at}.reverse[0..3]}
    let(:photo_urls){ recent_photos.map{|photo| photo.photo.url(:large)} }
    let(:csv) { CSV.read( '/tmp/adoptapet/pets_VA.csv' ) }

    it "should include most recent four photos for a dog" 

  end

  describe 'inclusion of dogs by status' do
    let(:foster) { FactoryBot.create(:foster, region: "VA") }
    Dog::STATUSES.each do |status|
      dog_type = status.gsub(/\s/,'_')+'_dog'
      let!(dog_type){ FactoryBot.create(:dog, status: status, foster_id: foster.id) }
    end

    let!(:rake){ task.execute }
    let(:csv) { CSV.read( '/tmp/adoptapet/pets_VA.csv' ) }

    it 'should include only adoptable, adoption pending and coming soon dogs' 

  end

  describe 'inclusion of dogs by location of foster' do
    let(:va_foster) { FactoryBot.create(:foster, region: "VA") }
    let(:ca_foster) { FactoryBot.create(:foster, region: "CA") }
    let!(:va_dog){ FactoryBot.create(:dog, status: 'adoptable', foster_id: va_foster.id) }
    let!(:ca_dog){ FactoryBot.create(:dog, status: 'adoptable', foster_id: ca_foster.id) }

    let!(:rake){ task.execute }
    let(:csv) { CSV.read( '/tmp/adoptapet/pets_VA.csv' ) }

    it 'should include only adoptable, adoption pending and coming soon dogs' 

  end
end

