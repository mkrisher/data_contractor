require "psych"
require "logger"
require "pry"

module DataContractor
  class Error < StandardError; end

  # responsible for parsing the imports
  class Parser
    attr_reader :logger, :result

    def initialize
      @logger = Logger.new($stderr)
    end

    # returns contents of file as a hash if imported successfully
    def read(file)
      @result = Psych.safe_load(file.read)
      return "" if @result.nil?

      @result
    rescue => e
      @logger.error("[data_contract:] #{e}")

      ""
    end

    # returns an instance of the parser class for the spec
    def specification
      return nil if @result.nil?

      match = nil

      DataContractor::Specifications::STANDARDS.each_value do |v|
        match = v if @result.keys.include?(v.to_s)
      end

      match
    end
  end
end
