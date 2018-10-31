#  Copyright (c) 2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe PaymentProcessesController do

  let(:invoice)        { invoices(:sent) }
  let(:group)          { invoice.group }

  before { sign_in(people(:bottom_member)) }

  it 'GET#new renders fileupload prompt' 


  it 'POST#create redirects if file has wrong content_type' 


  it 'POST#create redirects if file has bad payload' 


  it 'POST#create handles files with only one entry' 


  it 'POST#create with file informs about valid and invalid payments' 


  it 'POST#create with data persists valid payments' 


  private

  def file(path: xmlfile, content_type:  'text/xml')
    Rack::Test::UploadedFile.new(path, content_type)
  end

  def xmlfile(name = 'camt.054-ESR-ASR_T_CH0209000000857876452_378159670_0_2018031411011923')
    Rails.root.join("spec/fixtures/invoices/#{name}.xml")
  end

end

