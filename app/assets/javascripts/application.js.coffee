# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .
#

$(document).ready ->
  $('select[multiple]').multiselect
    enableFiltering: true

  $('input.dpicker.date-with-time').datetimepicker()
  $('input.dpicker.date-without-time').datetimepicker
    minView: 2
