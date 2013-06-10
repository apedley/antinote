angular.module('antinoteApp').controller 'NoteCtrl', ($scope) ->
  $scope.test = 'test note text'
  $scope.editingTitle = false
  # TODO: Finish and clean this up
  $scope.doneEditingTitle = ->
    console.log 'done editing title'

  $scope.editTitle = (note) ->
    $scope.editingTitle = true