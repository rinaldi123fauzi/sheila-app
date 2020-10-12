json.set! :data do
  json.array! @service_types do |service_type|
    json.partial! 'service_types/service_type', service_type: service_type
    json.url  "
              #{link_to 'Show', service_type }
              #{link_to 'Edit', edit_service_type_path(service_type)}
              #{link_to 'Destroy', service_type, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end