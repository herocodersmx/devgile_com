module ImageHelpers
  def active_client_logos
    clients_array = data.config.clients
    images_per_row = 4
    grid_columns = 12
    rows = []
    counter = 0
    clients_group = clients_array

    while clients_group.any?
      images = []
      clients_group = clients_array.slice((counter * images_per_row), images_per_row) || []

      next unless clients_group.any?

      clients_group.each do |client|
        image = content_tag('div', '', :id => client, :class => 'icon')
        images << content_tag('div', image, :class => "col col-md-#{grid_columns/clients_group.count}")
      end

      counter += 1
      rows << content_tag('div', images, :class => 'row')
    end

    content_tag('div', rows, :id => 'clients-list')
  end
end
