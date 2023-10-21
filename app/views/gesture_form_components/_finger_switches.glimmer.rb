rows = Glimte::Utils::Sequence.new
view_model.gesture_supported_fingers.each do |finger|
  row = rows.next
  checkbutton {
    grid sticky: 'nsew', row: row, column: 0, padx: [0, 10], pady: [5, 5]
    text view_model.finger_name(finger)
    variable <=> [view_model.fingers[finger], :enabled]
  }
  button {
    grid sticky: 'w', row: row, column: 1
    text '...'
    visible <= [view_model.fingers[finger], :enabled]
    command do
      view_model.fingers[finger].currently_edited = true
    end
  }
end
