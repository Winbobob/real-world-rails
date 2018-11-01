require 'spec_helper'

describe Gitlab::SQL::Glob do
  describe '.to_like' do
    it 'matches * as %' 


    it 'matches % literally' 


    it 'matches _ literally' 

  end

  def glob(string, pattern)
    match(string, subject.to_like(quote(pattern)))
  end

  def match(string, pattern)
    value = query("SELECT #{quote(string)} LIKE #{pattern}")
              .rows.flatten.first

    check = Gitlab.rails5? ? true : 't'
    case value
    when check, 1
      true
    else
      false
    end
  end

  def query(sql)
    ActiveRecord::Base.connection.select_all(sql)
  end

  def quote(string)
    ActiveRecord::Base.connection.quote(string)
  end
end

