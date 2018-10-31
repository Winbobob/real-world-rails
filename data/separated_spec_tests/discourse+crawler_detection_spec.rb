require 'rails_helper'
require_dependency 'crawler_detection'

describe CrawlerDetection do

  def crawler!(s)
    if (!CrawlerDetection.crawler?(s))
      raise "#{s} should be a crawler!"
    end
  end

  def not_crawler!(s)
    if CrawlerDetection.crawler?(s)
      raise "#{s} should not be a crawler!"
    end
  end

  describe "crawler?" do

    it "can be amended via site settings" 


    it "returns true for crawler user agents" 


    it "returns false for non-crawler user agents" 


  end

  describe 'allow_crawler?' do
    it 'returns true if whitelist and blacklist are blank' 


    context 'whitelist is set' do
      before do
        SiteSetting.whitelisted_crawler_user_agents = 'Googlebot|Twitterbot'
      end

      it 'returns true for matching user agents' 


      it 'returns false for user agents that do not match' 


      context 'and blacklist is set' do
        before do
          SiteSetting.blacklisted_crawler_user_agents = 'Googlebot-Image'
        end

        it 'ignores the blacklist' 

      end
    end

    context 'blacklist is set' do
      before do
        SiteSetting.blacklisted_crawler_user_agents = 'Googlebot|Twitterbot'
      end

      it 'returns true for crawlers that do not match' 


      it 'returns false for user agents that match' 

    end
  end

  describe 'is_blocked_crawler?' do
    it 'is false if user agent is a crawler and no whitelist or blacklist is defined' 


    it 'is false if user agent is not a crawler and no whitelist or blacklist is defined' 


    it 'is true if user agent is a crawler and is not whitelisted' 


    it 'is false if user agent is not a crawler and there is a whitelist' 


    it 'is true if user agent is a crawler and is blacklisted' 


    it 'is true if user agent is a crawler and is not blacklisted' 


    it 'is false if user agent is not a crawler and blacklist is defined' 


    it 'is true if user agent is missing and whitelist is defined' 


    it 'is false if user agent is missing and blacklist is defined' 

  end
end

