Rails.application.eager_load!
resources_array ||= ActiveRecord::Base.descendants.map(&:name)
resources_array << 'Landing'
resources_array << 'Audit'
blacklist ||= ["Audited::Adapters::ActiveRecord::Audit", "NetworksNode", "TagType"]
MANAGEABLE_RESOURCES ||= resources_array.reject { |h| blacklist.include? h }
