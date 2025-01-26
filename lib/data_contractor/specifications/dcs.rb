require_relative("standard_parsing")

module DataContractor
  class Dcs
    PRIMARY_KEY = "dataContractSpecification"
    ROOT_REQUIREMENTS = %i[dataContractSpecification id info]

    include DataContractor::StandardParsing::InstanceMethods

    attr_reader :errors

    def initialize
      super(PRIMARY_KEY)
      @errors = []
    end

    # TODO: expose the errors in a non-boolean method
    def valid?(contract)
      errors = []

      ROOT_REQUIREMENTS.each do |requirement|
        result = contract.data.key?(requirement.to_s)

        errors.push("#{requirement} requirement is not met") unless result
        @errors.push("[Dcs] #{requirement} requirement is not met") unless result
      end

      errors.empty?
    end
  end
end
