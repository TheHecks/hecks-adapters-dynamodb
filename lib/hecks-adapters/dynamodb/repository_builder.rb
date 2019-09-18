module HecksApp
  module DrivenAdapters
    class Dynamodb
      class RepositoryBuilder
        def self.build(table)
          aggregate = ApplicationPort.find_aggregate(table.aggregate_name)

          aggregate::Root::Repository.instance_eval do
            define_method 'save' do |domain_object|
              PutItem.put(table, domain_object)
            end

            define_method 'fetch' do |fetchable|
              self.class.const_get(self.class.to_s.gsub('::Repository', '')).default(
                Query.query(table, ID.for_fetchable(fetchable))
              )
            end
          end
        end
      end
    end
  end
end
