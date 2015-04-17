module ClientsHelper
  CLIENTS_PER_ROW = 4
  GRID_COLUMNS = 12

  def images_list
    data.config.clients
  end

  def clients_info
    images = @images_list

    {
        :names => images,
        :total => images.count,
        :per_row => @per_row,
        :total_row => @grid_columns
    }
  end

  def find_images(start, amount)
    images = images_list.slice(start, amount)
    return [] unless images
    images
  end

  def build_client_icon(id, size)
    image = content_tag('div', '', :id => id, :class => 'icon')
    content_tag('div', image, :class => "col col-md-#{size}")
  end

  def build_clients_row(clients)
    images = []

    size = GRID_COLUMNS/clients.count

    clients.each do |client|
      images << build_client_icon(client, size)
    end

    content_tag('div', images, :class => 'row')
  end

  def clients_list
    counter = 0
    rows = []

    while images_list.any?
      clients_group = find_images (counter * CLIENTS_PER_ROW), CLIENTS_PER_ROW
      break unless clients_group.any?
      rows << build_clients_row(clients_group)
      counter += 1
    end

    content_tag('div', rows, :id => 'clients-list')
  end
end
