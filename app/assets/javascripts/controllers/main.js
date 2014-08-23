pathwayHomes.controller("MainCtlr", ["$scope", "$timeout", "$route", "$routeParams", "$location", "User", function($scope, $timeout, $route, $routeParams, $location, User) {
  $scope.notice = {promise: null, type: "alert-info", message: ""};

  $scope.current_user_id = $('body').data('current-user-id');

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
    $scope.notice.type = "alert-info";
    $('.alert').data('alert', '');
  }
}]);
