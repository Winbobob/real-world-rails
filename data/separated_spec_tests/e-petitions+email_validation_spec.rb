require 'rails_helper'

RSpec.describe 'Email validation' do
  subject { EMAIL_REGEX }

  it 'matches simple email addresses' 


  it 'matches subdomain email addresses' 


  it 'matches email addresses with uncommon tld' 


  it 'matches email addresses with single characters' 


  it 'matches email addresses with special characters' 


  it 'doesn\'t match email addresses without a domain and tld' 


  it 'doesn\'t match email addresses without a local' 


  it 'doesn\'t match email addresses without at sign' 


  it 'doesn\'t match email addresses with a space character' 


  it 'doesn\'t match email addresses with at sign in local, sld or tld' 

end

