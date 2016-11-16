ActiveAdmin.register Answer do
  menu priority: 4
  permit_params :question_id, 
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
    column :value
    column :previous_question do |a|
      a.question.content if a
    end
    column :next_question do |a|
      Question.find(a.next_question_id).content if a.next_question_id
    end
    actions
  end

  show do
    panel "Answer Details" do
      attributes_table_for answer do
        row :id
        row :content
        row("previous_question"){ |a| a.question.content }
        if answer.next_question_id
          row("next_question"){ |a| Question.find(a.next_question_id).content }
        else
          row :value
        end
      end
    end
  end

  form do |f|
    f.inputs "Answer" do
      f.input :selected_next, 
              :as => :hidden, 
              :input_html => { :value => "#{answer.next_question_id}" }
      f.input :question_id, 
              :as => :select, 
              :collection => Question.all.map{|q| [q.content, q.id]},
              :selected => answer.question_id,
              :include_blank => false
      f.input :next_question_id,
              :as => :select,
              :collection => {}
      f.input :content
      f.input :value, as: :ckeditor
    end
    f.actions
  end
end