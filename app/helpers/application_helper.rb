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

  def to_chart(stat)
    chart_data = []
    stat.each do |s|
      chart_data << {date: s.date, tLed1: s.tLed1 || 0, tLed2: s.tLed2 || 0,
      tCom: s.tCom || 0, pwr: s.pwr,
      url: "#{request.base_url}/lamp_stat/#{s.id}"}
    end
    chart_data
  end
end
