# frozen_string_literal: true

describe QA::Runtime::Logger do
  before do
    logger = Logger.new $stdout
    logger.level = ::Logger::DEBUG
    described_class.logger = logger
  end

  it 'logs debug' 


  it 'logs info' 


  it 'logs warn' 


  it 'logs error' 


  it 'logs fatal' 


  it 'logs unknown' 

end

