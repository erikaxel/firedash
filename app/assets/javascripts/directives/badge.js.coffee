angular.module("firedash-directives").directive "badge", ->
  restrict: "E"
  require: "ngModel"
  template: (element,attrs) -> "<span class=\"label label-as-badge\">{{filteredValue}}</span>"
  replace: true
  scope:
    ngModel: '='
    filter: '@'

  controller: ($scope, $element, $filter, $interpolate) ->
    $scope.$watch 'ngModel',(newVal, oldVal) ->
      if newVal?
        item = $scope.ngModel
        $element.removeClass('label-default label-success label-warning label-danger')
        if item.limit?
          val = parseFloat(item.value)
          addDefault = true
          for key,lim of item.limit
            if (!lim.upper? || lim.upper >= val) && (!lim.lower || lim.lower <= val)
#              console.log "#{item.value} should have status #{key}"
              $element.addClass("label-#{key}")
              addDefault = false
            $element.addClass("label-default") if addDefault
        else
          $element.addClass("label-default")

        # This is to make sure we can use our filter. There might be an easier way, but I have not found it
        $scope.filteredValue = $scope.$eval($interpolate("{{ngModel.value | #{$scope.filter} }}"))
