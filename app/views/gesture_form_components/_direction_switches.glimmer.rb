finger = locals[:finger]

columns = Glimte::Utils::Sequence.new
view_model.gesture_supported_directions.each do |direction|
  checkbutton {
    grid sticky: 'ne', row: 0, column: columns.next, padx: [0, 10]
    text view_model.direction_name(direction)
    variable <=> [view_model.fingers[finger].directions[direction], :enabled]
  }
  frame {
    grid sticky: 'ne', row: 0, column: columns.next, padx: [0, 10]
    width 20
    button {
      grid sticky: 'nsew', row: 0, column: 0
      text '...'
      visible <= [view_model.fingers[finger].directions[direction], :enabled]
      command do
        view_model.fingers[finger].directions[direction].currently_edited = true
      end
    }
  }
end
