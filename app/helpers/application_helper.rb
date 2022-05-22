module ApplicationHelper

  def select_box_items(number)
    arr=[]
    (1..number).each do |i|
      arr.push(["#{i}個",i])
    end
    arr
  end

  def genre_name_lists
    arr=[]
    Genre.all.each_with_index do |genre,i|
      arr.push([genre.genre_name,i+1])
    end
    arr
  end

end
