
angular.module("widgets").directive "badgeswidget", ->
  restrict: "E", # we are an element
#  transclude: true, #use if we should wrap content
  templateUrl: 'widgets/badges.html',
  scope:
    title: '@'
    items: '='


#  template: '<h2>hello directive</h2>'
#angular.module("widgets", []).directive "textwidget", ->
#  restrict: "E"
#  transclude: true
#  scope: {}
#  controller: ($scope, $element) ->
#    panes = $scope.panes = []
#    $scope.select = (pane) ->
#      angular.forEach panes, (pane) ->
#        pane.selected = false
#        return
#
#      pane.selected = true
#      return
#
#    @addPane = (pane) ->
#      $scope.select pane  if panes.length is 0
#      panes.push pane
#      return
#
#    return
#
#  template: "<div class=\"tabbable\">" + "<ul class=\"nav nav-tabs\">" + "<li ng-repeat=\"pane in panes\" ng-class=\"{active:pane.selected}\">" + "<a href=\"\" ng-click=\"select(pane)\">{{pane.title}}</a>" + "</li>" + "</ul>" + "<div class=\"tab-content\" ng-transclude></div>" + "</div>"
#  replace: true
