module HecksApp
  module Adapters
    class Dynamodb
      module Destroy
        def self.destroy(table, id)
          Dynamodb.client.delete_item(
            table_name: table.name,
            key: { id: id }
          )
        end
      end
    end
  end
end