json.set! :data do
  json.array! @personil_details do |personil_detail|
    json.partial! 'personil_details/personil_detail', personil_detail: personil_detail
    json.url  "
              #{link_to 'Show', personil_detail }
              #{link_to 'Edit', edit_personil_detail_path(personil_detail)}
              #{link_to 'Destroy', personil_detail, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end