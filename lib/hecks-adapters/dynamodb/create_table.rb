module HecksApp
  module DrivenAdapters
    class Dynamodb
      class CreateTable
        def initialize(table)
          @table = table
        end

        def create
          Dynamodb.client.create_table(
            table_name: @table.name,
            key_schema: schema,
            attribute_definitions: attribute_definitions,
            provisioned_throughput: provisioned_throughput
          )
        end

        private

        def schema
          [{ attribute_name: 'id', key_type: 'HASH' }]
        end

        def attribute_definitions
          [{ attribute_name: 'id', attribute_type: 'S' }]
        end

        def provisioned_throughput
          {
            read_capacity_units: 10,
            write_capacity_units: 10
          }
        end
      end
    end
  end
end
