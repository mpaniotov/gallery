class AddAttachmentPathToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :path
    end
  end

  def self.down
    drop_attached_file :pictures, :path
  end
end
