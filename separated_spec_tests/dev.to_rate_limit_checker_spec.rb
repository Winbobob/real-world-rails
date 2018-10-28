require "rails_helper"

RSpec.describe RateLimitChecker do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }

  it ".limit_by_situation returns false for invalid case" 


  it ".limit_by_situation returns true if too many comments at once" 


  it ".limit_by_situation returns false if allowed comment" 


  it ". limit_by_situation returns true if too many published articles at once" 


  it ".limit_by_situation returns false if published articles comment" 


  it ".limit_by_email_recipient_address returns true if too many published articles at once" 


  it ".limit_by_email_recipient_address returns false if published articles comment" 

end

