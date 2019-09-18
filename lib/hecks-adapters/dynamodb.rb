require 'aws-sdk-dynamodb'
require 'active_record'
require 'securerandom'

require_relative 'dynamodb/id'
require_relative 'dynamodb/repository_builder'
require_relative 'dynamodb/table_builder'
require_relative 'dynamodb/table'
require_relative 'dynamodb/create_table'
require_relative 'dynamodb/query'
require_relative 'dynamodb/put_item'

module HecksApp
  module DrivenAdapters
    class Dynamodb
      BUILDERS = [TableBuilder, RepositoryBuilder].freeze

      def self.client
        Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')
      end

      def load
        DOMAIN_SCHEMA.aggregates.each do |aggregate|
          BUILDERS.each { |builder| builder.build Table.new(aggregate) }
        end
      end
    end
  end
end
