angular.module("widgets").directive "badgeswidget", ->
  restrict: "E", # we are an element
#  transclude: true, #use if we should wrap content
  templateUrl: 'widgets/badges.html',
  scope:
    title: '@'
    filter: '@'
    items: '='