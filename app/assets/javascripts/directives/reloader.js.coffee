angular.module("firedash-directives").directive "reloader", ->
  restrict: "E"
  require: "minutes"
  scope:
    minutes: '@',
    manualReload: '='

  controller: ['$scope', '$element', '$interval','$window', ($scope, $element, $interval,$window) ->
    console.log "Setting reload timer for to fire in #{$scope.minutes} minutes"
    $interval ->
      $window.location.reload()
    , $scope.minutes * 60 * 1000

    $scope.$watch 'manualReload', (newVal, oldVal) ->
      $window.location.reload() if newVal? && oldVal?
  ]