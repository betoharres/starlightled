class Firmware < ActiveRecord::Base
  validates_presence_of :file_content, :filename
  belongs_to :company
  audited allow_mass_assignment: true, associated_with: :company

  def update(params = {})
    file = params.delete(:file)
    if file
      content = file.read
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.checksum = Digest::SHA1.hexdigest(content)
      self.file_content = content
    end
    super
  end

  def initialize(params = {})
    file = params.delete(:file)
    super
    if file
      content = file.read
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.checksum = Digest::SHA1.hexdigest(content)
      self.file_content = content
    end
  end

  private
    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
      return File.basename(filename)
    end
end
