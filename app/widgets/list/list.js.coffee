angular.module("widgets").directive "listwidget", ->
  restrict: "E", # we are an element
#  transclude: true, #use if we should wrap content
  templateUrl: 'widgets/list.html',
  scope:
    title: '@'
    items: '='
  link:(scope, element, attrs) ->
    element.addClass('widget widget-list')

    if attrs.unordered == ''
      element.find('ol').addClass('hide')
    else
      element.find('ul').addClass('hide')