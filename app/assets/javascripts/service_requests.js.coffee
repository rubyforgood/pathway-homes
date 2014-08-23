# closed_at is only displayed when status == 'closed'
$ ->
  showOrHideClosedOnField = ->
    status = $(".service_request_status option:selected").prop("value")
    if status == "closed"
      $(".service_request_closed_on").show()
    else
      $(".service_request_closed_on").hide()

  showOrHideClosedOnField()
  $(".service_request_status").on("change", showOrHideClosedOnField)
