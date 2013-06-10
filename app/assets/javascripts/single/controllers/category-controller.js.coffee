
angular.module('antinoteApp').controller 'CategoryCtrl', ($scope, Category, Note) ->
  $scope.test = 'test text'
  $scope.categories = Category.query()
  $scope.singleCategoryShown = false

  $scope.showCategory = (category) ->
    if not $scope.singleCategoryShown
      cat = Category.getData({id: category.id})

      $scope.categories = [cat]
      $scope.singleCategoryShown = true

  $scope.showAllCategories = ->
    $scope.categories = Category.query()
    $scope.singleCategoryShown = false

  $scope.showNote = (note) ->
    note = Note.getData({id: note.id})
    $scope.selectNote(note)