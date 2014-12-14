angular.module("firedash-directives").directive "animatedNumber", ->
  restrict: "E"
  require: "ngModel" # Must have an ngModel to get the animatedNumber
  scope:
    ngModel: '='
  template: "<span>{{value | numeraljs:'0.0a'}}</span>"
  controller: ($scope, $element, $timeout) ->
    $scope.$watch 'ngModel', (newVal, oldVal) ->
      if newVal?
        if oldVal? # Only up if we already have a value. This avoids counting up on refresh
          $scope.value = 0 unless $scope.value?
          $scope.countUp(parseFloat(newVal))
        else
          $scope.value = newVal
    $scope.countUp = (to) ->
      num_interval = (to - $scope.value) / 80
      if Math.abs(num_interval) > 10
        $scope.value += num_interval
        $timeout ->
          $scope.countUp(to)
        , 10
      else
        $scope.value = to