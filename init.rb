require 'redmine'

# This macro will diplay the status name of an issue
# and creates a link to the issue.
#
# Usage : 
#
# {{issue_status(123)}} => "Open" (with a link on issue 123)
# 
Redmine::WikiFormatting::Macros.register do
  desc "Issues Status Macro" 
  macro :issue_status do |obj, args|
    args, options = extract_macro_options(args, :parent)
    if args.size >= 1
      Issue.find(args).collect{|issue| link_to(issue.status.to_s, url_for(:controller => 'issues', :action => 'show', :id => issue), :title => h(issue.subject))} 
    else
      raise 'No or bad arguments.'
    end
  end
end

# This macro will display the progress bar for a given issue
#
# Usage: 
#
# {{issue_progress(123)}} => "[=====  ] 70%"
#
Redmine::WikiFormatting::Macros.register do
  desc "Issues Progress Status Macro" 
  macro :issue_progress do |obj, args|
    args, options = extract_macro_options(args, :parent)
    if args.size >= 
      Issue.find(args).collect{|issue| progress_bar(issue.done_ratio, :width => '80px', :legend => "#{issue.done_ratio}%")} 
    else
      raise 'No or bad arguments.'
    end
  end
end

