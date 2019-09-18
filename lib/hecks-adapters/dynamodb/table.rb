module HecksApp
  module DrivenAdapters
    class Dynamodb
      class Table
        attr_reader :fields
        
        def initialize(aggregate)
          @aggregate = aggregate
          @root = @aggregate.instance_variable_get(:@root)
          @fields = @root.instance_variable_get(:@fields)
        end

        def name
          [@aggregate.name.to_s, @root.name.to_s].join('-')
        end

        def aggregate_name
          @aggregate.name
        end
      end
    end
  end
end