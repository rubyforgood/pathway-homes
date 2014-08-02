pathwayHomes.controller("MainCtlr", ["$scope", "$timeout", "$route", "$routeParams", "$location", function($scope, $timeout, $route, $routeParams, $location) {
  //$scope.$route = $route;
  //$scope.$location = $location;
  //$scope.$routeParams = $routeParams;
  $scope.notice = {promise: null, type: "alert-info", message: ""};

  $scope.alert = function(message, type) {
    $scope.notice.type = "alert-" + type;
    $scope.notice.message = message;
  };

  $scope.$watch("notice.message", function(newValue) {
    $timeout.cancel($scope.notice.promise);
    $scope.notice.promise = $timeout(function() { $scope.notice.message = ""; }, 5000);
  });

  if ($('.alert').data('alert')) {
    alert = $('.alert').data('alert');
    $scope.notice.message = alert;
    $scope.notice.type = "alert-danger";
    $('.alert').data('alert', '');
  }
}]);
