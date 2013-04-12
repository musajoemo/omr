class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url
  attr_accessible :pin

  #validates :description, presence: true, length: { less_than: 255 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  		     										 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  		     										 size: { less_than: 5.megabytes }
  #Has only ONE user and validates that it HAS a user to save to the database.
  #Attach mp3 file.
  #validates_attachment_content_type :mp3, :content_type => [ 'application/mp3','application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
            #:message => 'Please select a .mp3 file'

  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}
  #has_attached_file :mp3
  #has_attached_file :image, :storage => :s3, :s3_credentials => S3_CREDENTIALS, styles: { medium: "320x240>"}

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end