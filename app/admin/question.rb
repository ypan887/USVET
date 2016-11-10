ActiveAdmin.register Question do
  menu priority: 3
  permit_params :content, :base
end
