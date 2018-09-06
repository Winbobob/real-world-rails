describe "Add attachments" do
  let(:proposal) { create(:proposal, :with_parallel_approvers) }
  let!(:attachment) do
    create(:attachment, proposal: proposal,
                        user: proposal.requester)
  end

  before do
    login_as(proposal.requester)
    stub_request(:put, /.*c2-prod.s3.amazonaws.com.*/)
    stub_request(:head, /.*c2-prod.s3.amazonaws.com.*/)
    stub_request(:delete, /.*c2-prod.s3.amazonaws.com.*/)
  end

  it "is visible on a proposal" 


  it "disables 'add attachment' button if no attachment is selected", :js do
    proposal = create(:proposal)
    login_as(proposal.requester)

    visit proposal_path(proposal)
    expect(page).to have_selector("input#add_a_file[disabled]")
  end

  it "uploader can delete" 


  it "does not have a delete link for another" 


  it "saves attachments submitted via the webform" 


  it "saves attachments submitted via the webform with js", :js, js_errors: false do
    work_order = create(:ncr_work_order, :with_beta_requester)
    proposal = work_order.proposal
    login_as(proposal.requester)

    visit proposal_path(proposal)
    page.execute_script("$('#attachment_file').addClass('show-attachment-file');")
    page.attach_file("attachment[file]", "#{Rails.root}/app/assets/images/attachment.png", visible: false)
    wait_for_ajax
    within(".attachment-list") do
      expect(page).to have_content("attachment.png")
    end
    within("#card-for-activity") do
      expect(page).to have_content("attachment.png")
    end
  end

  it "deletes attachments with js", :js do
    work_order = create(:ncr_work_order, :with_beta_requester)
    proposal = work_order.proposal
    create(:attachment, proposal: proposal,
                        user: proposal.requester)
    login_as(proposal.requester)
    visit proposal_path(proposal)
    page.find('.attachment-list-item').find('.remove-button').click
    click_on "REMOVE"
    wait_for_ajax
    expect(page).to have_content("Attachment removed")
  end

  it "emails everyone involved in the proposal" 

end

