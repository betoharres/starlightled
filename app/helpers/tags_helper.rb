module TagsHelper

  def tagging_related_path(resource)
    "/#{resource.taggable_type.downcase.pluralize}/#{resource.taggable_id}"
  end

  def tagging_related_name(resource)
    # "#{resource.taggable_type} ##{resource.taggable_id}"
    case resource.taggable_type
      when 'Network'
        Network.find(resource.taggable_id).name
      when 'Node'
        Node.find(resource.taggable_id).identifier
      when 'Lamp'
        Lamp.find(resource.taggable_id).product.name
    end
  end
end
