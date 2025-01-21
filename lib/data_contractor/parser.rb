require 'psych'
require 'logger'
require 'pry'

module DataContractor
  class Error < StandardError; end

  # responsible for parsing the imports
  class Parser
    attr_reader :logger, :result

    def initialize
      @logger = Logger.new($stderr)
    end

    # returns contents of file as a hash if imported successfully
    def import(file)
      @result = Psych.safe_load(file.read)
      return '' if @result.nil?

      @result
    rescue StandardError => e
      @logger.error("[data_contract:] #{e}")

      ''
    end
    alias read import # TODO: rename method and remove

    # TODO: determine the type of spec
    def specification
      # use the contents of the parsed file and determine if this is a Data Contract Specification or ODCS (Open Data Contract Standard)
      # NOTE: ODCS has a apiVersion key
      # NOTE: DCS has a dataContractSpecification key
    end
  end
end
