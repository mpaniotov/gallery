class Picture < ActiveRecord::Base





  belongs_to :category
  has_many :likes
  has_many :comments



  has_attached_file :photo,
                    :url=>'img/:category_name/:filename',
                    :path => ':rails_root/img/:category_name/:filename'
  #:url  => ":rails_root/:url"
  #:path => ":category_id"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  Paperclip.interpolates :category_name do |a,s|
    a.instance.category.name
  end

 # has_attached_file :picture, :path => ":rails_root/public/:filename"
end
