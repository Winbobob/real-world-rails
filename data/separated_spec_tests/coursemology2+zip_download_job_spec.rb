# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Material::ZipDownloadJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:folder) { create(:material).folder }
    subject { Course::Material::ZipDownloadJob }

    it 'can be queued' 


    it 'downloads the materials' 

  end
end

