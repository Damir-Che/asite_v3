ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :avatar

  form do |f|
    f.inputs "User" do
      f.input :name
      f.inputs do #для добавления поля :avatar
        f.input :avatar, as: :file
      end
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  
end
