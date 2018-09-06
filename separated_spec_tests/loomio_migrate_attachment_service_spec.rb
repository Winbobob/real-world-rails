require 'rails_helper'

describe MigrateAttachmentService do
  let!(:discussion) { create :discussion }
  let!(:another_discussion) { create :discussion }
  let!(:attachment) { create :attachment, attachable: discussion, location: "https://www.example.com/image.jpg", filename: "image.jpg" }

  it 'creates a new document if the attachment is passed' 


  it 'does not create a new document if the attachment is not passed' 

end

