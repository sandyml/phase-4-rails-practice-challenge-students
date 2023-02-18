class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :students
end
