ActiveAdmin.register Question do
  menu priority: 3
  permit_params :content, :base

  index do
    selectable_column
    n = 0
    column :number do
      n +=1
    end
    column :base
    column :content
    column :answers do |q|
      return "empty" unless q.answers
      ul
        q.answers.each do |a|
          li a.content
        end
      ''
    end
    actions
  end

  action_item :add_answer, only: :show do
    link_to "add answer", new_admin_answer_path(:question_id => params[:id].to_i)
  end
end
