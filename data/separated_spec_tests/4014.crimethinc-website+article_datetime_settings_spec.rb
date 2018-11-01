require 'rails_helper'

describe 'Setting and changing an articles published_at date' do
  let(:admin) do
    create(:user, username: 'user1', password: 'c' * 31)
  end

  before do
    create(:status, :published)
    create(:status, :draft)
  end

  it 'creates a new article' 


  it 'updates an existing article' 


  it 'saves an article without entering publication date info' 


  it 'uses ‘PUBLISH NOW’ feature', :js do
    # TODO: the 'publish now' feature relies on a JavaScript in
    # the front-end to automatically set the form fields and submit the
    # form. This makes testing time hard since we cannot
    # Timecop.freeze the front-end. Consider making the 'Publish Now!'
    # feature a back-end feature
    login_user(admin)
    visit '/admin/articles'

    click_on 'NEW'

    time = Time.now.utc

    within('#datetime') { click_on 'Publish NOW!' }

    expect(page).to have_content 'Article was successfully created'
    article = Article.last

    # rough approximation of 'now'
    expect(article.published_at.day).to eq(time.day)
    expect(article.published_at.month).to eq(time.month)
    expect(article.published_at.year).to eq(time.year)
    expect(article.published_at.hour).to eq(time.hour)
    expect(article).to be_published

    expect(article.reload.published_at_tz).to eq('UTC')
  end
end

