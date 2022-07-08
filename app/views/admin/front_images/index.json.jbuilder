json.set! :data do
  json.array! @front_images do |front_image|
    json.partial! 'admin/front_images/front_image', front_image: front_image
    json.image "
      
      <a href='#{edit_admin_front_image_path(front_image)}' class='mr-3 img-thumbnail'>
        <img src='#{front_image.image.url}' > 
      </a>
      
    "
    json.url  "
              #{link_to 'Edit', edit_admin_front_image_path(front_image)}
              #{link_to 'Destroy', admin_front_image_path(front_image), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end