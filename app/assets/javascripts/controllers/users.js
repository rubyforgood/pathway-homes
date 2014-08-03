pathwayHomes.controller("UsersCtlr", ["$scope", "User", function($scope, User) {
  $scope.user = {};
  $scope.user.id = $('form').data('id');
  console.log($scope.user.id);

  if ($scope.user.id) {
    User.get($scope.user.id).success(function(data) {
      $scope.user = data;
      console.log(data);
    });
  }

  $scope.save = function() {
   // User.post($scope.user).
      //success(function(data) {
      //$scope.alert("Saved!", "success");
      //console.log(data);
    //}).
      //error(function(data) {
      //$scope.alert("Unable to save", "danger");
      //console.log(data);
    //  });
  };
}]);
