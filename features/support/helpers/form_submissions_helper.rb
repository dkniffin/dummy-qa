module FormSubmissionHelpers
  def pick_a_name
    fill_in "", with: ""
    fill_in "", with: ""
    fill_in "", with: ""
  end
end
World(FormSubmissionHelpers)
