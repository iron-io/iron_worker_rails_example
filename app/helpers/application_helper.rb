module ApplicationHelper

  def flash_messages(options={})
    if !flash.empty?
      s = "<div class=\"flash_messages_container\">"
      s2 = ""
      flash.each do |type, msg|
        clazz = "flash #{type}"
        if msg.is_a?(Array)
          msg.each do |m|
            s2 << content_tag(:div, m, :class =>clazz)
          end
        else
          s2 << content_tag(:div, msg, :class =>clazz)
        end
      end
      s << s2
      s << "</div>"
      s.html_safe
    end
  end
end
