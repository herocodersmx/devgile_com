module TechnologiesHelper
  def technologies_list
    data.config.technologies
  end

  def technology_by_position(value)
    techs = technologies_list
    techs[value]
  end

  def build_tech_icon(position)
    element = technology_by_position(position)

    return '' unless element

    values = element.split('|')
    name = values[0]
    url = values[1]

    icon = content_tag('div', '', :class => "icon stack-item #{name}")
    content_tag('a', icon, :href => url, :target => '_blank')
  end
end
