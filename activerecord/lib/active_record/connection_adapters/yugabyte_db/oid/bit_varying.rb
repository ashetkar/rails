# frozen_string_literal: true

module ActiveRecord
  module ConnectionAdapters
    module YugabyteDB
      module OID # :nodoc:
        class BitVarying < OID::Bit # :nodoc:
          def type
            :bit_varying
          end
        end
      end
    end
  end
end
