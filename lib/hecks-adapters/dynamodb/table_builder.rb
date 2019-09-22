module HecksApp
  module Adapters
    class Dynamodb
      module TableBuilder
        def self.build(table)
          CreateTable.new(table).create
        rescue Aws::DynamoDB::Errors::ResourceInUseException
          false
        end
      end
    end
  end
end