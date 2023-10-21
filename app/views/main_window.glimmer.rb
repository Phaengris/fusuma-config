title 'Fusuma Config'
width 1000
height (1000 / 1.618).to_i

frame {
  grid sticky: 'nsew', column_weight: 1, row_weight: 1

  notebook {
    grid sticky: 'nsew', column_weight: 1, row_weight: 1

    Views.gesture_form(text: 'Tap') {
      gesture :tap
    }
    Views.gesture_form(text: 'Hold') {
      gesture :hold
    }
    Views.gesture_form(text: 'Swipe') {
      gesture :swipe
    }
    # Views.gesture_form {
    #   gesture :pinch
    # }
    # Views.gesture_form {
    #   gesture :rotate
    # }
  }
}

on('KeyPress') do |event|
  case [event.keysym.downcase, event.state]
  when ['q', 4]
    Glimte.exit
  end
end