module ApplicationHelper
  def flash_class(level)
    if level == :error
      "alert alert-secondary mt-1 mb-4"
    elsif level == :success
      "alert alert-primary mt-1 mb-4"
    end
    # case level
    #   when :notice then "alert alert-info"
    #   when :success then "alert alert-success"
    #   when :error then "alert alert-error"
    #   when :alert then "alert alert-error"
    # end
  end
end
