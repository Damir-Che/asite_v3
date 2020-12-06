ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name

  form do |f|
    f.inputs "User" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  
end
