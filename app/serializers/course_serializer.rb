class CourseSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :street, :city, :state, :zip_code, :phone, :cost
end
