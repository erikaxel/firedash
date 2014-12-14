angular.module("widgets").directive "textwidget", ->
  restrict: "E", # we are an element
  templateUrl: 'widgets/text.html',
  scope:
    title: '@',
    text: '='
