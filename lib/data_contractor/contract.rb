require "logger"
require "pry"

module DataContractor
  # responsible for representing a parsed import as a contract (Ruby object)
  class Contract
    attr_reader :logger, :file, :parser, :data, :specification

    def initialize
      # TODO: abstract the logger instance to the module
      @logger = Logger.new($stderr)
    end

    # imports the file, accessing its path and contents, assigning the data and specification
    # NOTE: returns false if the contract can not be imported (e.g. invalid)
    def import(file)
      @file = file
      @parser = DataContractor::Parser.new
      @data = @parser.read(file)
      @specification = parser.specification

      true
    rescue => e
      @logger.error("[data_contractor:] #{e}")

      false
    end

    # NOTE: each specification parser needs to include this method
    def specification_version
      # TODO: handle case where spec is not known
      @specification.version(self)
    end
  end
end
