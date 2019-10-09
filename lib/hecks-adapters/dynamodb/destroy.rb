module HecksApp
  module Adapters
    class Dynamodb
      module Destroy
        def self.delete_item(table, id)
          Dynamodb.client.query(
            table_name: table.name,
            key: { id: id }
          ).items.first.as_json.deep_symbolize_keys
        end
      end
    end
  end
end