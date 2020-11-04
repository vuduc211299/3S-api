class RatingFormat < Grape::Entity
  expose :id
  expose :user_id
  expose :place_id
  expose :score
  expose :comment 
end
