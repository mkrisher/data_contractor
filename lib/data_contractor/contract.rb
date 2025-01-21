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
    # NOTE: returns false if the contract can not be imported (e.g. invalid)
    def import(file)
      contents = DataContractor::Parser.new.read(file)

      @file = file
      @data = contents

      true
    rescue StandardError => e
      @logger.error("[data_contractor:] #{e}")

      false
    end
  end
end
