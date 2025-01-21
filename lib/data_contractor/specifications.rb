require 'logger'
require 'pry'

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
    def initialize
      super('dataContractSpecification')
    end
  end

  class Odcs < Standard
    def initialize
      super('apiVersion')
    end
  end

  class Specifications
    STANDARDS = {
      dcs: Dcs.new,
      odcs: Odcs.new
    }.freeze
  end
end
