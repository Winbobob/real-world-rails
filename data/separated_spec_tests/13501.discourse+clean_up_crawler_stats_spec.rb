require 'rails_helper'

describe Jobs::CleanUpCrawlerStats do
  subject { Jobs::CleanUpCrawlerStats.new.execute({}) }

  it "deletes records older than 30 days old" 


  it "keeps only the top records from the previous day" 

end

