json.set! :data do
  json.array! @positions do |position|
    json.partial! 'positions/position', position: position
    json.url  "
              #{link_to 'Show', position }
              #{link_to 'Edit', edit_position_path(position)}
              #{link_to 'Destroy', position, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end