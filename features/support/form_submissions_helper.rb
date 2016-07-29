# TODO: Pick a name for the method
# TODO: Fill in proper form components

module FormSubmissionHelpers
  def pick_a_name
    fill_in "", with: ""
    fill_in "", with: ""
    fill_in "", with: ""
  end
end
World(FormSubmissionHelpers)
