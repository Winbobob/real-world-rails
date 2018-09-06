describe "Radiant::Config::Definition" do
  before :each do
    Radiant::Config.initialize_cache
    @basic = Radiant::Config::Definition.new({
      default: 'quite testy'
    })
    @boolean = Radiant::Config::Definition.new({
      type: :boolean,
      default: true
    })
    @integer = Radiant::Config::Definition.new({
      type: :integer,
      default: 50
    })
    @validating = Radiant::Config::Definition.new({
      default: "Monkey",
      validate_with: lambda {|s| s.errors.add(:value, "That's no monkey") unless s.value == "Monkey" }
    })
    @selecting = Radiant::Config::Definition.new({
      default: "Monkey",
      select_from: [["m", "Monkey"], ["g", "Goat"]]
    })
    @selecting_from_hash = Radiant::Config::Definition.new({
      default: "Non-monkey",
      allow_blank: true,
      select_from: {"monkey" => "Definitely a monkey", "goat" => "No fingers", "Bear" => "Angry, huge", "Donkey" => "Non-monkey"}
    })
    @selecting_required = Radiant::Config::Definition.new({
      default: "other",
      allow_blank: false,
      select_from: lambda { ['recent', 'other', 'misc'] }
    })
    @enclosed = "something"
    @selecting_at_runtime = Radiant::Config::Definition.new({
      default: "something",
      select_from: lambda { [@enclosed] }
    })
    @protected = Radiant::Config::Definition.new({
      default: "Monkey",
      allow_change: false
    })
    @hiding = Radiant::Config::Definition.new({
      default: "Secret Monkey",
      allow_display: false
    })
    @present = Radiant::Config::Definition.new({
      default: "Hola",
      allow_blank: false
    })
  end
  after :each do
    Radiant::Cache.clear if defined? Radiant::Cache
    Radiant.detail.clear_definitions!
  end

  describe "basic definition" do
    before do
      Radiant.detail.define('test', @basic)
      @setting = Radiant::Config.find_by_key('test')
    end

    it "should specify a default" 

  end

  describe "validating" do
    before do
      Radiant::Config.define('valid', @validating)
      Radiant::Config.define('number', @integer)
      Radiant::Config.define('selecting', @selecting)
      Radiant::Config.define('required', @present)
    end

    it "should validate against the supplied block" 


    it "should allow a valid value to be set" 


    it "should not allow an invalid value to be set" 

  end

  describe "offering selections" do
    before do
      Radiant::Config.define('not', @basic)
      Radiant::Config.define('now', @selecting)
      Radiant::Config.define('hashed', @selecting_from_hash)
      Radiant::Config.define('later', @selecting_at_runtime)
      Radiant::Config.define('required', @selecting_required)
    end

    it "should identify itself as a selector" 


    it "should offer a list of options" 


    it "should run a supplied selection block" 


    it "should normalise the options to a list of pairs" 


    it "should not include a blank option if allow_blank is false" 


  end

  describe "protecting" do
    before do
      Radiant::Config.define('required', @present)
      Radiant::Config.define('fixed', @protected)
    end

    it "should raise a ConfigError when a protected value is set" 


    it "should raise a validation error when a required value is made blank" 

  end


end


