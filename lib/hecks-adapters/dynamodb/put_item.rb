module HecksApp
  module Adapters
    class Dynamodb
      class RepositoryBuilder
        class PutItem
          def self.put(table, domain_object)
            id = ID.for_domain_object(domain_object)
            Dynamodb.client.put_item(
              table_name: table.name,
              item: domain_object.as_json.merge(
                id: id
              )
            )
            domain_object.tap do |result|
              result.instance_eval { @id = id }
            end
          end
        end
      end
    end
  end
end