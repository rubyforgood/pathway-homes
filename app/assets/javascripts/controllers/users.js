pathwayHomes.controller("UsersCtlr", ["$scope", "User", function($scope, User) {
  $scope.user = {};
  $scope.user.id = $('form').data('id');

  if ($scope.user.id) {
    User.get($scope.user.id).success(function(data) {
      $scope.user = data;
    });
  }

  $scope.save = function() {
  };
}]);
