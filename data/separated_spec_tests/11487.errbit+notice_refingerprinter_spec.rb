describe NoticeRefingerprinter do
  let(:app) { Fabricate(:app) }
  let(:backtrace) do
    Fabricate(:backtrace)
  end

  before do
    notices
  end

  context 'identical backtraces' do
    let(:notices) do
      5.times.map do
        notice = Fabricate(:notice, backtrace: backtrace, app: app)
        notice.save!
        notice
      end
    end

    it 'has only one err' 

  end

  context 'minor backtrace differences' do
    let(:notices) do
      line_numbers = [1, 1, 2, 2, 3]
      5.times.map do
        b = backtrace.clone
        b.lines[5][:number] = line_numbers.shift
        b.save!
        notice = Fabricate(:notice, backtrace: b, app: app)
        notice.save!
      end
    end

    it 'has three errs with default fingerprinter' 


    it 'has one err when limiting backtrace line count' 

  end
end

