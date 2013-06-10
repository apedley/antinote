angular.module('antinoteApp').controller 'AppCtrl', ($scope, Category, Note) ->
  $scope.selectedNote = null
  
  $scope.selectNote = (note) ->
    $scope.selectedNote = note
    console.log 'selected'
    console.log note