# frozen_string_literal: true

require 'rails_helper'

describe EmailTool::TargetsParser do
  let(:csv_string) do
    <<-EOS
      name, email, country
      John Doe, john@gmail.com, United States
      Patrick Watson, patrick@gmail.com, France
    EOS
  end

  let(:targets) { EmailTool::TargetsParser.parse_csv(csv_string) }

  it 'returns 2 targets' 


  it 'creates targets assigning the information properly' 


  it 'creates targets with extra properties in the fields hash' 

end

