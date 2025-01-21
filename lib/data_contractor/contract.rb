require 'logger'
require 'pry'

module DataContractor
  # responsible for representing a parsed import as a contract (Ruby object)
  class Contract
    attr_reader :logger, :file, :data

    def initialize
      @logger = Logger.new($stderr)
    end

    # imports the file, accessing its path and contents
    def import(file)
      contents = DataContractor::Parser.new.read(file)

      @file = file
      @data = contents

      true
    rescue StandardError => e
      @logger.error("[data_contract:] #{e}")

      false
    end
  end
end
