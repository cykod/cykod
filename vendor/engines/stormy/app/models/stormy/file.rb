class Stormy::File
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Should keep track of what posts it is used in

  field :file_type

  field :width, type: Integer
  field :height, type: Integer

  has_mongoid_attached_file :document,
    styles: { icon: "16x16#", thumb: "60x90#", small: "500x800>" }.merge(Stormy.file_image_styles)

end
