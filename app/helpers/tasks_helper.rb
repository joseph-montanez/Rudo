module TasksHelper
  def tree_named_link(task)
    str = ''
    if task.depth > 0
      str += '|' + '&ndash;' * task.depth
    end
    str += ' ' + (link_to task.name, task)
  end
end
