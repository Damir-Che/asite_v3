ActiveAdmin.register Post do

  permit_params :title, :body, :user_id, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do #для добавления поля :image
      f.input :image, as: :file
    end
    f.actions
  end

  
end
