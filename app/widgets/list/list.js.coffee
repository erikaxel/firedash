angular.module("widgets").directive "listwidget", ->
  restrict: "E", # we are an element
  templateUrl: 'widgets/list.html',
  scope:
    title: '@'
    data: '='
  link:(scope, element, attrs) ->
    element.addClass('widget widget-list')

    if attrs.unordered == ''
      element.find('ol').addClass('hide')
    else
      element.find('ul').addClass('hide')
