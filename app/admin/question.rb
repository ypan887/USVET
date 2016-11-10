ActiveAdmin.register Question do
  menu priority: 3
  permit_params :content, :base


  action_item :add_answer, only: :show do
    link_to "add answer", new_admin_answer_path(:question_id => params[:id].to_i)
  end
end
