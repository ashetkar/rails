# frozen_string_literal: true

require "active_record/connection_adapters/yugabyte_db/oid/array"
require "active_record/connection_adapters/yugabyte_db/oid/bit"
require "active_record/connection_adapters/yugabyte_db/oid/bit_varying"
require "active_record/connection_adapters/yugabyte_db/oid/bytea"
require "active_record/connection_adapters/yugabyte_db/oid/cidr"
require "active_record/connection_adapters/yugabyte_db/oid/date"
require "active_record/connection_adapters/yugabyte_db/oid/date_time"
require "active_record/connection_adapters/yugabyte_db/oid/decimal"
require "active_record/connection_adapters/yugabyte_db/oid/enum"
require "active_record/connection_adapters/yugabyte_db/oid/hstore"
require "active_record/connection_adapters/yugabyte_db/oid/inet"
require "active_record/connection_adapters/yugabyte_db/oid/interval"
require "active_record/connection_adapters/yugabyte_db/oid/jsonb"
require "active_record/connection_adapters/yugabyte_db/oid/macaddr"
require "active_record/connection_adapters/yugabyte_db/oid/money"
require "active_record/connection_adapters/yugabyte_db/oid/oid"
require "active_record/connection_adapters/yugabyte_db/oid/point"
require "active_record/connection_adapters/yugabyte_db/oid/legacy_point"
require "active_record/connection_adapters/yugabyte_db/oid/range"
require "active_record/connection_adapters/yugabyte_db/oid/specialized_string"
require "active_record/connection_adapters/yugabyte_db/oid/timestamp"
require "active_record/connection_adapters/yugabyte_db/oid/timestamp_with_time_zone"
require "active_record/connection_adapters/yugabyte_db/oid/uuid"
require "active_record/connection_adapters/yugabyte_db/oid/vector"
require "active_record/connection_adapters/yugabyte_db/oid/xml"

require "active_record/connection_adapters/yugabyte_db/oid/type_map_initializer"

module ActiveRecord
  module ConnectionAdapters
    module YugabyteDB
      module OID # :nodoc:
      end
    end
  end
end
