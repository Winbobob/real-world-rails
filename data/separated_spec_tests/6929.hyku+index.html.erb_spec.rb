RSpec.describe 'hyrax/admin/users/index.html.erb', type: :view do
  let(:presenter) { Hyrax::Admin::UsersPresenter.new }
  let(:users) { [] }
  let(:page) { Capybara::Node::Simple.new(rendered) }

  before do
    # Create four normal user accounts
    (1..4).each do |i|
      users << FactoryBot.create(
        :user,
        display_name: "user#{i}",
        email: "email#{i}@example.com",
        last_sign_in_at: Time.zone.now - 15.minutes,
        created_at: Time.zone.now - 3.days
      )
    end
    allow(presenter).to receive(:users).and_return(users)
    assign(:presenter, presenter)
    render
  end

  it "draws user invite form" 


  it "draws user list with all users" 


  context "with admin users" do
    before do
      # Create two admin acccounts
      (5..6).each do |i|
        users << FactoryBot.create(:admin,
                                   display_name: "admin-user#{i}",
                                   email: "admin#{i}@example.com",
                                   last_sign_in_at: Time.zone.now - 15.minutes,
                                   created_at: Time.zone.now - 3.days)
      end
      render
    end

    it "lists users as having admin role" 

  end

  context "with a user who hasn't accepted an invitation" do
    before do
      # Create one invited (pending) user
      (7..7).each do |i|
        users << FactoryBot.create(:invited_user,
                                   display_name: "invitee#{i}",
                                   email: "invitee#{i}@example.com",
                                   last_sign_in_at: Time.zone.now - 15.minutes,
                                   created_at: Time.zone.now - 3.days)
      end
      render
    end

    it "lists one user as pending status, and others as active" 

  end
end

