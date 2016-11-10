ActiveAdmin.register Answer do
  menu priority: 4
  permit_params :question_id, :answer_type, :content, :value

  form do |f|
    f.inputs "Answer" do
      console
      f.input :question_id, 
              :as => :select, 
              :collection => Question.all.map{|q| [q.content, q.id]},
              :selected => params[:question_id],
              :include_blank => false
      f.input :answer_type, :as => :select, :collection => ["Direct Link", "Download", "schedule"]
      f.input :content
      f.input :value, as: :ckeditor
    end
    f.actions
  end
end