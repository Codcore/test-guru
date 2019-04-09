module BadgesHelper
  def badges_types_array_for_select
    # Badge.badges_types.map.with_index(0) { |type, i| [type, i] }
    Badge.badges_types.map { |type| [ type, "Badges::#{type}"] }
  end

  def show_new_badges_msg(new_badges_array)
    unless new_badges_array.empty?
      new_badges_msg = new_badges_array.map { |b| "Вы получили медаль '#{b.name}' " }.join("\n")
      flash.now[:notice] = new_badges_msg
    end
  end
end
