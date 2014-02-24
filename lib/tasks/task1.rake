task :img =>:environment do
  Category.delete_all
  Category.reset_pk_sequence
 Picture.delete_all
  Picture.reset_pk_sequence
  root_dir = 'img'
  categories= []
  Dir.entries(root_dir).select{|entry| !File.directory? entry}.map{|entry| categories << entry}
 # categories.each {
 #  |category|
   # categ = Category.new(:name => category)
   # categ.save

 # Dir.entries(root_dir+'/'+category).select{|entry| !File.directory? entry}.map{|entry| images << File.join(root_dir,category,entry)}
 # }
  categories.each {
      |category|
    categ = Category.new(:name =>category)
    categ.save
    Dir.entries(root_dir+'/'+category).select {|entry| File.file? entry
    if !(entry == '.' || entry == '..')
    file = File.open("#{root_dir}/#{category}/#{entry}")
    pict=Picture.new(:category_id=>categ.id, :path=>File.join(root_dir,category,entry),:photo=>file)
    #puts "I = #{i}"
    pict.save
    end
    }
  }
end



#file = File.open("#{unit}/#{img}")
#Pick.create(:name => img, :category=>Category.find_by(:name => unit).id, :url=>"img/#{unit}/#{img}", :thumb=>file)