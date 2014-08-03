pathwayHomes.controller('UserIndexController', ['$scope', 'User', function ($scope, User) {
  $scope.page = 1;
  $scope.fetches = 1;

  User.index().success(function(data) {
    $scope.users = data;
    console.log($scope.users);
  });

}]);
