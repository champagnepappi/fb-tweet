class Video < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :user

  has_attached_file :video,
        styles: lambda { |a| a.instance.is_image? ? {:small => "x200>", :medium => "x300>", :large => "x400>"}  : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10 }} },
            processors: lambda { |a| a.is_video? ? [ :ffmpeg  ] : [ :thumbnail  ]  }
end
