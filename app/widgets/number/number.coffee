angular.module("widgets").directive "numberwidget", ->
  restrict: "E", # we are an element
#  transclude: true, #use if we should wrap content
  templateUrl: 'widgets/number.html',
  scope:
    title: '@'
    data: '='
  controller: ($scope, $element) ->
    $scope.updateDiff  = ->
      if $scope.data.current && $scope.data.budget
        $scope.difference = $scope.data.current - $scope.data.budget
        console.log $scope.difference

        $element.removeClass 'status-ok status-warning'

      if $scope.difference >= 0
        $element.addClass "status-ok"
      else
        $element.addClass "status-warning"

#    $scope.$watch 'data.budget', (newVal,oldVal) ->
#      $scope.updateDiff() if newVal

    $scope.$watch 'data.current', (newVal, oldVal) ->
      if newVal
        $scope.updateDiff()
        if oldVal && newVal > oldVal
          console.log "Yihaa!"
          $.get 'http://127.0.0.1:3000/easy', (data) ->



#class Dashing.Number extends Dashing.Widget
#  @accessor 'current', Dashing.AnimatedValue
#
#  @accessor 'difference', ->
#    if @get('last')
#      last = parseInt(@get('last'))
#      current = parseInt(@get('current'))
#      if last != 0
#        diff = Math.abs(Math.round((current - last) / last * 100))
#        "#{diff}%"
#    else
#      ""
#
#  @accessor 'arrow', ->
#    if @get('last')
#      if parseInt(@get('current')) > parseInt(@get('last')) then 'icon-arrow-up' else 'icon-arrow-down'
#
#  onData: (data) ->
#    if data.status
#      # clear existing "status-*" classes
#      $(@get('node')).attr 'class', (i,c) ->
#        c.replace /\bstatus-\S+/g, ''
#      # add new class
#      $(@get('node')).addClass "status-#{data.status}"
