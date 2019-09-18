module HecksApp
  module DrivenAdapters
    class Dynamodb
      module Query
        def self.query(table, id)
          Dynamodb.client.query(
            table_name: table.name,
            key_condition_expression: '#id = :id',
            expression_attribute_names: { '#id' => 'id' },
            expression_attribute_values: { ':id' => id }
          ).items.first.as_json.deep_symbolize_keys
        end
      end
    end
  end
end