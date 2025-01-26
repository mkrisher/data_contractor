require "logger"
require "pry"

require_relative("specifications/dcs")
require_relative("specifications/odcs")

module DataContractor
  # TODO: make this list dynamic using a Specifications module or other
  class Specifications
    STANDARDS = {
      dcs: Dcs.new,
      odcs: Odcs.new
    }.freeze
  end
end
