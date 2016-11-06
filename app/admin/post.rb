ActiveAdmin.register Post do
  permit_params :admin_user_id, :title, :content
end
