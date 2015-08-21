json.networks @networks do |network|
  json.id network.id
  json.name network.name

  json.nodes network.nodes do |node|
    json.id node.id
    json.identifier node.identifier
    json.latitude node.latitude
    json.longitude node.longitude

    if node.product
      json.product node.product
      json.status LampStat.where(serial_num: node.product.serial_number).last
      json.product_url product_to_child_url(node.product)
    end

  end
  json.url network_url(network, format: :json)
end
