require "logger"
require "pry"

module DataContractor
  class Standard
    attr_accessor :primary_key

    def initialize(key)
      @primary_key = key
    end

    def to_s
      @primary_key
    end
  end

  class Dcs < Standard
    PRIMARY_KEY = "dataContractSpecification"

    def initialize
      super(PRIMARY_KEY)
    end

    # TODO: abstract to the Standard class and add test coverage
    def version(contract)
      contract.data[PRIMARY_KEY]
    end
  end

  class Odcs < Standard
    PRIMARY_KEY = "apiVersion"

    def initialize
      super(PRIMARY_KEY)
    end

    def version(contract)
      contract.data[PRIMARY_KEY]
    end
  end

  class Specifications
    STANDARDS = {
      dcs: Dcs.new,
      odcs: Odcs.new
    }.freeze
  end
end
