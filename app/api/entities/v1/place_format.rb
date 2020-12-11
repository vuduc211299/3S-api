class PlaceFormat < Grape::Entity
  expose :id
  expose :name
  expose :details
  expose :host, using: UserFormat
  expose :address
  expose :place_type
  expose :schedule_price
  expose :policy
  expose :overviews
  expose :rule
  expose :room
  expose :ratings
  expose :place_facilities
end
