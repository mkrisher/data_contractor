require "logger"
require "pry"

require_relative("specifications/dcs")
require_relative("specifications/odcs")

module DataContractor
  class Specifications
    STANDARDS = {
      dcs: Dcs.new,
      odcs: Odcs.new
    }.freeze
  end
end
