angular.module("widgets").directive "numberwidget", ->
  restrict: "E", # we are an element
#  transclude: true, #use if we should wrap content
  templateUrl: 'widgets/number.html',
  scope:
    title: '@'
    data: '='
  controller: ['$scope', '$element', ($scope, $element) ->
    $scope.updateDiff  = ->
      if $scope.data.current? && $scope.data.budget?
        $scope.difference = $scope.data.current - $scope.data.budget

        $element.removeClass 'status-ok status-warning'

      if $scope.difference >= 0
        $element.addClass "status-ok"
      else
        $element.addClass "status-warning"

    $scope.$watch 'data.current', (newVal, oldVal) ->
      if newVal?
        $scope.updateDiff()
        if oldVal? && newVal > oldVal
          console.log "Yihaa!"
          $.get 'http://127.0.0.1:3000/easy', (data) ->

  ]