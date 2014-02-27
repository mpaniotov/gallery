module ActionsHelper

  def action_info(action_object)
    @navigation=[]
    action_object.each do |action_obj|
      #case action_obj.action_type
      #when "navigation"
      @navigation<<{:description => action_obj.data[:description], :obj_id => action_obj.data[:id], :url => action_obj.data[:url], :time => action_obj.data[:time]}
    end

  end
end
