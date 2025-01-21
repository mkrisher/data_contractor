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
    alias read import
  end
end
