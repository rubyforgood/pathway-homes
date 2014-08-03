pathwayHomes.controller("UsersCtlr", ["$scope", "User", function($scope, User) {
  $scope.user = {};

  $scope.save = function() {
    //User.post($scope.user).
      //success(function(data) {
      //$scope.alert("Saved!", "success");
      //console.log(data);
    //}).
      //error(function(data) {
      //$scope.alert("Unable to save", "danger");
      //console.log(data);
    });
  };
}]);
