title 'Fusuma Config'
width 1000
height (1000 / 1.618).to_i

frame {
  notebook {
    grid sticky: 'nwes', column_weight: 1, row_weight: 1

    Views.gesture_form {
      gesture :tap
    }
    # Views.gesture_form {
    #   gesture :hold
    # }
    # Views.gesture_form {
    #   gesture :swipe
    # }
    # Views.gesture_form {
    #   gesture :pinch
    # }
    # Views.gesture_form {
    #   gesture :rotate
    # }
  }
}
