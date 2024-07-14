
module Error
  def raise_argument_error(message = "Invalid Input")
    raise ArgumentError, message
  end
end
