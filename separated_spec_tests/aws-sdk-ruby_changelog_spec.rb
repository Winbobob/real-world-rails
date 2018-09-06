require_relative 'spec_helper'

module BuildTools
  describe Changelog do

    let(:path) { Tempfile.new('file').path }
    let(:expected_changelog) { <<-LOG
Unreleased Changes
------------------

* Feature - API update.

1.0.0.rc2 (2016-12-09)
------------------

* Feature - API update.

* Issue - Fixed an issue. See related Github issue #0000

1.0.0.rc1 (2016-12-05)
------------------

* Feature - Initial preview release of the `aws-sdk-s3` gem.

LOG
    }

    let(:expected_version) { <<-LOG
Unreleased Changes
------------------

foo.bar.baz (2017-02-08)
------------------

* Feature - API update.

1.0.0.rc2 (2016-12-09)
------------------

* Feature - API update.

* Issue - Fixed an issue. See related Github issue #0000

1.0.0.rc1 (2016-12-05)
------------------

* Feature - Initial preview release of the `aws-sdk-s3` gem.

LOG
    }

    let(:empty_changelog) { <<-LOG
Unreleased Changes
------------------

1.0.0.rc1 (2016-12-05)
------------------

* Feature - Initial preview release of the `aws-sdk-s3` gem.

LOG
    }

    let(:complete_log) { <<-LOG
Unreleased Changes
------------------

1.0.0.rc2 (2016-12-09)
------------------

* Feature - API update.

* Issue - Fixed an issue. See related Github issue #0000

1.0.0.rc1 (2016-12-05)
------------------

* Feature - Initial preview release of the `aws-sdk-s3` gem.

LOG
    }

    let(:incomplete_log) { <<-LOG
1.0.0.rc2 (2016-12-09)
------------------

* Feature - API update.

* Issue - Fixed an issue. See related Github issue #0000

1.0.0.rc1 (2016-12-05)
------------------

* Feature - Initial preview release of the `aws-sdk-s3` gem.

LOG
    }

    it 'adds entries when unreleased changes section presents' 


    it 'adds entries under new unreleased section when not present' 


    it 'grabs unreleased changes correctly' 


    it 'updates version number correctly' 


  end
end

