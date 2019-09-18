module HecksApp
  module DrivenAdapters
    class Dynamodb
      class RepositoryBuilder
        class ID
          def self.for_domain_object(domain_object)
            domain_object.id || SecureRandom.uuid
          end

          def self.for_fetchable(fetchable)
            fetchable.respond_to?(:id) ? fetchable.id : fetchable
          end
        end
      end
    end
  end
end