module BadgesHelper
  def badges_types_array_for_select
    # Badge.badges_types.map.with_index(0) { |type, i| [type, i] }
    Badge.badges_types.map { |type| [ type, "Badges::#{type}"] }
  end
end
