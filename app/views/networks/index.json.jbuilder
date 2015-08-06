json.networks @networks do |network|
  json.id network.id
  json.name network.name

  json.nodes network.nodes do |node|
    json.id node.id
    json.identifier node.identifier
    json.latitude node.latitude
    json.longitude node.longitude

    json.products node.products do |product|
      json.id product.id
      json.name product.name
      json.productable_type t(product.productable_type)
      json.productable_id product.productable_id
      json.url product_to_child_url(product)
    end
  end
  json.url network_url(network, format: :json)
end
