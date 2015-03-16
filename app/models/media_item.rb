class MediaItem
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  def as_json(options={})
    attrs = super(options)
    attrs["id"] = attrs["_id"]
    attrs
  end

  has_mongoid_attached_file :image,
                            styles: {
                                small: ['65x65#', :jpg],
                                medium: ['250x250', :jpg]
                            }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates :name, presence: true

  field :name, type: String
  field :url, type: String, default: ''
  field :image, type: String, default: ''

  belongs_to :user
end


