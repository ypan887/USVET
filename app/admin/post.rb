ActiveAdmin.register Post do
  permit_params :admin_user_id, :title, :content

  index do
    selectable_column
    column :user_name do |p| 
      p.admin_user.user_name
    end
    column :title
    column :created_at
    actions
  end

  filter :user_name
  filter :title
  filter :content
  filter :created_at

  form do |f|
    f.inputs "Post Details" do
      f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :title
      f.input :content, as: :ckeditor
    end
    f.actions
  end
end
