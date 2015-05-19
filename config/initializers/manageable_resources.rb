Rails.application.eager_load! if Rails.env.test? || Rails.env.development?
resources_array = ActiveRecord::Base.descendants.map(&:name)
blacklist = ["Audited::Adapters::ActiveRecord::Audit", "NetworksNode"]
MANAGEABLE_RESOURCES = resources_array.reject { |h| blacklist.include? h }
