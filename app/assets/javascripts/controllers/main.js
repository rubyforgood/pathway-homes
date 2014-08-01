pathwayHomes.controller("MainCtlr", ["$scope", "$timeout", function($scope, $timeout) {
  $scope.notice = {type: "", message: ""};

  $scope.alert = function(message, type) {
    $scope.notice.type = "alert-" + type;
    console.log($scope.notice.type);
    $scope.notice.message = message;
  };

  $scope.$watch("notice.message", function(newValue) {
    $timeout(function() { $scope.notice.message = ""; }, 5000);
  });
}]);
