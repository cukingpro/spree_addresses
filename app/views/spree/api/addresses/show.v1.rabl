object @address
attributes :id, :title, :firstname, :lastname, :full_name, :phone, :address1, :city
node(:state){|address| address.state.name}
node(:country){|address| address.country.name}
