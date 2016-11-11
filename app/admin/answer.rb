ActiveAdmin.register Answer do
  menu priority: 4
  permit_params :question_id, 
                :end_question, 
                :content, 
                :value, 
                :next_question_id

  index do
    selectable_column
    n = 0
    column :number do
      n +=1
    end
    column :content
    column :end_question
    column :value
    column :previous_question do |a|
      a.question.content
    end
    column :next_question do |a|
      Question.find(a.next_question_id).content
    end
    actions
  end

  show do
    panel "Answer Details" do
      attributes_table_for answer do
        row :id
        row :content
        row :end_question
        console
        row("previous_question"){ |a| a.question.content }
        row("next_question"){ |a| Question.find(a.next_question_id).content }
        row :value
      end
    end
  end

  form do |f|
    f.inputs "Answer" do
      f.input :question_id, 
              :as => :select, 
              :collection => Question.all.map{|q| [q.content, q.id]},
              :selected => params[:question_id],
              :include_blank => false
      f.input :end_question, 
              :as => :select
      f.input :next_question_id,
              :as => :select,
              :collection => {}
      f.input :content
      f.input :value, as: :ckeditor
    end
    f.actions
  end
end