ActiveAdmin.register Post do
  menu priority: 2
  permit_params :admin_user_id, :title, :content

  index do
    selectable_column
    n = 0
    column :number do
      n +=1
    end
    column :user_name do |p| 
      p.admin_user.user_name
    end
    column :title
    column :created_at
    actions
  end

  filter :user_name, :as => :select, :collection => lambda { AdminUser.all.map(&:user_name) }
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
