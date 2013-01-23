class Stormy::Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :post_category, default: "text"
  field :post_type, default: "post"

  field :published, type: Boolean, default: false
  field :published_at, type: Time

  field :permalink

  field :name
  field :author

  field :body
  field :body_html

  field :views, type: Integer, default: 0

  has_mongoid_attached_file :photo, 
    styles: { icon: "16x16#", thumb: "60x90#", small: "500x800>" }.merge(Stormy.post_image_styles)

  validates :permalink, uniqueness: true, presence: true
  validates :name, presence: true

  before_validation :generate_permalink, :on => :create
  before_save :save_body

  scope :recent, -> { desc(:updated_at) }
  scope :posts, -> { where(post_type: "post") }

  def to_param
    self.permalink
  end

  def published_at_date=(val)
    @published_at_date = val
    self.set_published_at
  end

  def published_at_time=(val)
    @published_at_time = val
    self.set_published_at
  end


  def set_published_at
    if @published_at_date && @published_at_time
      self.published_at = "#{@published_at_date} #{@published_at_time}"
    end
  end

  def published_at_date
    self.published_at
  end

  def published_at_time
    self.published_at
  end

  def publish
    self.published = true
    t = Time.now
    # Get rid of seconds
    self.published_at = t - t.sec - (t.usec.to_f / 1000000) if self.published_at.blank?
  end

  def unpublish
    self.published = false
  end

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
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML,
                                      autolink: true)
    self.body_html = markdown.render(body.to_s)
  end
end
