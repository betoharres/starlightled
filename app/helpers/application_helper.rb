module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def product_link(product, options = {})
    product_child = product.
                    productable_type.
                    constantize.
                    find(product.productable_id)

    link_to product_child, class: options[:class] do
      options[:text] || yield
    end

  end

  def product_to_child_url(product)
    "#{request.base_url}/#{product.productable_type.downcase.pluralize}/#{product.productable_id}"
  end

end
