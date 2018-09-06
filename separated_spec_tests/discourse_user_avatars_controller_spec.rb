require 'rails_helper'

describe UserAvatarsController do

  context 'show_proxy_letter' do
    it 'returns not found if external avatar is set somewhere else' 


    it 'returns an avatar if we are allowing the proxy' 

  end

  context 'show' do
    it 'handles non local content correctly' 


    it 'serves image even if size missing and its in local mode' 

  end
end

