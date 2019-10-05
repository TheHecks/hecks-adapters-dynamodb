module HecksApp
  module Adapters
    class Dynamodb
      module All
        def self.query(table)
          Dynamodb.client.scan(
            table_name: table.name
          ).items.map do |item|
            item.deep_symbolize_keys
          end
        end
      end
    end
  end
end