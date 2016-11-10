ActiveAdmin.register Answer do
  permit_params :question_id, :answer_type, :content, :value

  form do |f|
    f.inputs "Answer" do
      f.input :question_id, 
              :as => :select, 
              :collection => Question.all.map{|q| [q.content, q.id]}
      f.input :answer_type, :as => :select, :collection => ["Direct Link", "Download", "schedule"]
      f.input :content
      f.input :value, as: :ckeditor
    end
    f.actions
  end
end