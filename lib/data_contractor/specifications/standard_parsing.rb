module DataContractor
  module StandardParsing
    module InstanceMethods
      attr_accessor :primary_key

      def initialize(key)
        @primary_key = key
      end

      def to_s
        @primary_key
      end

      def version(contract)
        contract.data[primary_key]
      end
    end
  end
end
