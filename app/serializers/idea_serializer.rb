class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :created_at, :score
end
