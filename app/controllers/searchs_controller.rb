class SearchsController < ApplicationController
  
  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end
  
  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 選択した検索方法がが部分一致だったら
      elsif method == 'part'
        User.where('name LIKE ?', '%'+content+'%')
      #前方一致
      elsif method == 'front'
        User.where('name LIKE ?', '%'+content+'%')
      #後方一致  
      elsif method == 'back'
        User.where('name LIKE ?', '%'+content+'%')
      else  
      end
    # 選択したモデルがpostだったら
     
    elsif model == 'book'
      
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'part'
        Book.where('title LIKE ?', '%'+content+'%')
      #前方一致
      elsif method == 'front'
        Book.where('title LIKE ?', '%'+content+'%')
      #後方一致  
      elsif method == 'back'
        Book.where('title LIKE ?', '%'+content+'%')
      else  
      end
    end
  end
end