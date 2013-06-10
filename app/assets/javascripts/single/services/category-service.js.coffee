angular.module('antinoteApp').factory 'Category', ($resource) ->
  return $resource('/api/categories/:id', {id: '@id'}, {
    getData: {method: 'GET', isArray: false}
    })