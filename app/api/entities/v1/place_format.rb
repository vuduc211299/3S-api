class PlaceFormat < Grape::Entity
  expose :id
  expose :name
  expose :details
  expose :user_id
  expose :address
  expose :place_type
  expose :city
  expose :accepted
end
