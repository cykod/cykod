class Stormy::Post
  include Mongoid::Document
  field :post_category, default: "text"
  field :post_type, default: "post"

  field :permalink

  field :title

  field :body
  field :body_html

  validates :permalink, uniqueness: true, presence: true
  validates :title, presence: true

  before_validation :generate_permalink, :on => :create

  protected

  def generate_permalink
    if self.permalink.blank? && self.title.present?
      self.permalink = self.title.downcase
                           .gsub(/[^a-z0-9\-_]+/," ")
                           .gsub(/[ \-\t]+/,"-")
                           .gsub(/^-+/,'')
                           .gsub(/-+$/,'')
    end
  end

end
