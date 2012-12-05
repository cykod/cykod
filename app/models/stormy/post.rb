class Stormy::Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :post_category, default: "text"
  field :post_type, default: "post"

  field :permalink

  field :name

  field :body
  field :body_html

  validates :permalink, uniqueness: true, presence: true
  validates :name, presence: true

  before_validation :generate_permalink, :on => :create
  before_save :save_body

  protected

  def generate_permalink
    if self.permalink.blank? && self.name.present?
      self.permalink = self.name.downcase
                           .gsub(/[^a-z0-9\-_]+/," ")
                           .gsub(/[ \-\t]+/,"-")
                           .gsub(/^-+/,'')
                           .gsub(/-+$/,'')
    end
  end

  def save_body
    self.body_html = body.to_s
  end
end
