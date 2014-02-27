desc "TODO"

task upload_img: :environment do
  pic_dir
end

def category_create(unit)
  if Category.find_by :name => unit
  else
    Category.create(:name => unit)
  end
end

def picture_create(img,unit)
  if !Picture.find_by :name => img
    file = File.open("#{unit}/#{img}")
    category=Category.find_by(:name => unit)
    category.pictures.create(:name=>img,:path=>"img/#{unit}/#{img}", :photo=>file)
    puts img
  end
end

def pic_dir
  Dir.chdir("img")
  target = Dir.new("#{Dir.pwd}")
  target.entries.each do |unit|
    if unit!='.' && unit!='..'
      category_create(unit)
      pictures=Dir.new(unit)
      pictures.entries.each do |img|
        if img!='.' && img!='..'
          picture_create(img,unit)
        end
      end
    end
  end
end