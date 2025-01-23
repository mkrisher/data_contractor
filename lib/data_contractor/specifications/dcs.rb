require_relative("standard_parsing")

module DataContractor
  class Dcs
    PRIMARY_KEY = "dataContractSpecification"

    include DataContractor::StandardParsing::InstanceMethods

    def initialize
      super(PRIMARY_KEY)
    end
  end
end
