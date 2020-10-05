class PlaceFormat < Grape::Entity
  expose :id
  expose :name
  expose :details
  expose :host, using: UserFormat
  expose :address
  expose :place_type
  expose :city
end
