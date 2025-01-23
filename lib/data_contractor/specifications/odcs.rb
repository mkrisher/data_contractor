require_relative("standard_parsing")

module DataContractor
  class Odcs
    PRIMARY_KEY = "apiVersion"

    include DataContractor::StandardParsing::InstanceMethods

    def initialize
      super(PRIMARY_KEY)
    end
  end
end
